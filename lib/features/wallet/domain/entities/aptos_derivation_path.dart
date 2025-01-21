import 'dart:typed_data';

class AptosDerivationPath {
  factory AptosDerivationPath.parse(String formattedPath) {
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

    return AptosDerivationPath.fromAccountIndex(levels[2]);
  }

  factory AptosDerivationPath.fromAccountIndex(int accountIndex) {
    if (accountIndex < 0) {
      throw ArgumentError('Account index must be non-negative');
    }

    final Uint8List buffer = Uint8List(_totalBytes);
    ByteData.view(buffer.buffer)
      ..setUint32(0, _purpose | _hardenedBit, Endian.little)
      ..setUint32(4, _coinType | _hardenedBit, Endian.little)
      ..setUint32(8, accountIndex | _hardenedBit, Endian.little)
      ..setUint32(12, _defaultChange | _hardenedBit, Endian.little)
      ..setUint32(16, _defaultAddress | _hardenedBit, Endian.little);

    return AptosDerivationPath._(buffer);
  }

  factory AptosDerivationPath.fromBytes(Uint8List path) {
    if (!_isValid(path)) {
      throw ArgumentError('Invalid Aptos derivation path');
    }
    return AptosDerivationPath._(path);
  }
  AptosDerivationPath._(this._path);

  static const int _hardenedBit = 0x80000000;
  static const int _bytesPerLevel = 4;
  static const int _totalLevels = 5;
  static const int _totalBytes = _bytesPerLevel * _totalLevels;

  static const int _purpose = 44;
  static const int _coinType = 637;
  static const int _defaultChange = 0;
  static const int _defaultAddress = 0;

  final Uint8List _path;

  int get accountIndex {
    final ByteData byteData = ByteData.view(_path.buffer);
    return byteData.getUint32(8, Endian.little) & ~_hardenedBit;
  }

  Uint8List toBytes() => _path;

  @override
  String toString() {
    final Iterable<int> levels = _getLevels(_path).map(_getUnhardened);
    return "m/${levels.map((int l) => "$l'").join('/')}";
  }

  static bool _isValid(Uint8List path) {
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
