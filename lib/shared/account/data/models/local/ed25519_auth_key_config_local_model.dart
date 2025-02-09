import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../utils/crypto_utils.dart';

@Entity()
class Ed25519AuthKeyConfigLocalModel {
  Ed25519AuthKeyConfigLocalModel({
    required this.authenticationKey,
    required this.jwkKeyId,
  }) : localId = bytes32ToInt(authenticationKey);

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byte, signed: false)
  final int authenticationKeyScheme = 0x00;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List authenticationKey;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List jwkKeyId;

  @override
  String toString() => 'Ed25519AuthKeyConfigLocalModel{'
      '\n  localId: $localId,'
      '\n  authenticationKey: $authenticationKey,'
      '\n  jwkKeyId: $jwkKeyId,'
      '\n}';
}
