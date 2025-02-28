import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/aptos_derivation_path.dart';
import '../entities/json_web_key.dart';

part 'generated/jwk_repository_interface.freezed.dart';

@freezed
sealed class KeySourceConfig with _$KeySourceConfig {
  const factory KeySourceConfig.fromHDKey({
    required Uint8List entropyHash,
    required AptosDerivationPath derivationPath,
  }) = HDKeySourceConfig;

  const factory KeySourceConfig.fromSigningKey({
    required Uint8List jwkThumbprint,
  }) = SigningKeySourceConfig;

  @override
  String toString() => switch (this) {
        HDKeySourceConfig(
          :final Uint8List entropyHash,
          :final AptosDerivationPath derivationPath
        ) =>
          'HDKeySourceConfig{'
              '\n entropyHash: $entropyHash,'
              '\n derivationPath: $derivationPath'
              '\n}',
        SigningKeySourceConfig(:final Uint8List jwkThumbprint) =>
          'SigningKeySourceConfig{'
              '\n jwkThumbprint: $jwkThumbprint'
              '\n}'
      };
}

abstract class IJwkRepository {
  Future<Jwk> store({
    required Jwk jwk,
    required KeySourceConfig config,
  });

  Jwk? get({required Uint8List keyId});

  Set<Jwk> getAll();

  int count();

  bool has({required Uint8List keyId});

  HDKeySourceConfig? getHDKeySourceConfig({
    required Uint8List keyId,
  });

  SigningKeySourceConfig? getSigningKeySourceConfig({
    required Uint8List keyId,
  });

  void delete({required Uint8List keyId});

  void deleteMany(Set<Uint8List> keyIds);

  void clear();

  Set<(Uint8List, HDKeySourceConfig)> getAllHDKeySourceConfigs();

  Set<(Uint8List, SigningKeySourceConfig)> getAllSigningKeySourceConfigs();
}
