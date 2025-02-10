import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_blockchain_account_group.dart';

part 'generated/user_blockchain_account_group_remote_model.freezed.dart';
part 'generated/user_blockchain_account_group_remote_model.g.dart';

@Freezed(fromJson: true)
class UserBlockchainAccountGroupRemoteModel with _$UserBlockchainAccountGroupRemoteModel {
  const UserBlockchainAccountGroupRemoteModel._();

  const factory UserBlockchainAccountGroupRemoteModel({
    required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'animatedIconUrl') required String animatedIconUrl,
    @JsonKey(name: 'backgroundColor') required String backgroundColor,
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

@Freezed(fromJson: true)
class CreateUserBlockchainAccountGroupRemoteRequest with _$CreateUserBlockchainAccountGroupRemoteRequest {
  const factory CreateUserBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'animatedIconUrl') required String animatedIconUrl,
    @JsonKey(name: 'backgroundColor') required String backgroundColor,
  }) = _CreateUserBlockchainAccountGroupRemoteRequest;

  factory CreateUserBlockchainAccountGroupRemoteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}

@Freezed(fromJson: true)
class UpdateUserBlockchainAccountGroupRemoteRequest with _$UpdateUserBlockchainAccountGroupRemoteRequest {
  const factory UpdateUserBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'animatedIconUrl') required String animatedIconUrl,
    @JsonKey(name: 'backgroundColor') required String backgroundColor,
  }) = _UpdateUserBlockchainAccountGroupRemoteRequest;

  factory UpdateUserBlockchainAccountGroupRemoteRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserBlockchainAccountGroupRemoteRequestFromJson(json);
}