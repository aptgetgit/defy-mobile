import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../utils/crypto_utils.dart';

@Entity()
class SigningKeyLocalModel {
  SigningKeyLocalModel({
    required this.jwkKeyId,
    required this.jwkThumbprint,
  }) : localId = bytes32ToInt(jwkKeyId);

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkThumbprint;

  @override
  String toString() => 'SigningKeyLocalModel{'
      '\n  localId: $localId,'
      '\n  jwkKeyId: $jwkKeyId,'
      '\n  jwkThumbprint: $jwkThumbprint,'
      '\n}';
}
