import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../domain/entities/aptos_derivation_path.dart';
import '../../domain/entities/json_web_key.dart';
import '../../domain/repositories/jwk_repository.dart';
import '../models/local/hd_key_local_model.dart';
import '../models/local/jwk_local_model.dart';
import '../models/local/signing_key_local_model.dart';
import '../sources/local/hd_key_local_data_source.dart';
import '../sources/local/public_key_local_data_source.dart';
import '../sources/local/signing_key_local_data_source.dart';

class JwkRepository implements IJwkRepository {
  JwkRepository(this._store)
      : _jwkLocalDataSource = JwkLocalDataSource(_store.box<JwkLocalModel>()),
        _hdKeyLocalDataSource =
            HDKeyLocalDataSource(_store.box<HDKeyLocalModel>()),
        _signingKeyLocalDataSource =
            SigningKeyLocalDataSource(_store.box<SigningKeyLocalModel>());

  final Store _store;
  final JwkLocalDataSource _jwkLocalDataSource;
  final HDKeyLocalDataSource _hdKeyLocalDataSource;
  final SigningKeyLocalDataSource _signingKeyLocalDataSource;
  @override
  Jwk storeJwkWithKeySourceConfig({
    required Jwk jwk,
    required KeySourceConfig config,
  }) =>
      _store.runInTransaction(TxMode.write, () {
        if (_jwkLocalDataSource.findPublicKeyByKeyId(keyId: jwk.keyId) !=
            null) {
          throw StateError('JWK with this key ID already exists');
        }
        switch (config) {
          case HdKeySourceConfig(
              :final Uint8List entropyHash,
              :final AptosDerivationPath derivationPath
            ):
            if (_hdKeyLocalDataSource.findHDKeyByJwkKeyId(
                  jwkKeyId: jwk.keyId,
                ) !=
                null) {
              throw StateError('HD key config already exists for this JWK');
            }

            _hdKeyLocalDataSource.putHDKey(
              jwkKeyId: jwk.keyId,
              entropyHash: entropyHash,
              derivationPath: derivationPath.toBytes(),
            );

          case SigningKeySourceConfig(:final Uint8List jwkThumbprint):
            if (_signingKeyLocalDataSource.findKeyByJwkKeyId(
                  jwkKeyId: jwk.keyId,
                ) !=
                null) {
              throw StateError(
                'Signing key config already exists for this JWK',
              );
            }

            _signingKeyLocalDataSource.putSigningKey(
              jwkKeyId: jwk.keyId,
              jwkThumbprint: jwkThumbprint,
            );
        }

        return _jwkLocalDataSource.putJwk(jwk).toDomain();
      });

  @override
  void deleteJwkByKeyId({required Uint8List jwkKeyId}) {
    _store.runInTransaction(TxMode.write, () {
      _jwkLocalDataSource.removeKeyByKeyId(keyId: jwkKeyId);
      _hdKeyLocalDataSource.removeKeyByJwkKeyId(jwkKeyId: jwkKeyId);
      _signingKeyLocalDataSource.removeKeyByJwkKeyId(jwkKeyId: jwkKeyId);
    });
  }

  @override
  Jwk? findJwkByKeyId({required Uint8List jwkKeyId}) {
    final JwkLocalModel? model =
        _jwkLocalDataSource.findPublicKeyByKeyId(keyId: jwkKeyId);
    return model?.toDomain();
  }

  @override
  bool hasJwkWithKeyId({required Uint8List jwkKeyId}) =>
      _jwkLocalDataSource.findPublicKeyByKeyId(keyId: jwkKeyId) != null;

  @override
  HdKeySourceConfig? findHDKeySourceConfigByJwKeyId({
    required Uint8List jwkKeyId,
  }) {
    final HDKeyLocalModel? hdKey =
        _hdKeyLocalDataSource.findHDKeyByJwkKeyId(jwkKeyId: jwkKeyId);
    if (hdKey == null) {
      return null;
    }

    return HdKeySourceConfig(
      entropyHash: hdKey.entropyHash,
      derivationPath: AptosDerivationPath.fromBytes(hdKey.derivationPath),
    );
  }

  @override
  SigningKeySourceConfig? findSigningKeySourceConfigByJwKeyId({
    required Uint8List jwkKeyId,
  }) {
    final SigningKeyLocalModel? signingKey =
        _signingKeyLocalDataSource.findKeyByJwkKeyId(jwkKeyId: jwkKeyId);
    if (signingKey == null) {
      return null;
    }

    return SigningKeySourceConfig(
      jwkThumbprint: signingKey.jwkThumbprint,
    );
  }

  @override
  List<HdKeySourceConfig> findHDKeySourceConfigsByEntropyHash({
    required Uint8List entropyHash,
  }) {
    final List<HDKeyLocalModel> hdKeys =
        _hdKeyLocalDataSource.findHDKeysByEntropyHash(
      entropyHash: entropyHash,
    );

    return hdKeys
        .map(
          (HDKeyLocalModel hdKey) => HdKeySourceConfig(
            entropyHash: hdKey.entropyHash,
            derivationPath: AptosDerivationPath.fromBytes(hdKey.derivationPath),
          ),
        )
        .toList();
  }

  @override
  List<Jwk> findJwksByEntropyHash({
    required Uint8List entropyHash,
  }) {
    final List<HDKeyLocalModel> hdKeys =
        _hdKeyLocalDataSource.findHDKeysByEntropyHash(
      entropyHash: entropyHash,
    );

    return hdKeys
        .map(
          (HDKeyLocalModel hdKey) => _jwkLocalDataSource.findPublicKeyByKeyId(
            keyId: hdKey.jwkKeyId,
          ),
        )
        .where((JwkLocalModel? jwk) => jwk != null)
        .map((JwkLocalModel? jwk) => jwk!.toDomain())
        .toList();
  }

  @override
  int getJwkCount() => _jwkLocalDataSource.countKeys();

  @override
  List<Jwk> getAllJwks() => _jwkLocalDataSource
      .getAllKeys()
      .map((JwkLocalModel model) => model.toDomain())
      .toList();

  @override
  List<HdKeySourceConfig> getAllHDKeySourceConfigs() => _hdKeyLocalDataSource
      .getAllKeys()
      .map(
        (HDKeyLocalModel hdKey) => HdKeySourceConfig(
          entropyHash: hdKey.entropyHash,
          derivationPath: AptosDerivationPath.fromBytes(hdKey.derivationPath),
        ),
      )
      .toList();

  @override
  List<SigningKeySourceConfig> getAllSigningKeySourceConfigs() =>
      _signingKeyLocalDataSource
          .getAllKeys()
          .map(
            (SigningKeyLocalModel signingKey) => SigningKeySourceConfig(
              jwkThumbprint: signingKey.jwkThumbprint,
            ),
          )
          .toList();
}
