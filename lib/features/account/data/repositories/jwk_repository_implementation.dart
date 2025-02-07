import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../domain/entities/aptos_derivation_path.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/jwk_repository.dart';
import '../models/local/hd_key_local_model.dart';
import '../models/local/jwk_local_model.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/auth_key_config_local_data_source.dart';
import '../sources/local/entropy_local_data_source.dart';
import '../sources/local/hd_key_local_data_source.dart';
import '../sources/local/jwk_local_data_source.dart';
import '../sources/local/private_jwk_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

class JwkRepository implements IJwkRepository {
  JwkRepository({
    required Store store,
    required JwkDataSource jwkDataSource,
    required HDKeyDataSource hdKeyDataSource,
    required SigningKeyDataSource signingKeyDataSource,
    required Ed25519AuthKeyConfigDataSource ed25519AuthKeyConfigDataSource,
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
  final Ed25519AuthKeyConfigDataSource _ed25519AuthKeyConfigDataSource;
  final EntropyDataSource _entropyDataSource;
  final PrivateJwkDataSource _privateJwkDataSource;

  @override
  Future<Jwk> store({required Jwk jwk, required KeySourceConfig config}) async {
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

    return _store.runInTransaction(TxMode.write, () {
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

      return _jwkDataSource.store(jwk).toDomain();
    });
  }

  @override
  Future<void> delete({required Uint8List keyId}) async {
    if (_ed25519AuthKeyConfigDataSource.getByKeyId(keyId: keyId) != null) {
      throw StateError('Cannot delete: JWK is used in auth configuration');
    }

    final HDKeyLocalModel? hdConfig = _hdKeyDataSource.getByKeyId(keyId: keyId);
    final SigningKeyLocalModel? signingConfig =
        _signingKeyDataSource.getByKeyId(keyId: keyId);

    bool shouldDeleteEntropy = false;
    bool shouldDeletePrivateJwk = false;

    if (hdConfig != null) {
      shouldDeleteEntropy = _hdKeyDataSource
              .getByEntropy(entropyHash: hdConfig.entropyHash)
              .length <=
          1;
    }

    if (signingConfig != null) {
      shouldDeletePrivateJwk =
          _signingKeyDataSource.getByKeyId(keyId: keyId) != null;
    }

    return _store.runInTransaction(TxMode.write, () {
      _jwkDataSource.deleteByKeyId(keyId: keyId);
      _hdKeyDataSource.deleteByKeyId(keyId: keyId);
      _signingKeyDataSource.deleteByKeyId(keyId: keyId);

      if (shouldDeleteEntropy && hdConfig != null) {
        _entropyDataSource.delete(hash: hdConfig.entropyHash);
      }

      if (shouldDeletePrivateJwk) {
        _privateJwkDataSource.delete(keyId: keyId);
      }
    });
  }

  @override
  Future<void> deleteMany(List<Uint8List> keyIds) async {
    for (final Uint8List keyId in keyIds) {
      await delete(keyId: keyId);
    }
  }

  @override
  Future<void> clear() async {
    // First get all data and perform checks
    final List<JwkLocalModel> jwks = _jwkDataSource.getAll();

    // Check for auth configuration usage
    for (final JwkLocalModel jwk in jwks) {
      if (_ed25519AuthKeyConfigDataSource.getByKeyId(keyId: jwk.keyId) !=
          null) {
        throw StateError(
          'Cannot clear: some JWKs are used in auth configuration',
        );
      }
    }

    final List<HDKeyLocalModel> hdConfigs = _hdKeyDataSource.getAll();
    final List<SigningKeyLocalModel> signingConfigs =
        _signingKeyDataSource.getAll();

    _store.runInTransaction(TxMode.write, () {
      _jwkDataSource.clear();
      _hdKeyDataSource.clear();
      _signingKeyDataSource.clear();
    });

    // Perform cleanup operations after transaction
    for (final HDKeyLocalModel config in hdConfigs) {
      await _entropyDataSource.delete(hash: config.entropyHash);
    }

    for (final SigningKeyLocalModel config in signingConfigs) {
      await _privateJwkDataSource.delete(keyId: config.jwkKeyId);
    }
  }

  @override
  Jwk? get({required Uint8List keyId}) =>
      _jwkDataSource.getByKeyId(keyId: keyId)?.toDomain();

  @override
  bool has({required Uint8List keyId}) =>
      _jwkDataSource.getByKeyId(keyId: keyId) != null;

  @override
  List<Jwk> getAll() => _jwkDataSource
      .getAll()
      .map((JwkLocalModel model) => model.toDomain())
      .toList();

  @override
  int count() => _jwkDataSource.count();

  @override
  HDKeySourceConfig? getHDKeySourceConfig({required Uint8List keyId}) {
    final HDKeyLocalModel? hdKey = _hdKeyDataSource.getByKeyId(keyId: keyId);
    if (hdKey == null) {
      return null;
    }
    return HDKeySourceConfig(
      entropyHash: hdKey.entropyHash,
      derivationPath: AptosDerivationPath.fromBytes(hdKey.derivationPath),
    );
  }

  @override
  SigningKeySourceConfig? getSigningKeySourceConfig({
    required Uint8List keyId,
  }) {
    final SigningKeyLocalModel? key =
        _signingKeyDataSource.getByKeyId(keyId: keyId);
    if (key == null) {
      return null;
    }
    return SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint);
  }

  @override
  List<(Uint8List, HDKeySourceConfig)> getAllHDKeySourceConfigs() =>
      _hdKeyDataSource
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
          .toList();

  @override
  List<(Uint8List, SigningKeySourceConfig)> getAllSigningKeySourceConfigs() =>
      _signingKeyDataSource
          .getAll()
          .map(
            (SigningKeyLocalModel key) => (
              key.jwkKeyId,
              SigningKeySourceConfig(jwkThumbprint: key.jwkThumbprint)
            ),
          )
          .toList();
}
