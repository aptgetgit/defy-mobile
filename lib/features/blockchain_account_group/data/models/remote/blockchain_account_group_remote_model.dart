import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/blockchain_account_group.dart';
part 'generated/blockchain_account_group_remote_model.freezed.dart';
part 'generated/blockchain_account_group_remote_model.g.dart';

@freezed
class BlockchainAccountGroupRemoteModel
    with _$BlockchainAccountGroupRemoteModel {
  const BlockchainAccountGroupRemoteModel._();

  const factory BlockchainAccountGroupRemoteModel({
    required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _BlockchainAccountGroupRemoteModel;

  factory BlockchainAccountGroupRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      _$BlockchainAccountGroupRemoteModelFromJson(json);

  BlockchainAccountGroup toDomain() => BlockchainAccountGroup(
        id: id,
        name: name,
        icon: icon,
        color: color,
      );

  static BlockchainAccountGroupRemoteModel fromDomain(
          BlockchainAccountGroup group) =>
      BlockchainAccountGroupRemoteModel(
        id: group.id,
        name: group.name,
        icon: group.icon,
        color: group.color,
      );
}

@freezed
class CreateBlockchainAccountGroupRemoteRequest
    with _$CreateBlockchainAccountGroupRemoteRequest {
  const factory CreateBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _CreateBlockchainAccountGroupRemoteRequest;

  factory CreateBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBlockchainAccountGroupRemoteRequestFromJson(json);
}

@freezed
class UpdateBlockchainAccountGroupRemoteRequest
    with _$UpdateBlockchainAccountGroupRemoteRequest {
  const factory UpdateBlockchainAccountGroupRemoteRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'color') required String color,
  }) = _UpdateBlockchainAccountGroupRemoteRequest;

  factory UpdateBlockchainAccountGroupRemoteRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateBlockchainAccountGroupRemoteRequestFromJson(json);
}
