import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
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
      :final AptosDerivationPath derivationPath,
    ) =>
      'HDKeySourceConfig{'
          '\n entropyHash: $entropyHash,'
          '\n derivationPath: $derivationPath'
          '\n}',
    SigningKeySourceConfig(:final Uint8List jwkThumbprint) =>
      'SigningKeySourceConfig{'
          '\n jwkThumbprint: $jwkThumbprint'
          '\n}',
  };
}

abstract class IJwkRepository {
  TaskEither<ExceptionWithStackTrace, Jwk> store({
    required Jwk jwk,
    required KeySourceConfig config,
  });

  IOEither<ExceptionWithStackTrace, Option<Jwk>> get({
    required Uint8List keyId,
  });

  IOEither<ExceptionWithStackTrace, Set<Jwk>> getAll();

  IOEither<ExceptionWithStackTrace, int> count();

  IOEither<ExceptionWithStackTrace, bool> has({required Uint8List keyId});

  IOEither<ExceptionWithStackTrace, Option<HDKeySourceConfig>>
  getHDKeySourceConfig({required Uint8List keyId});

  IOEither<ExceptionWithStackTrace, Option<SigningKeySourceConfig>>
  getSigningKeySourceConfig({required Uint8List keyId});

  TaskEither<ExceptionWithStackTrace, void> delete({required Uint8List keyId});

  TaskEither<ExceptionWithStackTrace, void> deleteMany({
    required Set<Uint8List> keyIds,
  });

  TaskEither<ExceptionWithStackTrace, void> clear();

  IOEither<ExceptionWithStackTrace, Set<(Uint8List, HDKeySourceConfig)>>
  getAllHDKeySourceConfigs();

  IOEither<ExceptionWithStackTrace, Set<(Uint8List, SigningKeySourceConfig)>>
  getAllSigningKeySourceConfigs();
}
