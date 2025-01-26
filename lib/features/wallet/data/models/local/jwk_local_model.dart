import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../domain/entities/json_web_key.dart';

@Entity()
class JwkLocalModel {
  JwkLocalModel({
    required this.keyId,
    required this.keyType,
    required this.curve,
    required this.x,
    this.y,
  });

  factory JwkLocalModel.fromDomain(Jwk jwk) => JwkLocalModel(
        keyId: jwk.keyId,
        keyType: jwk.keyType.value,
        curve: jwk.curve.value,
        x: jwk.x,
        y: switch (jwk) {
          Ed25519Jwk() => null,
          Secp256k1Jwk(:final Uint8List y) ||
          Secp256r1Jwk(:final Uint8List y) =>
            y,
        },
      );

  Jwk toDomain() {
    if (y == null) {
      return Jwk.ed25519(
        x: x,
      );
    }

    return switch (curve) {
      'secp256k1' => Jwk.secp256k1(
          x: x,
          y: y!,
        ),
      'P-256' => Jwk.secp256r1(
          x: x,
          y: y!,
        ),
      _ => throw ArgumentError('Unsupported curve: $curve'),
    };
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
