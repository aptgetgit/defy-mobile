import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_payload_data.freezed.dart';
part 'generated/pool_payload_data.g.dart';

@freezed
class PoolPayloadData with _$PoolPayloadData {
  const factory PoolPayloadData({
    required String function_id,
    @JsonKey(fromJson: parseTypeArguments) required List<String> type_arguments,
    @JsonKey(fromJson: parseArguments) required List<String> arguments,
  }) = _PoolPayloadData;

  factory PoolPayloadData.fromJson(Map<String, dynamic> json) =>
      _$PoolPayloadDataFromJson(json);
}

List<String> parseTypeArguments(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}

List<String> parseArguments(dynamic value) {
  if (value is String) {
    return value.isEmpty ? [] : [value];
  } else if (value is List) {
    return List<String>.from(value);
  } else {
    return [];
  }
}