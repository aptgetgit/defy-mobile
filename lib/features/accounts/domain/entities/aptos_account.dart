import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_address.dart';
import 'authentication_key.dart';
import 'authentication_key_scheme.dart';

part 'generated/aptos_account.freezed.dart';

@freezed
class AptosAccount with _$AptosAccount {
  const factory AptosAccount({
    required AccountAddress accountAddress,
    required AuthenticationKey authenticationKey,
  }) = _AptosAccount;

  const AptosAccount._();

  factory AptosAccount.fromAuthenticationKey({
    required AuthenticationKey authenticationKey,
  }) =>
      AptosAccount(
        accountAddress: AccountAddress.fromAuthenticationKey(
          authenticationKey: authenticationKey,
        ),
        authenticationKey: authenticationKey,
      );

  factory AptosAccount.fromAuthenticationKeyWithAddress({
    required AuthenticationKey authenticationKey,
    required AccountAddress accountAddress,
  }) =>
      AptosAccount(
        accountAddress: accountAddress,
        authenticationKey: authenticationKey,
      );

  AuthenticationKeyScheme get authenticationKeyScheme =>
      authenticationKey.scheme;

  String toHex() => accountAddress.toHex();

  @override
  String toString() => accountAddress.toString();
}
