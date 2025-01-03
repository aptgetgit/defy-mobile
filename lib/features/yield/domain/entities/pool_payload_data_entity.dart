// pool_payload_data_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pool_payload_data_entity.freezed.dart';

@freezed
class PoolPayloadDataEntity with _$PoolPayloadDataEntity {
  const factory PoolPayloadDataEntity({
    required String functionId,
    required List<String> typeArguments,
    required List<String> arguments,
  }) = _PoolPayloadDataEntity;
}