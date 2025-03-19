enum ConnectivityState {
  online,
  limited,
  offline;

  bool get isOnline => this == ConnectivityState.online;
  bool get isOffline => this == ConnectivityState.offline;
  bool get isLimited => this == ConnectivityState.limited;

  @override
  String toString() =>
      'ConnectivityState(status: $name, isOnline: $isOnline, isOffline: $isOffline, isLimited: $isLimited)';
}
