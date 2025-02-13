enum ConnectivityState {
  online,
  limited,
  offline;

  bool get isOnline => this == ConnectivityState.online;
  bool get isOffline => this == ConnectivityState.offline;
  bool get isLimited => this == ConnectivityState.limited;

  @override
  String toString() => 'ConnectivityState{'
      '\n status: $name,'
      '\n isOnline: $isOnline,'
      '\n isOffline: $isOffline,'
      '\n isLimited: $isLimited'
      '\n}';
}
