import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import 'public_key_local_model.dart';

@Entity()
class HDKeyLocalModel {
  HDKeyLocalModel({
    required this.publicKey,
    required this.entropyHash,
    required this.derivationPath,
  });

  factory HDKeyLocalModel.withRelation({
    required int localPublicKeyId,
    required Uint8List entropyHash,
    required Uint8List derivationPath,
  }) =>
      HDKeyLocalModel(
        publicKey: ToOne<PublicKeyLocalModel>(targetId: localPublicKeyId),
        entropyHash: entropyHash,
        derivationPath: derivationPath,
      );

  @Id(assignable: false)
  int localId = 0;

  ToOne<PublicKeyLocalModel> publicKey = ToOne<PublicKeyLocalModel>();

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List derivationPath;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List entropyHash;
}
