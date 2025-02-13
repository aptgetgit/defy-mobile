import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_address.dart';
import 'authentication_key.dart';
import 'authentication_key_scheme.dart';

part 'generated/aptos_account_with_metadata.freezed.dart';

@freezed
class AptosAccountWithMetadata with _$AptosAccountWithMetadata {
  const factory AptosAccountWithMetadata({
    required String label,
    required Uri iconUri,
    required Color backgroundColor,
    required AccountAddress accountAddress,
    required AuthenticationKey authenticationKey,
    required AuthenticationKeyScheme authenticationKeyScheme,
  }) = _AptosAccountWithMetadata;

  const AptosAccountWithMetadata._();

  @override
  String toString() => 'AptosAccountWithMetadata{'
      '\n label: $label,'
      '\n iconUri: $iconUri,'
      '\n backgroundColor:  rgba(${backgroundColor.r}, ${backgroundColor.g}, ${backgroundColor.b}, ${backgroundColor.a}),'
      '\n accountAddress: ${accountAddress.toHex()},'
      '\n authenticationKey: ${authenticationKey.toHex()},'
      '\n authenticationKeyScheme: ${authenticationKeyScheme.toHex()}'
      '\n}';
}
