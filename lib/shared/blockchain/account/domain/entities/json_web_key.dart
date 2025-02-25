import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/crypto_utils.dart';
import '../../../../utils/ed25519_utils.dart';
import '../../../../utils/json_utils.dart';

part 'generated/json_web_key.freezed.dart';

enum JwkKeyType {
  okp('OKP'),
  ec('EC');

  const JwkKeyType(this.value);
  final String value;

  @override
  String toString() => 'KeyType($value)';
}

enum JwkCurve {
  ed25519('Ed25519'),
  secp256k1('secp256k1'),
  secp256r1('P-256');

  const JwkCurve(this.value);
  final String value;

  @override
  String toString() => 'Curve($value)';
}

@freezed
sealed class Jwk with _$Jwk {
  const factory Jwk.ed25519({
    @protected @JsonKey(name: 'x') required Uint8List x,
    @protected @JsonKey(name: 'd') Uint8List? d,
  }) = Ed25519Jwk;

  const factory Jwk.secp256k1({
    @protected @JsonKey(name: 'x') required Uint8List x,
    @protected @JsonKey(name: 'y') required Uint8List y,
    @protected @JsonKey(name: 'd') Uint8List? d,
  }) = Secp256k1Jwk;

  const factory Jwk.secp256r1({
    @protected @JsonKey(name: 'x') required Uint8List x,
    @protected @JsonKey(name: 'y') required Uint8List y,
    @protected @JsonKey(name: 'd') Uint8List? d,
  }) = Secp256r1Jwk;

  const Jwk._();

  factory Jwk.fromEd25519PrivateKey({required Uint8List privateKey}) {
    final Uint8List privateKeyBytes = expandSecretKey(privateKey);
    return Jwk.ed25519(
      x: Uint8List.fromList(
        privateKeyBytes.sublist(32, privateKeyBytes.length),
      ),
      d: Uint8List.fromList(privateKeyBytes.sublist(0, 32)),
    );
  }

  factory Jwk.fromJson(Map<String, dynamic> json) {
    final String? kty = json['kty'] as String?;
    final String? crv = json['crv'] as String?;
    final String? x = json['x'] as String?;

    if (kty == null || crv == null || x == null) {
      throw const FormatException('Missing required JWK fields');
    }

    const Base64UrlConverter converter = Base64UrlConverter();
    final Uint8List xBytes = converter.fromJson(x);
    final Uint8List? dBytes =
        json['d'] != null ? converter.fromJson(json['d'] as String) : null;

    switch (crv) {
      case 'Ed25519' when kty == 'OKP':
        return Jwk.ed25519(x: xBytes, d: dBytes);

      case 'secp256k1' when kty == 'EC':
        final String? y = json['y'] as String?;
        if (y == null) {
          throw const FormatException('Missing y coordinate for EC key');
        }
        return Jwk.secp256k1(
          x: xBytes,
          y: converter.fromJson(y),
          d: dBytes,
        );

      case 'P-256' when kty == 'EC':
        final String? y = json['y'] as String?;
        if (y == null) {
          throw const FormatException('Missing y coordinate for EC key');
        }
        return Jwk.secp256r1(
          x: xBytes,
          y: converter.fromJson(y),
          d: dBytes,
        );

      default:
        throw FormatException('Unsupported key type or curve: $kty, $crv');
    }
  }

  Map<String, String> toJson() {
    const Base64UrlConverter converter = Base64UrlConverter();

    return switch (this) {
      Ed25519Jwk(:final Uint8List x, :final Uint8List? d) => <String, String>{
          'kty': keyType.value,
          'crv': curve.value,
          'x': converter.toJson(x),
          if (d != null) 'd': converter.toJson(d),
        },
      Secp256k1Jwk(:final Uint8List x, :final Uint8List y, :final Uint8List? d) ||
      Secp256r1Jwk(
        :final Uint8List x,
        :final Uint8List y,
        :final Uint8List? d
      ) =>
        <String, String>{
          'kty': keyType.value,
          'crv': curve.value,
          'x': converter.toJson(x),
          'y': converter.toJson(y),
          if (d != null) 'd': converter.toJson(d),
        },
    };
  }

  JwkKeyType get keyType => switch (this) {
        Ed25519Jwk() => JwkKeyType.okp,
        Secp256k1Jwk() || Secp256r1Jwk() => JwkKeyType.ec,
      };

  JwkCurve get curve => switch (this) {
        Ed25519Jwk() => JwkCurve.ed25519,
        Secp256k1Jwk() => JwkCurve.secp256k1,
        Secp256r1Jwk() => JwkCurve.secp256r1,
      };

  /// Computes the JWK thumbprint according to RFC 7638
  Uint8List get keyId {
    const Base64UrlConverter converter = Base64UrlConverter();

    final Map<String, String> thumbprintFields = switch (this) {
      Ed25519Jwk(:final Uint8List x) => <String, String>{
          'crv': curve.value,
          'kty': keyType.value,
          'x': converter.toJson(x),
        },
      Secp256k1Jwk(:final Uint8List x, :final Uint8List y) ||
      Secp256r1Jwk(:final Uint8List x, :final Uint8List y) =>
        <String, String>{
          'crv': curve.value,
          'kty': keyType.value,
          'x': converter.toJson(x),
          'y': converter.toJson(y),
        },
    };

    final String jsonStr = json.encode(thumbprintFields);
    final Uint8List bytes = utf8.encode(jsonStr);
    final Uint8List hashedBytes = computeSha256Hash(bytes);
    return Uint8List.fromList(hashedBytes);
  }

  bool hasPrivateKey() => switch (this) {
        Ed25519Jwk(:final Uint8List? d) => d != null,
        Secp256k1Jwk(:final Uint8List? d) => d != null,
        Secp256r1Jwk(:final Uint8List? d) => d != null,
      };

  Uint8List getPublicKeyBytes() => switch (this) {
        Ed25519Jwk(:final Uint8List x) => x,
        Secp256k1Jwk(:final Uint8List x, :final Uint8List y) =>
          Uint8List.fromList(<int>[...x, ...y]),
        Secp256r1Jwk(:final Uint8List x, :final Uint8List y) =>
          Uint8List.fromList(<int>[...x, ...y]),
      };

  Uint8List getPrivateKeyBytes() => switch (this) {
        Ed25519Jwk(:final Uint8List? d) =>
          d ?? (throw StateError('No private key available for this JWK')),
        Secp256k1Jwk(:final Uint8List? d) =>
          d ?? (throw StateError('No private key available for this JWK')),
        Secp256r1Jwk(:final Uint8List? d) =>
          d ?? (throw StateError('No private key available for this JWK')),
      };

  @override
  String toString() => switch (this) {
        Ed25519Jwk(:final Uint8List x) => 'Ed25519Jwk{'
            '\n  keyType: ${keyType.value},'
            '\n  curve: ${curve.value},'
            '\n  x: ${base64UrlEncode(x)}'
            '\n}',
        Secp256k1Jwk(:final Uint8List x, :final Uint8List y) => 'Secp256k1Jwk{'
            '\n  keyType: ${keyType.value},'
            '\n  curve: ${curve.value},'
            '\n  x: ${base64UrlEncode(x)},'
            '\n  y: ${base64UrlEncode(y)}'
            '\n}',
        Secp256r1Jwk(:final Uint8List x, :final Uint8List y) => 'Secp256r1Jwk{'
            '\n  keyType: ${keyType.value},'
            '\n  curve: ${curve.value},'
            '\n  x: ${base64UrlEncode(x)},'
            '\n  y: ${base64UrlEncode(y)}'
            '\n}',
      };
}
