import 'package:defy/features/yield/domain/entities/pool_payload_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/pool_payload_data.g.dart';

@JsonSerializable()
class PoolPayloadDataModel {
  @JsonKey(name: 'function_id', defaultValue: '')
  final String functionId;

  @JsonKey(name: 'type_arguments', fromJson: _parseList, toJson: _listToJson)
  final List<String> typeArguments;

  @JsonKey(name: 'arguments', fromJson: _parseList, toJson: _listToJson)
  final List<String> arguments;

  const PoolPayloadDataModel({
    required this.functionId,
    required this.typeArguments,
    required this.arguments,
  });

  factory PoolPayloadDataModel.fromJson(Map<String, dynamic> json) => 
      _$PoolPayloadDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PoolPayloadDataModelToJson(this);

  static List<String> _parseList(dynamic value) {
    if (value == null) return [];
    if (value is String) {
      return value.isEmpty ? [] : [value];
    } else if (value is List) {
      return List<String>.from(value.map((e) => e.toString()));
    } else {
      return [];
    }
  }

  static List<String> _listToJson(List<String> list) => list;

  PoolPayloadDataEntity toEntity() {
    return PoolPayloadDataEntity(
      functionId: functionId,
      typeArguments: typeArguments,
      arguments: arguments,
    );
  }

  factory PoolPayloadDataModel.fromEntity(PoolPayloadDataEntity entity) {
    return PoolPayloadDataModel(
      functionId: entity.functionId,
      typeArguments: entity.typeArguments,
      arguments: entity.arguments,
    );
  }
}