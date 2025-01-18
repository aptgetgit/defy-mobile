import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/network_status.freezed.dart';

@freezed
sealed class NetworkStatus with _$NetworkStatus {
  const NetworkStatus._();

  const factory NetworkStatus.online() = Online;
  const factory NetworkStatus.limited() = Limited;
  const factory NetworkStatus.offline() = Offline;

  bool get isOnline => this is Online;
  bool get isOffline => this is Offline;
  bool get isLimited => this is Limited;

  @override
  String toString() => switch (this) {
        Online() => 'online',
        Limited() => 'limited',
        Offline() => 'offline',
      };
}
