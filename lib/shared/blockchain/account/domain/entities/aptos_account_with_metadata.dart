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
  String toString() =>
      'AptosAccountWithMetadata(label: $label, iconUri: $iconUri, backgroundColor:  rgba(${backgroundColor.r}, ${backgroundColor.g}, ${backgroundColor.b}, ${backgroundColor.a}), accountAddress: ${accountAddress.toHex()}, authenticationKey: ${authenticationKey.toHex()}, authenticationKeyScheme: ${authenticationKeyScheme.toHex()}';
}
