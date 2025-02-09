import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/hex_utils.dart';
import 'authentication_key.dart';

part 'generated/account_address.freezed.dart';

@freezed
class AccountAddress with _$AccountAddress {
  @Assert('bytes.length == 32', 'Account address must be 32 bytes')
  const factory AccountAddress({
    @protected required Uint8List bytes,
  }) = _AccountAddress;

  const AccountAddress._();

  factory AccountAddress.fromAuthenticationKey({
    required AuthenticationKey authenticationKey,
  }) =>
      AccountAddress(bytes: authenticationKey.toBytes());

  factory AccountAddress.fromHex({required String accountAddress}) =>
      AccountAddress(bytes: HexString(accountAddress).toUint8Array());

  Uint8List toBytes() => bytes;

  String toHex() => '0x${bytesToHex(bytes)}';

  @override
  String toString() => 'AccountAddress(${toHex()})';
}
