import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/crypto_utils.dart';
import '../../../../utils/hex_utils.dart';
import 'authentication_key_scheme.dart';
part 'generated/authentication_key.freezed.dart';

@freezed
sealed class AuthenticationKey with _$AuthenticationKey {
  @Assert('bytes.length == 32', 'Authentication key must be 32 bytes')
  const factory AuthenticationKey({
    @protected required Uint8List bytes,
  }) = _AuthenticationKey;

  const AuthenticationKey._();

  factory AuthenticationKey.ed25519SchemeFromPublicKey({
    required Uint8List publicKeyBytes,
  }) {
    final Uint8List bytes = Uint8List(publicKeyBytes.length + 1)
      ..setAll(0, publicKeyBytes)
      ..setAll(
        publicKeyBytes.length,
        <int>[AuthenticationKeyScheme.ed25519.toByte()],
      );
    final Uint8List hashedBytes = computeSha3256Hash(bytes);
    return AuthenticationKey(bytes: hashedBytes);
  }

  String toHex() => '0x${bytesToHex(bytes)}';

  Uint8List toBytes() => bytes;

  @override
  String toString() => 'AuthenticationKey(${toHex()})';
}
