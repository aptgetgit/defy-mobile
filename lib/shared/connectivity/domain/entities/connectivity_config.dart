import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/connectivity_config.freezed.dart';

@freezed
class ConnectivityConfig with _$ConnectivityConfig {
  const factory ConnectivityConfig({
    @Default(
      <String>['https://8.8.8.8', 'https://1.1.1.1', 'https://google.com'],
    )
    List<String> checkUrls,
    @Default(Duration(seconds: 5)) Duration timeout,
    @Default('google.com') String lookupAddress,
  }) = _ConnectivityConfig;

  const ConnectivityConfig._();

  @override
  String toString() => 'ConnectivityConfig{'
      '\n checkUrls: $checkUrls,'
      '\n timeout: $timeout,'
      '\n lookupAddress: $lookupAddress'
      '\n}';
}
