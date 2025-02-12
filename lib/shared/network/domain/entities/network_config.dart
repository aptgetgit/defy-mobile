import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/network_config.freezed.dart';

@freezed
class NetworkConfig with _$NetworkConfig {
  const factory NetworkConfig({
    required String caipChainId,
    required Uri rpcUrl,
  }) = _NetworkConfig;

  const NetworkConfig._();

  @override
  String toString() => 'NetworkConfig{'
      '\n caipChainId: $caipChainId,'
      '\n rpcUrl: $rpcUrl'
      '\n}';
}
