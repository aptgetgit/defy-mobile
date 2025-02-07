import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pointycastle/digests/sha3.dart' as pc;

import 'authentication_key_scheme.dart';
part 'generated/authentication_key.freezed.dart';

@freezed
sealed class AuthenticationKey with _$AuthenticationKey {
  const factory AuthenticationKey({
    required Uint8List bytes,
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
    final pc.SHA3Digest sha3Hash = pc.SHA3Digest(256);
    final Uint8List hashedBytes = sha3Hash.process(bytes);

    return AuthenticationKey(bytes: hashedBytes);
  }

  // AuthenticationKeyScheme get scheme => switch (this) {
  //       Ed25519AuthenticationKey() => AuthenticationKeyScheme.ed25519,
  //     };

  String toHex() => HexString.fromUint8Array(bytes).toString();

  Uint8List toBytes() => bytes;

  @override
  String toString() => toHex();
}
