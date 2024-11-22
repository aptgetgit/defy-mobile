import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_blockchain_account_group.dart';
part 'generated/user_blockchain_account_group_remote_model.freezed.dart';
part 'generated/user_blockchain_account_group_remote_model.g.dart';

@freezed
class UserBlockchainAccountGroupRemoteModel
    with _$UserBlockchainAccountGroupRemoteModel {
  const UserBlockchainAccountGroupRemoteModel._();

  const factory UserBlockchainAccountGroupRemoteModel({
    required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _UserBlockchainAccountGroupRemoteModel;

  factory UserBlockchainAccountGroupRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      _$UserBlockchainAccountGroupRemoteModelFromJson(json);

  UserBlockchainAccountGroup toDomain() => UserBlockchainAccountGroup(
        id: id,
        name: name,
        icon: icon,
        color: color,
      );

  static UserBlockchainAccountGroupRemoteModel fromDomain(
          UserBlockchainAccountGroup group) =>
      UserBlockchainAccountGroupRemoteModel(
        id: group.id,
        name: group.name,
        icon: group.icon,
        color: group.color,
      );
}

@freezed
class CreateUserBlockchainAccountGroupRemoteRequest
    with _$CreateUserBlockchainAccountGroupRemoteRequest {
  const factory CreateUserBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _CreateUserBlockchainAccountGroupRemoteRequest;

  factory CreateUserBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}

@freezed
class UpdateUserBlockchainAccountGroupRemoteRequest
    with _$UpdateUserBlockchainAccountGroupRemoteRequest {
  const factory UpdateUserBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _UpdateUserBlockchainAccountGroupRemoteRequest;

  factory UpdateUserBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}
