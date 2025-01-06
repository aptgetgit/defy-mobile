import 'dart:convert';

bool isTokenExpired(String idToken) {
  try {
    final parts = idToken.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid ID token');
    }

    final payloadBase64 = parts[1];
    final normalizedPayload = base64.normalize(payloadBase64);
    final payloadString = utf8.decode(base64.decode(normalizedPayload));
    final payload = json.decode(payloadString);

    final expiration = payload['exp'];
    if (expiration == null) {
      throw Exception('Token does not have an expiration field');
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000; // In seconds
    return currentTime >= expiration;
  } catch (e) {
    return true;
  }
}
