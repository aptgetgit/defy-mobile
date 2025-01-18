import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import 'public_key_local_model.dart';

@Entity()
class SigningKeyLocalModel {
  SigningKeyLocalModel({
    required this.publicKey,
    required this.jwkThumbprint,
  });

  factory SigningKeyLocalModel.withRelation({
    required int localPublicKeyId,
    required Uint8List jwkThumbprint,
  }) =>
      SigningKeyLocalModel(
        publicKey: ToOne<PublicKeyLocalModel>(targetId: localPublicKeyId),
        jwkThumbprint: jwkThumbprint,
      );

  @Id(assignable: false)
  int localId = 0;

  ToOne<PublicKeyLocalModel> publicKey = ToOne<PublicKeyLocalModel>();

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkThumbprint;
}
