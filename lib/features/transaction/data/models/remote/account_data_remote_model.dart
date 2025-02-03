import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/utils/hex_utils.dart';
import '../../../../account/domain/entities/authentication_key.dart';
import '../../../domain/entities/account_data.dart';

part 'generated/account_data_remote_model.freezed.dart';

@Freezed(fromJson: true)
class AccountDataRemoteModel with _$AccountDataRemoteModel {
  const factory AccountDataRemoteModel({
    required String sequenceNumber,
    required String authenticationKey,
  }) = _AccountDataRemoteModel;

  factory AccountDataRemoteModel.fromDomain(AccountData accountData) =>
      AccountDataRemoteModel(
        sequenceNumber: accountData.sequenceNumber.toString(),
        authenticationKey: accountData.authenticationKey.toString(),
      );

  factory AccountDataRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDataRemoteModelFromJson(json);

  const AccountDataRemoteModel._();

  AccountData toDomain() {
    final BigInt parsedSequenceNumber = BigInt.parse(sequenceNumber);
    final AuthenticationKey parsedAuthKey =
        AuthenticationKey(bytes: hexToBytes(authenticationKey));
    return AccountData(
      sequenceNumber: parsedSequenceNumber,
      authenticationKey: parsedAuthKey,
    );
  }
}
