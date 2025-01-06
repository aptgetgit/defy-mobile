import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/session_entity.freezed.dart';
part 'generated/session_entity.g.dart';

enum AssuranceLevel {
  aal1('aal1'),
  aal2('aal2'),
  aal3('aal3');

  final String value;
  const AssuranceLevel(this.value);

  factory AssuranceLevel.fromString(String value) {
    return AssuranceLevel.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid AssuranceLevel value: $value'),
    );
  }

  @override
  String toString() => value;
}

@freezed
class SessionEntity with _$SessionEntity {
  factory SessionEntity({
    required bool active,
    required IdentityEntity identity,
    required String id,
    required DateTime issuedAt,
    required DateTime expiresAt,
    required DateTime authenticatedAt,
    required AssuranceLevel authenticatorAssuranceLevel,
  }) = _SessionEntity;

  SessionEntity._();

  factory SessionEntity.fromJson(Map<String, dynamic> json) => _$SessionEntityFromJson(json);
  bool get isActive => active;
  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

@freezed
class IdentityEntity with _$IdentityEntity {
  factory IdentityEntity({
    required String id,
    required TraitsEntity traits,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IdentityEntity;

  IdentityEntity._();

  factory IdentityEntity.fromJson(Map<String, dynamic> json) => _$IdentityEntityFromJson(json);
}

@freezed
class TraitsEntity with _$TraitsEntity {
  factory TraitsEntity({
    required String email,
    required String username,
    required String displayName,
  }) = _TraitsEntity;

  TraitsEntity._();

  factory TraitsEntity.fromJson(Map<String, dynamic> json) => _$TraitsEntityFromJson(json);
}
