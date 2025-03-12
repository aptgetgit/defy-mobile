// import 'dart:typed_data';

// import 'package:objectbox/objectbox.dart';

// import '../../../../../utils/crypto_utils.dart';
// import '../../../../account/domain/entities/account_address.dart';
// import '../../../../account/domain/entities/authentication_key.dart';
// import '../../../domain/entities/account_data.dart';

// @Entity()
// class AccountDataLocalModel {
//   AccountDataLocalModel({
//     required this.accountAddress,
//     required this.authenticationKey,
//     required this.sequenceNumber,
//     DateTime? lastUpdated,
//   })  : localId = bytes32ToInt(accountAddress),
//         lastUpdated = lastUpdated ?? DateTime.now();

//   factory AccountDataLocalModel.fromDomain({
//     required AccountAddress accountAddress,
//     required AccountData accountData,
//   }) =>
//       AccountDataLocalModel(
//         accountAddress: accountAddress.toBytes(),
//         authenticationKey: accountData.authenticationKey.toBytes(),
//         sequenceNumber: accountData.sequenceNumber.toString(),
//       );

//   @Id(assignable: true)
//   int localId;

//   @Property(type: PropertyType.byteVector, signed: false)
//   final Uint8List accountAddress;

//   @Property(type: PropertyType.byteVector, signed: false)
//   final Uint8List authenticationKey;

//   @Index()
//   final String sequenceNumber;

//   @Index()
//   @Property(type: PropertyType.date)
//   DateTime lastUpdated;

//   AccountData toDomain() => AccountData(
//         sequenceNumber: BigInt.parse(sequenceNumber),
//         authenticationKey: AuthenticationKey(
//           bytes: authenticationKey,
//         ),
//       );
// }
