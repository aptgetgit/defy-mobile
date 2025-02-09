import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../utils/crypto_utils.dart';
import '../../../domain/entities/aptos_account_with_metadata.dart';

@Entity()
class AptosAccountLocalModel {
  AptosAccountLocalModel({
    required this.accountAddress,
    required this.authenticationKey,
    required this.authenticationKeyScheme,
  }) : localId = bytes32ToInt(accountAddress);

  factory AptosAccountLocalModel.fromDomain(AptosAccountWithMetadata domain) =>
      AptosAccountLocalModel(
        accountAddress: domain.accountAddress.toBytes(),
        authenticationKey: domain.authenticationKey.toBytes(),
        authenticationKeyScheme: domain.authenticationKeyScheme.toByte(),
      );

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List accountAddress;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List authenticationKey;

  @Property(type: PropertyType.byte, signed: false)
  final int authenticationKeyScheme;

  @override
  String toString() => 'AptosAccountLocalModel{'
      '\n  localId: $localId,'
      '\n  accountAddress: $accountAddress,'
      '\n  authenticationKey: $authenticationKey,'
      '\n  authenticationKeyScheme: $authenticationKeyScheme,'
      '\n}';
}
