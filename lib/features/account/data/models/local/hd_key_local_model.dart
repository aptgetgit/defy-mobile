import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../../shared/utils/crypto_utils.dart';

@Entity()
class HDKeyLocalModel {
  HDKeyLocalModel({
    required this.jwkKeyId,
    required this.entropyHash,
    required this.derivationPath,
  }) : localId = bytes32ToInt(jwkKeyId);

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List derivationPath;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List entropyHash;
}
