import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class HDKeyLocalModel {
  HDKeyLocalModel({
    required this.jwkKeyId,
    required this.entropyHash,
    required this.derivationPath,
  });

  @Id(assignable: false)
  int localId = 0;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List derivationPath;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List entropyHash;
}
