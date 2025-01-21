import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/account_address.dart';
import '../entities/aptos_account.dart';
import '../entities/authentication_key.dart';
import '../entities/authentication_key_scheme.dart';
import '../entities/json_web_key.dart';

part 'generated/aptos_account_repository.freezed.dart';

@freezed
sealed class AuthenticatorConfig with _$AuthenticatorConfig {
  const factory AuthenticatorConfig.ed25519({
    required Jwk jwk,
  }) = Ed25519AuthenticatorConfig;
}

abstract class IAptosAccountRepository {
  int storeAccountWithAuthenticatorConfig({
    required AccountAddress accountAddress,
    required AuthenticationKey authenticationKey,
    required AuthenticatorConfig authenticatorConfig,
  });

  void deleteAccountByAddress({
    required AccountAddress accountAddress,
  });

  List<AptosAccount> findAccountsByJwkKeyId({required Uint8List jwkKeyId});

  List<AptosAccount> findAccountsByAuthKey({
    required AuthenticationKey authenticationKey,
  });
  List<AptosAccount> findAccountsByAuthKeyScheme({
    required AuthenticationKeyScheme authenticationKeyScheme,
  });

  void updateAuthKey({
    required AccountAddress accountAddress,
    required AuthenticationKey newAuthKey,
  });

  bool hasAccountWithAddress({
    required AccountAddress accountAddress,
  });

  AptosAccount? findAccountByAddress({
    required AccountAddress accountAddress,
  });

  AuthenticatorConfig? findAuthConfigByAuthenticationKey({
    required AuthenticationKey authenticationKey,
  });

  List<AuthenticatorConfig> findAuthConfigsByJwkKeyId({
    required Uint8List jwkKeyId,
  });

  List<AptosAccount> getAllAccounts();

  int getAccountCount();
}
