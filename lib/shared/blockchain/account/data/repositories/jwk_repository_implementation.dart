import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../../core/logging/app_logger.dart';
import '../../domain/entities/aptos_derivation_path.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/jwk_repository_interface.dart';
import '../models/local/hd_key_local_model.dart';
import '../models/local/jwk_local_model.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/ed25519_auth_key_config_local_data_source.dart';
import '../sources/local/entropy_local_data_source.dart';
import '../sources/local/hd_key_local_data_source.dart';
import '../sources/local/jwk_local_data_source.dart';
import '../sources/local/private_jwk_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

typedef _DeletionResult = ({
  bool shouldDeleteEntropy,
  bool shouldDeletePrivateKey,
  Uint8List? entropyHash,
});

class JwkRepository implements IJwkRepository {
  JwkRepository({
    required Store store,
    required JwkDataSource jwkDataSource,
    required HDKeyDataSource hdKeyDataSource,
    required SigningKeyDataSource signingKeyDataSource,
    required Ed25519AuthKeyConfigLocalDataSource ed25519AuthKeyConfigDataSource,
    required EntropyDataSource entropyDataSource,
    required PrivateJwkDataSource privateJwkDataSource,
  })  : _store = store,
        _jwkDataSource = jwkDataSource,
        _hdKeyDataSource = hdKeyDataSource,
        _signingKeyDataSource = signingKeyDataSource,
        _ed25519AuthKeyConfigDataSource = ed25519AuthKeyConfigDataSource,
        _entropyDataSource = entropyDataSource,
        _privateJwkDataSource = privateJwkDataSource;

  final Store _store;
  final JwkDataSource _jwkDataSource;
  final HDKeyDataSource _hdKeyDataSource;
  final SigningKeyDataSource _signingKeyDataSource;
  final Ed25519AuthKeyConfigLocalDataSource _ed25519AuthKeyConfigDataSource;
  final EntropyDataSource _entropyDataSource;
  final PrivateJwkDataSource _privateJwkDataSource;

  @override
  @override
  Future<Jwk> store({required Jwk jwk, required KeySourceConfig config}) async {
    try {
      switch (config) {
        case HDKeySourceConfig(
            :final Uint8List entropyHash,
          ):
          if (!await _entropyDataSource.has(hash: entropyHash)) {
            throw StateError('Cannot store: entropy not found');
          }

        case SigningKeySourceConfig():
          if (!await _privateJwkDataSource.has(keyId: jwk.keyId)) {
            throw StateError('Cannot store: private key not found');
          }
      }

      final Jwk result = await _store.runInTransaction(TxMode.write, () {
        switch (config) {
          case HDKeySourceConfig(
              :final Uint8List entropyHash,
              :final AptosDerivationPath derivationPath
            ):
            _hdKeyDataSource.store(
              keyId: jwk.keyId,
              entropyHash: entropyHash,
              derivationPath: derivationPath.toBytes(),
            );

          case SigningKeySourceConfig(:final Uint8List jwkThumbprint):
            _signingKeyDataSource.store(
              keyId: jwk.keyId,
              jwkThumbprint: jwkThumbprint,
            );
        }

        return _jwkDataSource.store(jwk: jwk).toDomain();
      });
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to store JWK',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  _DeletionResult _performKeyDeletion({required Uint8List keyId}) {
    if (_ed25519AuthKeyConfigDataSource.getByKeyId(keyId: keyId) != null) {
      throw StateError('Cannot delete: JWK is used in auth configuration');
    }

    final HDKeyLocalModel? hdConfig = _hdKeyDataSource.getByKeyId(keyId: keyId);
    final SigningKeyLocalModel? signingConfig =
        _signingKeyDataSource.getByKeyId(keyId: keyId);

    final bool shouldDeleteEntropy = hdConfig != null &&
        _hdKeyDataSource
                .getByEntropy(entropyHash: hdConfig.entropyHash)
                .length <=
            1;

    final bool shouldDeletePrivateKey = signingConfig != null &&
        _signingKeyDataSource.getByKeyId(keyId: keyId) != null;

    _jwkDataSource.deleteByKeyId(keyId: keyId);
    _hdKeyDataSource.deleteByKeyId(keyId: keyId);
    _signingKeyDataSource.deleteByKeyId(keyId: keyId);

    return (
      shouldDeleteEntropy: shouldDeleteEntropy,
      shouldDeletePrivateKey: shouldDeletePrivateKey,
      entropyHash: hdConfig?.entropyHash,
    );
  }

  @override
  Future<void> delete({required Uint8List keyId}) async {
    try {
      final _DeletionResult result = await _store.runInTransaction(
        TxMode.write,
        () => _performKeyDeletion(keyId: keyId),
      );
      if (result.shouldDeleteEntropy && result.entropyHash != null) {
        await _entropyDataSource.delete(hash: result.entropyHash!);
      }
      if (result.shouldDeletePrivateKey) {
        await _privateJwkDataSource.delete(keyId: keyId);
      }
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete JWK',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteMany(Set<Uint8List> keyIds) async {
    try {
      if (keyIds.isEmpty) {
        return;
      }

      final Set<_DeletionResult> results = await _store.runInTransaction(
        TxMode.write,
        () => keyIds
            .map((Uint8List keyId) => _performKeyDeletion(keyId: keyId))
            .toSet(),
      );

      for (int i = 0; i < results.length; i++) {
        final _DeletionResult result = results.elementAt(i);
        if (result.shouldDeleteEntropy && result.entropyHash != null) {
          await _entropyDataSource.delete(hash: result.entropyHash!);
        }
        if (result.shouldDeletePrivateKey) {
          await _privateJwkDataSource.delete(keyId: keyIds.elementAt(i));
        }
      }
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete multiple JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      final Set<JwkLocalModel> jwks = _jwkDataSource.getAll();

      for (final JwkLocalModel jwk in jwks) {
        if (_ed25519AuthKeyConfigDataSource.getByKeyId(keyId: jwk.keyId) !=
            null) {
          throw StateError(
            'Cannot clear: some JWKs are used in auth configuration',
          );
        }
      }
      final Set<HDKeyLocalModel> hdConfigs = _hdKeyDataSource.getAll();
      final Set<SigningKeyLocalModel> signingConfigs =
          _signingKeyDataSource.getAll();

      _store.runInTransaction(TxMode.write, () {
        _jwkDataSource.clear();
        _hdKeyDataSource.clear();
        _signingKeyDataSource.clear();
      });

      for (final HDKeyLocalModel config in hdConfigs) {
        await _entropyDataSource.delete(hash: config.entropyHash);
      }

      for (final SigningKeyLocalModel config in signingConfigs) {
        await _privateJwkDataSource.delete(keyId: config.jwkKeyId);
      }
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to clear JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Jwk? get({required Uint8List keyId}) {
    try {
      return _jwkDataSource.getByKeyId(keyId: keyId)?.toDomain();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve JWK',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  bool has({required Uint8List keyId}) {
    try {
      return _jwkDataSource.getByKeyId(keyId: keyId) != null;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to check JWK existence',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Set<Jwk> getAll() {
    try {
      return _jwkDataSource
          .getAll()
          .map((JwkLocalModel model) => model.toDomain())
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  int count() {
    try {
      return _jwkDataSource.count();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to count JWKs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  HDKeySourceConfig? getHDKeySourceConfig({required Uint8List keyId}) {
    try {
      final HDKeyLocalModel? hdKey = _hdKeyDataSource.getByKeyId(keyId: keyId);
      if (hdKey == null) {
        return null;
      }
      return HDKeySourceConfig(
        entropyHash: hdKey.entropyHash,
        derivationPath: AptosDerivationPath.fromBytes(hdKey.derivationPath),
      );
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve HD key config',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  SigningKeySourceConfig? getSigningKeySourceConfig({
    required Uint8List keyId,
  }) {
    try {
      final SigningKeyLocalModel? key =
          _signingKeyDataSource.getByKeyId(keyId: keyId);
      if (key == null) {
        return null;
      }
      return SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint);
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve signing key config',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Set<(Uint8List, HDKeySourceConfig)> getAllHDKeySourceConfigs() {
    try {
      return _hdKeyDataSource
          .getAll()
          .map(
            (HDKeyLocalModel key) => (
              key.jwkKeyId,
              HDKeySourceConfig(
                entropyHash: key.entropyHash,
                derivationPath:
                    AptosDerivationPath.fromBytes(key.derivationPath),
              )
            ),
          )
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all HD key configs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Set<(Uint8List, SigningKeySourceConfig)> getAllSigningKeySourceConfigs() {
    try {
      return _signingKeyDataSource
          .getAll()
          .map(
            (SigningKeyLocalModel key) => (
              key.jwkKeyId,
              SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint)
            ),
          )
          .toSet();
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to retrieve all signing key configs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
