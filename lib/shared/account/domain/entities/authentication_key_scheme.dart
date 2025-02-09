enum AuthenticationKeyScheme {
  ed25519(0x00);

  const AuthenticationKeyScheme(this._scheme);

  factory AuthenticationKeyScheme.fromByte(int byte) {
    if (byte < 0 || byte > 0xFF) {
      throw ArgumentError('Scheme must be a single byte (0-255)');
    }
    return AuthenticationKeyScheme.values.firstWhere(
      (AuthenticationKeyScheme scheme) => scheme._scheme == byte,
      orElse: () => throw ArgumentError('Invalid scheme byte: $byte'),
    );
  }

  final int _scheme;

  int toByte() => _scheme & 0xFF;

  String toHex() => '0x${toByte().toRadixString(16).padLeft(2, '0')}';

  @override
  String toString() => 'AuthenticationKeyScheme($name)';
}
