import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/network_config.dart';

part 'generated/network_config_remote_model.freezed.dart';
part 'generated/network_config_remote_model.g.dart';

@Freezed(fromJson: true, toJson: true)
class NetworkConfigRemoteModel with _$NetworkConfigRemoteModel {
  const factory NetworkConfigRemoteModel({
    required String namespace,
    required String reference,
    required String rpcUrl,
  }) = _NetworkConfigRemoteModel;

  factory NetworkConfigRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigRemoteModelFromJson(json);

  const NetworkConfigRemoteModel._();

  NetworkConfig toDomain() => NetworkConfig(
        caipChainId: '$namespace:$reference',
        rpcUrl: Uri.parse(rpcUrl),
      );
}

@Freezed(fromJson: true, toJson: true)
class NetworkConfigResponseModel with _$NetworkConfigResponseModel {
  const factory NetworkConfigResponseModel({
    required List<NetworkConfigRemoteModel> data,
  }) = _NetworkConfigResponseModel;

  factory NetworkConfigResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigResponseModelFromJson(json);
}
