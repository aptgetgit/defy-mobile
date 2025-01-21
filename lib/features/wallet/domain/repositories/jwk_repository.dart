import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';

part 'generated/jwk_repository.freezed.dart';

@freezed
sealed class KeySourceConfig with _$KeySourceConfig {
  const factory KeySourceConfig.fromHdKey({
    required Uint8List entropyHash,
    required AptosDerivationPath derivationPath,
  }) = HdKeySourceConfig;

  const factory KeySourceConfig.fromSigningKey({
    required Uint8List jwkThumbprint,
  }) = SigningKeySourceConfig;
}

abstract class IJwkRepository {
  int storeJwkWithKeySourceConfig({
    required Jwk jwk,
    required KeySourceConfig config,
  });

  Jwk? findJwkByKeyId({required Uint8List jwkKeyId});

  bool hasJwkWithKeyId({required Uint8List jwkKeyId});

  HdKeySourceConfig? findHDKeySourceConfigByJwKeyId({
    required Uint8List jwkKeyId,
  });

  SigningKeySourceConfig? findSigningKeySourceConfigByJwKeyId({
    required Uint8List jwkKeyId,
  });

  List<HdKeySourceConfig> findHDKeySourceConfigsByEntropyHash({
    required Uint8List entropyHash,
  });

  List<Jwk> findJwksByEntropyHash({
    required Uint8List entropyHash,
  });

  void deleteJwkByKeyId({required Uint8List jwkKeyId});

  int getJwkCount();

  List<Jwk> getAllJwks();

  List<HdKeySourceConfig> getAllHDKeySourceConfigs();

  List<SigningKeySourceConfig> getAllSigningKeySourceConfigs();
}
