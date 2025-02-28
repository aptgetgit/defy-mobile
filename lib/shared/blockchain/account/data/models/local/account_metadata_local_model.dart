import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../../utils/color_utils.dart';
import '../../../../../utils/crypto_utils.dart';
import '../../../domain/entities/aptos_account_with_metadata.dart';

@Entity()
class AccountMetadataLocalModel {
  AccountMetadataLocalModel({
    required this.label,
    required this.iconUri,
    required this.backgroundColor,
    required this.accountAddress,
  }) : localId = bytes32ToInt(accountAddress);

  factory AccountMetadataLocalModel.fromDomain(
    AptosAccountWithMetadata domain,
  ) =>
      AccountMetadataLocalModel(
        label: domain.label,
        iconUri: domain.iconUri.toString(),
        backgroundColor: colorToInt(domain.backgroundColor),
        accountAddress: domain.accountAddress.toBytes(),
      );

  @Id(assignable: true)
  int localId;

  @Unique(onConflict: ConflictStrategy.replace)
  final String label;

  final String iconUri;

  final int backgroundColor;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List accountAddress;

  @override
  String toString() =>
      'AccountMetadataLocalModel(localId: $localId, label: $label, iconUri: $iconUri, backgroundColor: $backgroundColor, accountAddress: $accountAddress)';
}
