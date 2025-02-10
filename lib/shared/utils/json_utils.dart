import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class Base64UrlConverter implements JsonConverter<Uint8List, String> {
  const Base64UrlConverter();

  @override
  Uint8List fromJson(String json) {
    final int padding = (4 - (json.length % 4)) % 4;
    final String normalized = json + ('=' * padding);

    final String base64 = normalized.replaceAll('-', '+').replaceAll('_', '/');

    return base64Decode(base64);
  }

  @override
  String toJson(Uint8List bytes) => base64UrlEncode(bytes).replaceAll('=', '');
}
