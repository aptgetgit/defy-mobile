import 'dart:typed_data';

/// Handles BIP32/44 derivation paths for Aptos in binary format
/// Format: m/44'/637'/account'/0'/0'
class AptosDerivationPath {
  const AptosDerivationPath._();

  static const int _hardenedBit = 0x80000000;
  static const int _bytesPerLevel = 4;
  static const int _totalLevels = 5;
  static const int _totalBytes = _bytesPerLevel * _totalLevels;

  static const int _purpose = 44;
  static const int _coinType = 637;
  static const int _defaultChange = 0;
  static const int _defaultAddress = 0;

  static bool isValid(Uint8List path) {
    if (path.length != _totalBytes) {
      return false;
    }

    final List<int> levels = _getLevels(path);

    if (levels.any((int level) => !_isHardened(level))) {
      return false;
    }

    return _getUnhardened(levels[0]) == _purpose &&
        _getUnhardened(levels[1]) == _coinType &&
        _getUnhardened(levels[3]) == _defaultChange &&
        _getUnhardened(levels[4]) == _defaultAddress;
  }

  /// Creates a binary derivation path for given account index
  static Uint8List encode(int accountIndex) {
    if (accountIndex < 0) {
      throw ArgumentError('Account index must be non-negative');
    }

    final Uint8List buffer = Uint8List(_totalBytes);
    ByteData.view(buffer.buffer)
      ..setUint32(0, _purpose | _hardenedBit, Endian.little) // 44'
      ..setUint32(4, _coinType | _hardenedBit, Endian.little) // 637'
      ..setUint32(8, accountIndex | _hardenedBit, Endian.little) // account'
      ..setUint32(12, _defaultChange | _hardenedBit, Endian.little) // 0'
      ..setUint32(16, _defaultAddress | _hardenedBit, Endian.little); // 0'

    return buffer;
  }

  /// Gets the account index from a binary path
  static int getAccountIndex(Uint8List path) {
    if (!isValid(path)) {
      throw ArgumentError('Invalid Aptos derivation path');
    }

    final ByteData byteData = ByteData.view(path.buffer);
    return byteData.getUint32(8, Endian.little) & ~_hardenedBit;
  }

  /// Formats binary path to readable format (m/44'/637'/x'/0'/0')
  static String formatPath(Uint8List path) {
    if (!isValid(path)) {
      throw ArgumentError('Invalid Aptos derivation path');
    }

    final Iterable<int> levels = _getLevels(path).map(_getUnhardened);
    return "m/${levels.map((int l) => "$l'").join('/')}";
  }

  /// Decodes readable format to binary path
  static Uint8List parsePath(String formattedPath) {
    final List<String> parts = formattedPath.substring(2).split('/');

    if (parts.length != _totalLevels) {
      throw ArgumentError('Invalid path format');
    }

    final List<int> levels = parts.map((String part) {
      final bool hardened = part.endsWith("'");
      final String numStr =
          hardened ? part.substring(0, part.length - 1) : part;
      return int.parse(numStr);
    }).toList();

    if (levels[0] != _purpose ||
        levels[1] != _coinType ||
        levels[3] != _defaultChange ||
        levels[4] != _defaultAddress) {
      throw ArgumentError('Invalid Aptos path format');
    }

    return encode(levels[2]);
  }

  // Private helper methods
  static List<int> _getLevels(Uint8List path) {
    final List<int> levels = <int>[];
    final ByteData byteData = ByteData.view(path.buffer);

    for (int i = 0; i < path.length; i += _bytesPerLevel) {
      levels.add(byteData.getUint32(i, Endian.little));
    }

    return levels;
  }

  static bool _isHardened(int level) => (level & _hardenedBit) != 0;

  static int _getUnhardened(int level) => level & ~_hardenedBit;
}
