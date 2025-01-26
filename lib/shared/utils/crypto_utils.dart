import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

Uint8List computeSha256Hash(Uint8List data) =>
    Uint8List.fromList(crypto.sha256.convert(data).bytes);
