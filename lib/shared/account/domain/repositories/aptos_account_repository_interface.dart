import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/account_address.dart';
import '../entities/aptos_account_with_metadata.dart';
import '../entities/authentication_key.dart';
import '../entities/authentication_key_scheme.dart';

part 'generated/aptos_account_repository_interface.freezed.dart';

@freezed
sealed class AuthenticatorConfig with _$AuthenticatorConfig {
  const factory AuthenticatorConfig.ed25519({
    required Uint8List keyId,
  }) = Ed25519AuthenticatorConfig;

  const AuthenticatorConfig._();

  AuthenticationKeyScheme get scheme => switch (this) {
        Ed25519AuthenticatorConfig() => AuthenticationKeyScheme.ed25519,
      };

  @override
  String toString() => 'AuthenticatorConfig{'
      '\n scheme: $scheme,'
      '\n keyId: $keyId'
      '\n}';
}

abstract class IAptosAccountRepository {
  AptosAccountWithMetadata createAccount({
    required String label,
    required Uri iconUri,
    required AuthenticatorConfig config,
    AccountAddress? accountAddress,
  });

  AptosAccountWithMetadata? getByAddress(
      {required AccountAddress accountAddress,});

  AptosAccountWithMetadata? getByLabel({required String label});

  List<AptosAccountWithMetadata> getByAuthKey(
      {required AuthenticationKey authKey,});

  List<AptosAccountWithMetadata> getByAuthScheme(
      {required AuthenticationKeyScheme scheme,});

  List<AptosAccountWithMetadata> getAll();

  int count();

  bool hasAddress({required AccountAddress accountAddress});

  bool hasLabel({required String label});

  AuthenticatorConfig? getAuthConfigByAuthKey({
    required AuthenticationKey authKey,
  });

  AuthenticatorConfig? getEd25519AuthConfigsByJwkKeyId({
    required Uint8List keyId,
  });

  void updateLabel({
    required AccountAddress accountAddress,
    required String newLabel,
  });

  void updateIconUri({
    required AccountAddress accountAddress,
    required Uri newIconUri,
  });

  void deleteByAddress({required AccountAddress accountAddress});

  void deleteByLabel({required String label});

  void deleteMany(List<AccountAddress> accountAddresses);

  void clear();
}
