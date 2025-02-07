import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

Uint8List computeSha256Hash(Uint8List data) =>
    Uint8List.fromList(crypto.sha256.convert(data).bytes);

int bytes32ToInt(Uint8List bytes) {
  final int chunk1 = ByteData.sublistView(bytes, 0, 8).getUint64(0, Endian.little);
  final int chunk2 = ByteData.sublistView(bytes, 8, 16).getUint64(0, Endian.little);
  final int chunk3 = ByteData.sublistView(bytes, 16, 24).getUint64(0, Endian.little);
  final int chunk4 = ByteData.sublistView(bytes, 24, 32).getUint64(0, Endian.little);
  
  int result = chunk1;
  result = (result << 7 | result >> 57) ^ chunk2;
  result = (result << 7 | result >> 57) ^ chunk3;
  result = (result << 7 | result >> 57) ^ chunk4;
  
  return result & 0x7FFFFFFFFFFFFFFF;
}
