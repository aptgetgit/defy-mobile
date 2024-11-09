import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/network_connectivity_config.freezed.dart';
part 'generated/network_connectivity_config.g.dart';

@freezed
class NetworkConnectivityConfig with _$NetworkConnectivityConfig {
  const NetworkConnectivityConfig._();

  const factory NetworkConnectivityConfig({
    @Default(['https://8.8.8.8', 'https://1.1.1.1', 'https://google.com']) 
    List<String> checkUrls,
    @Default(Duration(seconds: 5)) Duration timeout,
    @Default('google.com') String lookupAddress,
  }) = _NetworkConnectivityConfig;

  factory NetworkConnectivityConfig.fromJson(Map<String, dynamic> json) =>
      _$NetworkConnectivityConfigFromJson(json);
}