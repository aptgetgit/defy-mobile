import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_blockchain_account_group.dart';
part 'generated/user_blockchain_account_group_remote_model.freezed.dart';
part 'generated/user_blockchain_account_group_remote_model.g.dart';
@freezed
class UserBlockchainAccountGroupRemoteModel with _$UserBlockchainAccountGroupRemoteModel {
  const UserBlockchainAccountGroupRemoteModel._();

  const factory UserBlockchainAccountGroupRemoteModel({
    required String id,
    required String name,
    required String animatedIconUrl,
    required String backgroundColor,
  }) = _UserBlockchainAccountGroupRemoteModel;

  factory UserBlockchainAccountGroupRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserBlockchainAccountGroupRemoteModelFromJson(json);

  UserBlockchainAccountGroup toDomain() => UserBlockchainAccountGroup(
        id: id,
        name: name,
        animatedIconUrl: animatedIconUrl,
        backgroundColor: backgroundColor,
      );

  static UserBlockchainAccountGroupRemoteModel fromDomain(UserBlockchainAccountGroup group) =>
      UserBlockchainAccountGroupRemoteModel(
        id: group.id,
        name: group.name,
        animatedIconUrl: group.animatedIconUrl,
        backgroundColor: group.backgroundColor,
      );
}

@freezed
class CreateUserBlockchainAccountGroupRemoteRequest with _$CreateUserBlockchainAccountGroupRemoteRequest {
  const factory CreateUserBlockchainAccountGroupRemoteRequest({
    required String name,
    required String animatedIconUrl,
    required String backgroundColor,
  }) = _CreateUserBlockchainAccountGroupRemoteRequest;

  factory CreateUserBlockchainAccountGroupRemoteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}

@freezed
class UpdateUserBlockchainAccountGroupRemoteRequest with _$UpdateUserBlockchainAccountGroupRemoteRequest {
  const factory UpdateUserBlockchainAccountGroupRemoteRequest({
    required String name,
    required String animatedIconUrl,
    required String backgroundColor,
  }) = _UpdateUserBlockchainAccountGroupRemoteRequest;

  factory UpdateUserBlockchainAccountGroupRemoteRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}