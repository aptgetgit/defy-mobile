import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/network_status.freezed.dart';

@freezed
class NetworkStatus with _$NetworkStatus {
  const NetworkStatus._();

  const factory NetworkStatus.online() = Online;
  const factory NetworkStatus.limited() = Limited;
  const factory NetworkStatus.offline() = Offline;

  bool get isOnline => this is Online;

  @override
  String toString() => when(
        online: () => 'online',
        limited: () => 'limited',
        offline: () => 'offline',
      );
}
