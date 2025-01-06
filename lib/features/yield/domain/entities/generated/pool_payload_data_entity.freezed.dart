// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_payload_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoolPayloadDataEntity {
  String get functionId => throw _privateConstructorUsedError;
  List<String> get typeArguments => throw _privateConstructorUsedError;
  List<String> get arguments => throw _privateConstructorUsedError;

  /// Create a copy of PoolPayloadDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolPayloadDataEntityCopyWith<PoolPayloadDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolPayloadDataEntityCopyWith<$Res> {
  factory $PoolPayloadDataEntityCopyWith(PoolPayloadDataEntity value,
          $Res Function(PoolPayloadDataEntity) then) =
      _$PoolPayloadDataEntityCopyWithImpl<$Res, PoolPayloadDataEntity>;
  @useResult
  $Res call(
      {String functionId, List<String> typeArguments, List<String> arguments});
}

/// @nodoc
class _$PoolPayloadDataEntityCopyWithImpl<$Res,
        $Val extends PoolPayloadDataEntity>
    implements $PoolPayloadDataEntityCopyWith<$Res> {
  _$PoolPayloadDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolPayloadDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionId = null,
    Object? typeArguments = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      functionId: null == functionId
          ? _value.functionId
          : functionId // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value.typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolPayloadDataEntityImplCopyWith<$Res>
    implements $PoolPayloadDataEntityCopyWith<$Res> {
  factory _$$PoolPayloadDataEntityImplCopyWith(
          _$PoolPayloadDataEntityImpl value,
          $Res Function(_$PoolPayloadDataEntityImpl) then) =
      __$$PoolPayloadDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String functionId, List<String> typeArguments, List<String> arguments});
}

/// @nodoc
class __$$PoolPayloadDataEntityImplCopyWithImpl<$Res>
    extends _$PoolPayloadDataEntityCopyWithImpl<$Res,
        _$PoolPayloadDataEntityImpl>
    implements _$$PoolPayloadDataEntityImplCopyWith<$Res> {
  __$$PoolPayloadDataEntityImplCopyWithImpl(_$PoolPayloadDataEntityImpl _value,
      $Res Function(_$PoolPayloadDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolPayloadDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? functionId = null,
    Object? typeArguments = null,
    Object? arguments = null,
  }) {
    return _then(_$PoolPayloadDataEntityImpl(
      functionId: null == functionId
          ? _value.functionId
          : functionId // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value._typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      arguments: null == arguments
          ? _value._arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PoolPayloadDataEntityImpl implements _PoolPayloadDataEntity {
  const _$PoolPayloadDataEntityImpl(
      {required this.functionId,
      required final List<String> typeArguments,
      required final List<String> arguments})
      : _typeArguments = typeArguments,
        _arguments = arguments;

  @override
  final String functionId;
  final List<String> _typeArguments;
  @override
  List<String> get typeArguments {
    if (_typeArguments is EqualUnmodifiableListView) return _typeArguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeArguments);
  }

  final List<String> _arguments;
  @override
  List<String> get arguments {
    if (_arguments is EqualUnmodifiableListView) return _arguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_arguments);
  }

  @override
  String toString() {
    return 'PoolPayloadDataEntity(functionId: $functionId, typeArguments: $typeArguments, arguments: $arguments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolPayloadDataEntityImpl &&
            (identical(other.functionId, functionId) ||
                other.functionId == functionId) &&
            const DeepCollectionEquality()
                .equals(other._typeArguments, _typeArguments) &&
            const DeepCollectionEquality()
                .equals(other._arguments, _arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      functionId,
      const DeepCollectionEquality().hash(_typeArguments),
      const DeepCollectionEquality().hash(_arguments));

  /// Create a copy of PoolPayloadDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolPayloadDataEntityImplCopyWith<_$PoolPayloadDataEntityImpl>
      get copyWith => __$$PoolPayloadDataEntityImplCopyWithImpl<
          _$PoolPayloadDataEntityImpl>(this, _$identity);
}

abstract class _PoolPayloadDataEntity implements PoolPayloadDataEntity {
  const factory _PoolPayloadDataEntity(
      {required final String functionId,
      required final List<String> typeArguments,
      required final List<String> arguments}) = _$PoolPayloadDataEntityImpl;

  @override
  String get functionId;
  @override
  List<String> get typeArguments;
  @override
  List<String> get arguments;

  /// Create a copy of PoolPayloadDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolPayloadDataEntityImplCopyWith<_$PoolPayloadDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
