import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:pointycastle/digests/sha3.dart';

Uint8List computeSha256Hash(Uint8List bytes) {
  if (bytes.isEmpty) {
    throw ArgumentError.value(bytes, 'bytes', 'Byte list cannot be empty');
  }
  return Uint8List.fromList(crypto.sha256.convert(bytes).bytes);
}

Uint8List computeSha3256Hash(Uint8List bytes) {
  if (bytes.isEmpty) {
    throw ArgumentError.value(bytes, 'bytes', 'Byte list cannot be empty');
  }
  return SHA3Digest(256).process(bytes);
}

int bytes32ToInt(Uint8List bytes) {
  if (bytes.length != 32) {
    throw ArgumentError.value(
      bytes,
      'bytes',
      'Byte list must be 32 bytes long',
    );
  }
  final int chunk1 = ByteData.sublistView(
    bytes,
    0,
    8,
  ).getUint64(0, Endian.little);
  final int chunk2 = ByteData.sublistView(
    bytes,
    8,
    16,
  ).getUint64(0, Endian.little);
  final int chunk3 = ByteData.sublistView(
    bytes,
    16,
    24,
  ).getUint64(0, Endian.little);
  final int chunk4 = ByteData.sublistView(
    bytes,
    24,
    32,
  ).getUint64(0, Endian.little);

  int result = chunk1;
  result = (result << 7 | result >> 57) ^ chunk2;
  result = (result << 7 | result >> 57) ^ chunk3;
  result = (result << 7 | result >> 57) ^ chunk4;

  return result & 0x7FFFFFFFFFFFFFFF;
}
