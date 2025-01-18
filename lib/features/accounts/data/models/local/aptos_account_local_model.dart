import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class AptosAccountLocalModel {
  AptosAccountLocalModel({
    required this.accountAddress,
    required this.authenticationKey,
    required this.authenticationScheme,
  });

  @Id(assignable: false)
  int localId = 0;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List accountAddress;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List authenticationKey;

  @Property(type: PropertyType.byte, signed: false)
  final int authenticationScheme;
}
