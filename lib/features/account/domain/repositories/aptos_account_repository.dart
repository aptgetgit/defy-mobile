import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/account_address.dart';
import '../entities/aptos_account.dart';
import '../entities/authentication_key.dart';
import '../entities/authentication_key_scheme.dart';

part 'generated/aptos_account_repository.freezed.dart';

@freezed
sealed class AuthenticatorConfig with _$AuthenticatorConfig {
  const factory AuthenticatorConfig.ed25519({
    required Uint8List keyId,
  }) = Ed25519AuthenticatorConfig;

  const AuthenticatorConfig._();

  AuthenticationKeyScheme get scheme => switch (this) {
        Ed25519AuthenticatorConfig() => AuthenticationKeyScheme.ed25519,
      };
}

abstract class IAptosAccountRepository {
  AptosAccount createAccount({
    required AuthenticatorConfig config,
    AccountAddress? accountAddress,
  });

  AptosAccount? getByAddress({required AccountAddress accountAddress});

  List<AptosAccount> getByAuthKey({required AuthenticationKey authKey});

  List<AptosAccount> getByAuthScheme({required AuthenticationKeyScheme scheme});

  List<AptosAccount> getAll();

  int count();

  bool hasAddress({required AccountAddress accountAddress});

  AuthenticatorConfig? getAuthConfigByAuthKey({
    required AuthenticationKey authKey,
  });

  AuthenticatorConfig? getEd25519AuthConfigsByJwkKeyId({
    required Uint8List keyId,
  });

  // void updateAuthKey({
  //   required AccountAddress accountAddress,
  //   required AuthenticationKey newAuthKey,
  // });

  void deleteByAddress({required AccountAddress accountAddress});

  void deleteMany(List<AccountAddress> accountAddresses);

  void clear();
}
