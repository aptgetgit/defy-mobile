import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'authentication_key.dart';
part 'generated/account_address.freezed.dart';

@freezed
class AccountAddress with _$AccountAddress {
  @Assert('bytes.length == 32', 'Account address must be 32 bytes')
  const factory AccountAddress({
    required Uint8List bytes,
  }) = _AccountAddress;

  const AccountAddress._();

  factory AccountAddress.fromAuthenticationKey({
    required AuthenticationKey authenticationKey,
  }) =>
      AccountAddress(bytes: authenticationKey.toBytes());

  factory AccountAddress.fromHex({required String accountAddress}) =>
      AccountAddress(bytes: HexString(accountAddress).toUint8Array());

  Uint8List toBytes() => bytes;

  String toHex() => HexString.fromUint8Array(bytes).toString();

  @override
  String toString() => toHex();
}
