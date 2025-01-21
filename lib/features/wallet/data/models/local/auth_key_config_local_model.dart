import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class Ed25519AuthKeyConfigLocalModel {
  Ed25519AuthKeyConfigLocalModel({
    required this.authenticationKey,
    required this.jwkKeyId,
  });

  @Id(assignable: false)
  int localId = 0;

  @Property(type: PropertyType.byte, signed: false)
  final int authenticationKeyScheme = 0x00;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List authenticationKey;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;
}
