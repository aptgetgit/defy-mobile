import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/device_info_provider.g.dart';

@riverpod
DeviceInfoPlugin deviceInfoPlugin(Ref ref) => DeviceInfoPlugin();

@Riverpod(keepAlive: true)
Future<AndroidDeviceInfo> androidDeviceInfo(Ref ref) {
  if (!Platform.isAndroid) {
    throw UnsupportedError('Not running on Android');
  }
  return ref.read(deviceInfoPluginProvider).androidInfo;
}

@Riverpod(keepAlive: true)
Future<IosDeviceInfo> iosDeviceInfo(Ref ref) {
  if (!Platform.isIOS) {
    throw UnsupportedError('Not running on iOS');
  }
  return ref.read(deviceInfoPluginProvider).iosInfo;
}
