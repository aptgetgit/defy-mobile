import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/connectivity_status.freezed.dart';

@freezed
sealed class ConnectivityStatus with _$ConnectivityStatus {
  const ConnectivityStatus._();
  const factory ConnectivityStatus.online() = Online;
  const factory ConnectivityStatus.limited() = Limited;
  const factory ConnectivityStatus.offline() = Offline;

  bool get isOnline => this is Online;
  bool get isOffline => this is Offline;
  bool get isLimited => this is Limited;

  @override
  String toString() => 'ConnectivityStatus{'
      '\n status: ${switch (this) {
        Online() => 'online',
        Limited() => 'limited',
        Offline() => 'offline',
      }},'
      '\n isOnline: $isOnline,'
      '\n isOffline: $isOffline,'
      '\n isLimited: $isLimited'
      '\n}';
}
