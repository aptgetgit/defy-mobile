import 'dart:typed_data';

import 'package:aptos_dart/hex_string.dart';

String bytesToHex(Uint8List bytes) =>
    HexString.fromUint8Array(bytes).noPrefix();

Uint8List hexToBytes(String hexString) => HexString(hexString).toUint8Array();
