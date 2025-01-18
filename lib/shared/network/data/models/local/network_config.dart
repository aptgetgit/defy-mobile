import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/network_config.freezed.dart';

@freezed
class NetworkConfig with _$NetworkConfig {
  const factory NetworkConfig({
    @Default(
      <String>['https://8.8.8.8', 'https://1.1.1.1', 'https://google.com'],
    )
    List<String> checkUrls,
    @Default(Duration(seconds: 5)) Duration timeout,
    @Default('google.com') String lookupAddress,
  }) = _NetworkConfig;
  const NetworkConfig._();
}
