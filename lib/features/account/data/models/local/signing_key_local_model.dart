import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class SigningKeyLocalModel {
  SigningKeyLocalModel({
    required this.jwkKeyId,
    required this.jwkThumbprint,
  });

  @Id(assignable: false)
  int localId = 0;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkThumbprint;
}
