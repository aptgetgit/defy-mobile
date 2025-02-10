import 'dart:typed_data';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;

Uint8List expandSecretKey(Uint8List seed) =>
    Uint8List.fromList(ed25519.newKeyFromSeed(seed).bytes);

Uint8List derivePublicKey(Uint8List seed) =>
    Uint8List.fromList(ed25519.public(ed25519.newKeyFromSeed(seed)).bytes);

(Uint8List publicKey, Uint8List privateKey) generateKeyPairFromSeed(
  Uint8List seed,
) {
  final ed25519.PrivateKey privateKey = ed25519.newKeyFromSeed(seed);
  final ed25519.PublicKey publicKey = ed25519.public(privateKey);
  return (
    Uint8List.fromList(publicKey.bytes),
    Uint8List.fromList(privateKey.bytes),
  );
}

Uint8List sign(Uint8List message, Uint8List seed) {
  final ed25519.PrivateKey privateKey = ed25519.newKeyFromSeed(seed);
  return ed25519.sign(privateKey, message);
}

bool verify({
  required Uint8List message,
  required Uint8List signature,
  required Uint8List publicKey,
}) {
  try {
    return ed25519.verify(
      ed25519.PublicKey(publicKey),
      message,
      signature,
    );
  } on Exception catch (_) {
    return false;
  }
}

bool isValidSeed(Uint8List seed) {
  if (seed.length != 32) {
    return false;
  }
  try {
    ed25519.newKeyFromSeed(seed);
    return true;
  } on Exception catch (_) {
    return false;
  }
}

bool isValidPublicKey(Uint8List publicKey) {
  if (publicKey.length != 32) {
    return false;
  }
  try {
    ed25519.PublicKey(publicKey);
    return true;
  } on Exception catch (_) {
    return false;
  }
}

bool isValidSignature(Uint8List signature) => signature.length == 64;
