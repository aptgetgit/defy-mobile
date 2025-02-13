import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../utils/crypto_utils.dart';
import '../../../domain/entities/json_web_key.dart';

@Entity()
class JwkLocalModel {
  JwkLocalModel({
    required this.keyId,
    required this.keyType,
    required this.curve,
    required this.x,
    this.y,
  }) : localId = bytes32ToInt(keyId);

  factory JwkLocalModel.fromDomain(Jwk domain) {
    final Uint8List publicKeyBytes = domain.getPublicKeyBytes();

    return JwkLocalModel(
      keyId: domain.keyId,
      keyType: domain.keyType.value,
      curve: domain.curve.value,
      x: switch (domain) {
        Ed25519Jwk() => publicKeyBytes,
        Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(0, 32),
      },
      y: switch (domain) {
        Ed25519Jwk() => null,
        Secp256k1Jwk() || Secp256r1Jwk() => publicKeyBytes.sublist(32, 64),
      },
    );
  }

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

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List keyId;

  final String keyType;

  final String curve;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List x;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List? y;

  @override
  String toString() => 'JwkLocalModel{'
      '\n  localId: $localId,'
      '\n  keyId: $keyId,'
      '\n  keyType: $keyType,'
      '\n  curve: $curve'
      '\n}';
}
