// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pool_payload_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoolPayloadData _$PoolPayloadDataFromJson(Map<String, dynamic> json) {
  return _PoolPayloadData.fromJson(json);
}

/// @nodoc
mixin _$PoolPayloadData {
  String get function_id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseTypeArguments)
  List<String> get type_arguments => throw _privateConstructorUsedError;
  @JsonKey(fromJson: parseArguments)
  List<String> get arguments => throw _privateConstructorUsedError;

  /// Serializes this PoolPayloadData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoolPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoolPayloadDataCopyWith<PoolPayloadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoolPayloadDataCopyWith<$Res> {
  factory $PoolPayloadDataCopyWith(
          PoolPayloadData value, $Res Function(PoolPayloadData) then) =
      _$PoolPayloadDataCopyWithImpl<$Res, PoolPayloadData>;
  @useResult
  $Res call(
      {String function_id,
      @JsonKey(fromJson: parseTypeArguments) List<String> type_arguments,
      @JsonKey(fromJson: parseArguments) List<String> arguments});
}

/// @nodoc
class _$PoolPayloadDataCopyWithImpl<$Res, $Val extends PoolPayloadData>
    implements $PoolPayloadDataCopyWith<$Res> {
  _$PoolPayloadDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoolPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? function_id = null,
    Object? type_arguments = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      function_id: null == function_id
          ? _value.function_id
          : function_id // ignore: cast_nullable_to_non_nullable
              as String,
      type_arguments: null == type_arguments
          ? _value.type_arguments
          : type_arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoolPayloadDataImplCopyWith<$Res>
    implements $PoolPayloadDataCopyWith<$Res> {
  factory _$$PoolPayloadDataImplCopyWith(_$PoolPayloadDataImpl value,
          $Res Function(_$PoolPayloadDataImpl) then) =
      __$$PoolPayloadDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String function_id,
      @JsonKey(fromJson: parseTypeArguments) List<String> type_arguments,
      @JsonKey(fromJson: parseArguments) List<String> arguments});
}

/// @nodoc
class __$$PoolPayloadDataImplCopyWithImpl<$Res>
    extends _$PoolPayloadDataCopyWithImpl<$Res, _$PoolPayloadDataImpl>
    implements _$$PoolPayloadDataImplCopyWith<$Res> {
  __$$PoolPayloadDataImplCopyWithImpl(
      _$PoolPayloadDataImpl _value, $Res Function(_$PoolPayloadDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoolPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? function_id = null,
    Object? type_arguments = null,
    Object? arguments = null,
  }) {
    return _then(_$PoolPayloadDataImpl(
      function_id: null == function_id
          ? _value.function_id
          : function_id // ignore: cast_nullable_to_non_nullable
              as String,
      type_arguments: null == type_arguments
          ? _value._type_arguments
          : type_arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      arguments: null == arguments
          ? _value._arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoolPayloadDataImpl implements _PoolPayloadData {
  const _$PoolPayloadDataImpl(
      {required this.function_id,
      @JsonKey(fromJson: parseTypeArguments)
      required final List<String> type_arguments,
      @JsonKey(fromJson: parseArguments) required final List<String> arguments})
      : _type_arguments = type_arguments,
        _arguments = arguments;

  factory _$PoolPayloadDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoolPayloadDataImplFromJson(json);

  @override
  final String function_id;
  final List<String> _type_arguments;
  @override
  @JsonKey(fromJson: parseTypeArguments)
  List<String> get type_arguments {
    if (_type_arguments is EqualUnmodifiableListView) return _type_arguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type_arguments);
  }

  final List<String> _arguments;
  @override
  @JsonKey(fromJson: parseArguments)
  List<String> get arguments {
    if (_arguments is EqualUnmodifiableListView) return _arguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_arguments);
  }

  @override
  String toString() {
    return 'PoolPayloadData(function_id: $function_id, type_arguments: $type_arguments, arguments: $arguments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoolPayloadDataImpl &&
            (identical(other.function_id, function_id) ||
                other.function_id == function_id) &&
            const DeepCollectionEquality()
                .equals(other._type_arguments, _type_arguments) &&
            const DeepCollectionEquality()
                .equals(other._arguments, _arguments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      function_id,
      const DeepCollectionEquality().hash(_type_arguments),
      const DeepCollectionEquality().hash(_arguments));

  /// Create a copy of PoolPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoolPayloadDataImplCopyWith<_$PoolPayloadDataImpl> get copyWith =>
      __$$PoolPayloadDataImplCopyWithImpl<_$PoolPayloadDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoolPayloadDataImplToJson(
      this,
    );
  }
}

abstract class _PoolPayloadData implements PoolPayloadData {
  const factory _PoolPayloadData(
      {required final String function_id,
      @JsonKey(fromJson: parseTypeArguments)
      required final List<String> type_arguments,
      @JsonKey(fromJson: parseArguments)
      required final List<String> arguments}) = _$PoolPayloadDataImpl;

  factory _PoolPayloadData.fromJson(Map<String, dynamic> json) =
      _$PoolPayloadDataImpl.fromJson;

  @override
  String get function_id;
  @override
  @JsonKey(fromJson: parseTypeArguments)
  List<String> get type_arguments;
  @override
  @JsonKey(fromJson: parseArguments)
  List<String> get arguments;

  /// Create a copy of PoolPayloadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoolPayloadDataImplCopyWith<_$PoolPayloadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
