import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../../../../../shared/utils/crypto_utils.dart';
import '../../../domain/entities/account_address.dart';
import '../../../domain/entities/aptos_account.dart';
import '../../../domain/entities/authentication_key.dart';
import '../../../domain/entities/authentication_key_scheme.dart';

@Entity()
class AptosAccountLocalModel {
  AptosAccountLocalModel({
    required this.accountAddress,
    required this.authenticationKey,
    required this.authenticationKeyScheme,
  }) : localId = bytes32ToInt(accountAddress);

  factory AptosAccountLocalModel.fromDomain(AptosAccount account) =>
      AptosAccountLocalModel(
        accountAddress: account.accountAddress.toBytes(),
        authenticationKey: account.authenticationKey.toBytes(),
        authenticationKeyScheme: account.authenticationKeyScheme.toByte(),
      );

  @Id(assignable: true)
  int localId;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List accountAddress;

  @Property(type: PropertyType.byteVector, signed: false)
  final Uint8List authenticationKey;

  @Property(type: PropertyType.byte, signed: false)
  final int authenticationKeyScheme;

  AptosAccount toDomain() => AptosAccount(
        accountAddress: AccountAddress(bytes: accountAddress),
        authenticationKey: switch (
            AuthenticationKeyScheme.fromByte(authenticationKeyScheme)) {
          AuthenticationKeyScheme.ed25519 =>
            AuthenticationKey(bytes: authenticationKey),
        },
        authenticationKeyScheme:
            AuthenticationKeyScheme.fromByte(authenticationKeyScheme),
      );
}
