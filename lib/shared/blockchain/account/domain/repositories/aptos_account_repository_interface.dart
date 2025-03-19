import 'dart:typed_data';
import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/authentication_key.dart';
import '../entities/authentication_key_scheme.dart';

part 'generated/aptos_account_repository_interface.freezed.dart';

@freezed
sealed class AuthenticatorConfig with _$AuthenticatorConfig {
  const factory AuthenticatorConfig.ed25519({required Uint8List keyId}) =
      Ed25519AuthenticatorConfig;

  const AuthenticatorConfig._();

  AuthenticationKeyScheme get scheme => switch (this) {
    Ed25519AuthenticatorConfig() => AuthenticationKeyScheme.ed25519,
  };

  @override
  String toString() =>
      'AuthenticatorConfig{'
      '\n scheme: $scheme,'
      '\n keyId: $keyId'
      '\n}';
}

abstract class IAptosAccountRepository {
  TaskEither<ExceptionWithStackTrace, AptosAccountWithMetadata> createAccount({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AuthenticatorConfig config,
    Option<AccountAddress> accountAddress = const Option<AccountAddress>.none(),
  });

  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getByAddress({required AccountAddress accountAddress});

  TaskEither<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
  getByLabel({required String label});

  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
  getByAuthKey({required AuthenticationKey authKey});

  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
  getByAuthScheme({required AuthenticationKeyScheme scheme});

  TaskEither<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>> getAll();

  IOEither<ExceptionWithStackTrace, int> count();

  IOEither<ExceptionWithStackTrace, bool> hasAddress({
    required AccountAddress accountAddress,
  });

  IOEither<ExceptionWithStackTrace, bool> hasLabel({required String label});

  TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
  getAuthConfigByAuthKey({required AuthenticationKey authKey});

  TaskEither<ExceptionWithStackTrace, Option<AuthenticatorConfig>>
  getEd25519AuthConfigsByJwkKeyId({required Uint8List keyId});

  TaskEither<ExceptionWithStackTrace, Unit> updateLabel({
    required AccountAddress accountAddress,
    required String newLabel,
  });

  TaskEither<ExceptionWithStackTrace, Unit> updateIconUri({
    required AccountAddress accountAddress,
    required Uri newIconUri,
  });

  TaskEither<ExceptionWithStackTrace, Unit> updateBackgroundColor({
    required AccountAddress accountAddress,
    required Color newBackgroundColor,
  });

  TaskEither<ExceptionWithStackTrace, Unit> deleteByAddress({
    required AccountAddress accountAddress,
  });

  TaskEither<ExceptionWithStackTrace, Unit> deleteByLabel({
    required String label,
  });

  TaskEither<ExceptionWithStackTrace, Unit> deleteMany({
    required Set<AccountAddress> accountAddresses,
  });

  TaskEither<ExceptionWithStackTrace, Unit> clear();
}
