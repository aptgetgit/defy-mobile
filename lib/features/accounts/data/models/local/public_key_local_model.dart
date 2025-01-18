import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:jwk/jwk.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class PublicKeyLocalModel {
  PublicKeyLocalModel({
    required this.keyId,
    required this.keyType,
    required this.curve,
    required this.x,
    this.y,
  });

  factory PublicKeyLocalModel.fromJwk(Jwk jwk) {
    if (jwk.kty == null) {
      throw ArgumentError('JWK must have a key type (kty)');
    }

    if (jwk.kty != 'OKP' && jwk.kty != 'EC') {
      throw ArgumentError('Unsupported key type: ${jwk.kty}');
    }

    if (jwk.kty == 'OKP') {
      if (jwk.crv != 'Ed25519') {
        throw ArgumentError('Unsupported curve for OKP: ${jwk.crv}');
      }
      if (jwk.x == null) {
        throw ArgumentError('OKP key must have x coordinate');
      }

      return PublicKeyLocalModel(
        keyId: jwk.generateThumbprint(),
        keyType: jwk.kty!,
        curve: jwk.crv!,
        x: Uint8List.fromList(jwk.x!),
      );
    }

    // For EC keys
    if (jwk.crv == null) {
      throw ArgumentError('EC key must specify curve (crv)');
    }
    if (jwk.x == null || jwk.y == null) {
      throw ArgumentError('EC key must have both x and y coordinates');
    }

    return PublicKeyLocalModel(
      keyId: jwk.generateThumbprint(),
      keyType: jwk.kty!,
      curve: jwk.crv!,
      x: Uint8List.fromList(jwk.x!),
      y: Uint8List.fromList(jwk.y!),
    );
  }

  @Id(assignable: false)
  int localId = 0;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List keyId;

  final String keyType;

  final String curve;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List x;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List? y;
}

extension JwkThumbprint on Jwk {
  Uint8List generateThumbprint() {
    if (kty == null || crv == null || x == null) {
      throw ArgumentError('JWK missing required fields (kty, crv, or x)');
    }

    Map<String, String> thumbprintFields;

    if (kty == 'OKP' && crv == 'Ed25519') {
      thumbprintFields = <String, String>{
        'crv': crv!,
        'kty': kty!,
        'x': base64Url.encode(x!).replaceAll('=', ''),
      };
    } else if (kty == 'EC') {
      if (y == null) {
        throw ArgumentError('EC keys require both x and y coordinates');
      }
      thumbprintFields = <String, String>{
        'crv': crv!,
        'kty': kty!,
        'x': base64Url.encode(x!).replaceAll('=', ''),
        'y': base64Url.encode(y!).replaceAll('=', ''),
      };
    } else {
      throw ArgumentError('Unsupported key type');
    }

    final String jsonStr = json.encode(thumbprintFields);
    final Uint8List bytes = utf8.encode(jsonStr);
    final Digest digest = sha256.convert(bytes);
    return Uint8List.fromList(digest.bytes);
  }
}
