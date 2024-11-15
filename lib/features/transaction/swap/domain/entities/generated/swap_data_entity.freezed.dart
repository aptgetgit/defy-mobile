// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../swap_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SwapEntity _$SwapEntityFromJson(Map<String, dynamic> json) {
  return _SwapEntity.fromJson(json);
}

/// @nodoc
mixin _$SwapEntity {
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  SwapDataEntity? get data => throw _privateConstructorUsedError;

  /// Serializes this SwapEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapEntityCopyWith<SwapEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapEntityCopyWith<$Res> {
  factory $SwapEntityCopyWith(
          SwapEntity value, $Res Function(SwapEntity) then) =
      _$SwapEntityCopyWithImpl<$Res, SwapEntity>;
  @useResult
  $Res call({int? code, String? message, SwapDataEntity? data});

  $SwapDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class _$SwapEntityCopyWithImpl<$Res, $Val extends SwapEntity>
    implements $SwapEntityCopyWith<$Res> {
  _$SwapEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SwapDataEntity?,
    ) as $Val);
  }

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapDataEntityCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SwapDataEntityCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapEntityImplCopyWith<$Res>
    implements $SwapEntityCopyWith<$Res> {
  factory _$$SwapEntityImplCopyWith(
          _$SwapEntityImpl value, $Res Function(_$SwapEntityImpl) then) =
      __$$SwapEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, String? message, SwapDataEntity? data});

  @override
  $SwapDataEntityCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SwapEntityImplCopyWithImpl<$Res>
    extends _$SwapEntityCopyWithImpl<$Res, _$SwapEntityImpl>
    implements _$$SwapEntityImplCopyWith<$Res> {
  __$$SwapEntityImplCopyWithImpl(
      _$SwapEntityImpl _value, $Res Function(_$SwapEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SwapEntityImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SwapDataEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapEntityImpl implements _SwapEntity {
  _$SwapEntityImpl(
      {required this.code, required this.message, required this.data});

  factory _$SwapEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapEntityImplFromJson(json);

  @override
  final int? code;
  @override
  final String? message;
  @override
  final SwapDataEntity? data;

  @override
  String toString() {
    return 'SwapEntity(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, data);

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapEntityImplCopyWith<_$SwapEntityImpl> get copyWith =>
      __$$SwapEntityImplCopyWithImpl<_$SwapEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapEntityImplToJson(
      this,
    );
  }
}

abstract class _SwapEntity implements SwapEntity {
  factory _SwapEntity(
      {required final int? code,
      required final String? message,
      required final SwapDataEntity? data}) = _$SwapEntityImpl;

  factory _SwapEntity.fromJson(Map<String, dynamic> json) =
      _$SwapEntityImpl.fromJson;

  @override
  int? get code;
  @override
  String? get message;
  @override
  SwapDataEntity? get data;

  /// Create a copy of SwapEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapEntityImplCopyWith<_$SwapEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapDataEntity _$SwapDataEntityFromJson(Map<String, dynamic> json) {
  return _SwapDataEntity.fromJson(json);
}

/// @nodoc
mixin _$SwapDataEntity {
  @JsonKey(name: 'srcCoinType')
  String? get srcCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstCoinType')
  String? get dstCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'srcAmount')
  String? get srcAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstAmount')
  String? get dstAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paths')
  List<List<SwapPathItemEntity>> get paths =>
      throw _privateConstructorUsedError;

  /// Serializes this SwapDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapDataEntityCopyWith<SwapDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapDataEntityCopyWith<$Res> {
  factory $SwapDataEntityCopyWith(
          SwapDataEntity value, $Res Function(SwapDataEntity) then) =
      _$SwapDataEntityCopyWithImpl<$Res, SwapDataEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'paths') List<List<SwapPathItemEntity>> paths});
}

/// @nodoc
class _$SwapDataEntityCopyWithImpl<$Res, $Val extends SwapDataEntity>
    implements $SwapDataEntityCopyWith<$Res> {
  _$SwapDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srcCoinType = freezed,
    Object? dstCoinType = freezed,
    Object? srcAmount = freezed,
    Object? dstAmount = freezed,
    Object? paths = null,
  }) {
    return _then(_value.copyWith(
      srcCoinType: freezed == srcCoinType
          ? _value.srcCoinType
          : srcCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      dstCoinType: freezed == dstCoinType
          ? _value.dstCoinType
          : dstCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcAmount: freezed == srcAmount
          ? _value.srcAmount
          : srcAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      dstAmount: freezed == dstAmount
          ? _value.dstAmount
          : dstAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      paths: null == paths
          ? _value.paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<SwapPathItemEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwapDataEntityImplCopyWith<$Res>
    implements $SwapDataEntityCopyWith<$Res> {
  factory _$$SwapDataEntityImplCopyWith(_$SwapDataEntityImpl value,
          $Res Function(_$SwapDataEntityImpl) then) =
      __$$SwapDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'paths') List<List<SwapPathItemEntity>> paths});
}

/// @nodoc
class __$$SwapDataEntityImplCopyWithImpl<$Res>
    extends _$SwapDataEntityCopyWithImpl<$Res, _$SwapDataEntityImpl>
    implements _$$SwapDataEntityImplCopyWith<$Res> {
  __$$SwapDataEntityImplCopyWithImpl(
      _$SwapDataEntityImpl _value, $Res Function(_$SwapDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srcCoinType = freezed,
    Object? dstCoinType = freezed,
    Object? srcAmount = freezed,
    Object? dstAmount = freezed,
    Object? paths = null,
  }) {
    return _then(_$SwapDataEntityImpl(
      srcCoinType: freezed == srcCoinType
          ? _value.srcCoinType
          : srcCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      dstCoinType: freezed == dstCoinType
          ? _value.dstCoinType
          : dstCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcAmount: freezed == srcAmount
          ? _value.srcAmount
          : srcAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      dstAmount: freezed == dstAmount
          ? _value.dstAmount
          : dstAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      paths: null == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<SwapPathItemEntity>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapDataEntityImpl implements _SwapDataEntity {
  _$SwapDataEntityImpl(
      {@JsonKey(name: 'srcCoinType') required this.srcCoinType,
      @JsonKey(name: 'dstCoinType') required this.dstCoinType,
      @JsonKey(name: 'srcAmount') required this.srcAmount,
      @JsonKey(name: 'dstAmount') required this.dstAmount,
      @JsonKey(name: 'paths')
      required final List<List<SwapPathItemEntity>> paths})
      : _paths = paths;

  factory _$SwapDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapDataEntityImplFromJson(json);

  @override
  @JsonKey(name: 'srcCoinType')
  final String? srcCoinType;
  @override
  @JsonKey(name: 'dstCoinType')
  final String? dstCoinType;
  @override
  @JsonKey(name: 'srcAmount')
  final String? srcAmount;
  @override
  @JsonKey(name: 'dstAmount')
  final String? dstAmount;
  final List<List<SwapPathItemEntity>> _paths;
  @override
  @JsonKey(name: 'paths')
  List<List<SwapPathItemEntity>> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'SwapDataEntity(srcCoinType: $srcCoinType, dstCoinType: $dstCoinType, srcAmount: $srcAmount, dstAmount: $dstAmount, paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapDataEntityImpl &&
            (identical(other.srcCoinType, srcCoinType) ||
                other.srcCoinType == srcCoinType) &&
            (identical(other.dstCoinType, dstCoinType) ||
                other.dstCoinType == dstCoinType) &&
            (identical(other.srcAmount, srcAmount) ||
                other.srcAmount == srcAmount) &&
            (identical(other.dstAmount, dstAmount) ||
                other.dstAmount == dstAmount) &&
            const DeepCollectionEquality().equals(other._paths, _paths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, srcCoinType, dstCoinType,
      srcAmount, dstAmount, const DeepCollectionEquality().hash(_paths));

  /// Create a copy of SwapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapDataEntityImplCopyWith<_$SwapDataEntityImpl> get copyWith =>
      __$$SwapDataEntityImplCopyWithImpl<_$SwapDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapDataEntityImplToJson(
      this,
    );
  }
}

abstract class _SwapDataEntity implements SwapDataEntity {
  factory _SwapDataEntity(
          {@JsonKey(name: 'srcCoinType') required final String? srcCoinType,
          @JsonKey(name: 'dstCoinType') required final String? dstCoinType,
          @JsonKey(name: 'srcAmount') required final String? srcAmount,
          @JsonKey(name: 'dstAmount') required final String? dstAmount,
          @JsonKey(name: 'paths')
          required final List<List<SwapPathItemEntity>> paths}) =
      _$SwapDataEntityImpl;

  factory _SwapDataEntity.fromJson(Map<String, dynamic> json) =
      _$SwapDataEntityImpl.fromJson;

  @override
  @JsonKey(name: 'srcCoinType')
  String? get srcCoinType;
  @override
  @JsonKey(name: 'dstCoinType')
  String? get dstCoinType;
  @override
  @JsonKey(name: 'srcAmount')
  String? get srcAmount;
  @override
  @JsonKey(name: 'dstAmount')
  String? get dstAmount;
  @override
  @JsonKey(name: 'paths')
  List<List<SwapPathItemEntity>> get paths;

  /// Create a copy of SwapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapDataEntityImplCopyWith<_$SwapDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapPathItemEntity _$SwapPathItemEntityFromJson(Map<String, dynamic> json) {
  return _SwapPathItemEntity.fromJson(json);
}

/// @nodoc
mixin _$SwapPathItemEntity {
  @JsonKey(name: 'poolId')
  String? get poolId => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'sourceType')
  String? get sourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'srcCoinType')
  String? get srcCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstCoinType')
  String? get dstCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'srcAmount')
  String? get srcAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstAmount')
  String? get dstAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  SwapPathMetadataEntity? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SwapPathItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapPathItemEntityCopyWith<SwapPathItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapPathItemEntityCopyWith<$Res> {
  factory $SwapPathItemEntityCopyWith(
          SwapPathItemEntity value, $Res Function(SwapPathItemEntity) then) =
      _$SwapPathItemEntityCopyWithImpl<$Res, SwapPathItemEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poolId') String? poolId,
      @JsonKey(name: 'source') String? source,
      @JsonKey(name: 'sourceType') String? sourceType,
      @JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'metadata') SwapPathMetadataEntity? metadata});

  $SwapPathMetadataEntityCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$SwapPathItemEntityCopyWithImpl<$Res, $Val extends SwapPathItemEntity>
    implements $SwapPathItemEntityCopyWith<$Res> {
  _$SwapPathItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = freezed,
    Object? source = freezed,
    Object? sourceType = freezed,
    Object? srcCoinType = freezed,
    Object? dstCoinType = freezed,
    Object? srcAmount = freezed,
    Object? dstAmount = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcCoinType: freezed == srcCoinType
          ? _value.srcCoinType
          : srcCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      dstCoinType: freezed == dstCoinType
          ? _value.dstCoinType
          : dstCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcAmount: freezed == srcAmount
          ? _value.srcAmount
          : srcAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      dstAmount: freezed == dstAmount
          ? _value.dstAmount
          : dstAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as SwapPathMetadataEntity?,
    ) as $Val);
  }

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapPathMetadataEntityCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $SwapPathMetadataEntityCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapPathItemEntityImplCopyWith<$Res>
    implements $SwapPathItemEntityCopyWith<$Res> {
  factory _$$SwapPathItemEntityImplCopyWith(_$SwapPathItemEntityImpl value,
          $Res Function(_$SwapPathItemEntityImpl) then) =
      __$$SwapPathItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'poolId') String? poolId,
      @JsonKey(name: 'source') String? source,
      @JsonKey(name: 'sourceType') String? sourceType,
      @JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'metadata') SwapPathMetadataEntity? metadata});

  @override
  $SwapPathMetadataEntityCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$SwapPathItemEntityImplCopyWithImpl<$Res>
    extends _$SwapPathItemEntityCopyWithImpl<$Res, _$SwapPathItemEntityImpl>
    implements _$$SwapPathItemEntityImplCopyWith<$Res> {
  __$$SwapPathItemEntityImplCopyWithImpl(_$SwapPathItemEntityImpl _value,
      $Res Function(_$SwapPathItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poolId = freezed,
    Object? source = freezed,
    Object? sourceType = freezed,
    Object? srcCoinType = freezed,
    Object? dstCoinType = freezed,
    Object? srcAmount = freezed,
    Object? dstAmount = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$SwapPathItemEntityImpl(
      poolId: freezed == poolId
          ? _value.poolId
          : poolId // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcCoinType: freezed == srcCoinType
          ? _value.srcCoinType
          : srcCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      dstCoinType: freezed == dstCoinType
          ? _value.dstCoinType
          : dstCoinType // ignore: cast_nullable_to_non_nullable
              as String?,
      srcAmount: freezed == srcAmount
          ? _value.srcAmount
          : srcAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      dstAmount: freezed == dstAmount
          ? _value.dstAmount
          : dstAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as SwapPathMetadataEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapPathItemEntityImpl implements _SwapPathItemEntity {
  _$SwapPathItemEntityImpl(
      {@JsonKey(name: 'poolId') required this.poolId,
      @JsonKey(name: 'source') required this.source,
      @JsonKey(name: 'sourceType') required this.sourceType,
      @JsonKey(name: 'srcCoinType') required this.srcCoinType,
      @JsonKey(name: 'dstCoinType') required this.dstCoinType,
      @JsonKey(name: 'srcAmount') required this.srcAmount,
      @JsonKey(name: 'dstAmount') required this.dstAmount,
      @JsonKey(name: 'metadata') required this.metadata});

  factory _$SwapPathItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapPathItemEntityImplFromJson(json);

  @override
  @JsonKey(name: 'poolId')
  final String? poolId;
  @override
  @JsonKey(name: 'source')
  final String? source;
  @override
  @JsonKey(name: 'sourceType')
  final String? sourceType;
  @override
  @JsonKey(name: 'srcCoinType')
  final String? srcCoinType;
  @override
  @JsonKey(name: 'dstCoinType')
  final String? dstCoinType;
  @override
  @JsonKey(name: 'srcAmount')
  final String? srcAmount;
  @override
  @JsonKey(name: 'dstAmount')
  final String? dstAmount;
  @override
  @JsonKey(name: 'metadata')
  final SwapPathMetadataEntity? metadata;

  @override
  String toString() {
    return 'SwapPathItemEntity(poolId: $poolId, source: $source, sourceType: $sourceType, srcCoinType: $srcCoinType, dstCoinType: $dstCoinType, srcAmount: $srcAmount, dstAmount: $dstAmount, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapPathItemEntityImpl &&
            (identical(other.poolId, poolId) || other.poolId == poolId) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.srcCoinType, srcCoinType) ||
                other.srcCoinType == srcCoinType) &&
            (identical(other.dstCoinType, dstCoinType) ||
                other.dstCoinType == dstCoinType) &&
            (identical(other.srcAmount, srcAmount) ||
                other.srcAmount == srcAmount) &&
            (identical(other.dstAmount, dstAmount) ||
                other.dstAmount == dstAmount) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poolId, source, sourceType,
      srcCoinType, dstCoinType, srcAmount, dstAmount, metadata);

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapPathItemEntityImplCopyWith<_$SwapPathItemEntityImpl> get copyWith =>
      __$$SwapPathItemEntityImplCopyWithImpl<_$SwapPathItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapPathItemEntityImplToJson(
      this,
    );
  }
}

abstract class _SwapPathItemEntity implements SwapPathItemEntity {
  factory _SwapPathItemEntity(
          {@JsonKey(name: 'poolId') required final String? poolId,
          @JsonKey(name: 'source') required final String? source,
          @JsonKey(name: 'sourceType') required final String? sourceType,
          @JsonKey(name: 'srcCoinType') required final String? srcCoinType,
          @JsonKey(name: 'dstCoinType') required final String? dstCoinType,
          @JsonKey(name: 'srcAmount') required final String? srcAmount,
          @JsonKey(name: 'dstAmount') required final String? dstAmount,
          @JsonKey(name: 'metadata')
          required final SwapPathMetadataEntity? metadata}) =
      _$SwapPathItemEntityImpl;

  factory _SwapPathItemEntity.fromJson(Map<String, dynamic> json) =
      _$SwapPathItemEntityImpl.fromJson;

  @override
  @JsonKey(name: 'poolId')
  String? get poolId;
  @override
  @JsonKey(name: 'source')
  String? get source;
  @override
  @JsonKey(name: 'sourceType')
  String? get sourceType;
  @override
  @JsonKey(name: 'srcCoinType')
  String? get srcCoinType;
  @override
  @JsonKey(name: 'dstCoinType')
  String? get dstCoinType;
  @override
  @JsonKey(name: 'srcAmount')
  String? get srcAmount;
  @override
  @JsonKey(name: 'dstAmount')
  String? get dstAmount;
  @override
  @JsonKey(name: 'metadata')
  SwapPathMetadataEntity? get metadata;

  /// Create a copy of SwapPathItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapPathItemEntityImplCopyWith<_$SwapPathItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapPathMetadataEntity _$SwapPathMetadataEntityFromJson(
    Map<String, dynamic> json) {
  return _SwapPathMetadataEntity.fromJson(json);
}

/// @nodoc
mixin _$SwapPathMetadataEntity {
  @JsonKey(name: 'isXToY')
  bool? get isXToY => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenInIndex')
  int? get tokenInIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenOutIndex')
  int? get tokenOutIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenInWeight')
  int? get tokenInWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenOutWeight')
  int? get tokenOutWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'isStable')
  bool? get isStable => throw _privateConstructorUsedError;
  @JsonKey(name: 'marketId')
  int? get marketId => throw _privateConstructorUsedError;

  /// Serializes this SwapPathMetadataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapPathMetadataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapPathMetadataEntityCopyWith<SwapPathMetadataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapPathMetadataEntityCopyWith<$Res> {
  factory $SwapPathMetadataEntityCopyWith(SwapPathMetadataEntity value,
          $Res Function(SwapPathMetadataEntity) then) =
      _$SwapPathMetadataEntityCopyWithImpl<$Res, SwapPathMetadataEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isXToY') bool? isXToY,
      @JsonKey(name: 'tokenInIndex') int? tokenInIndex,
      @JsonKey(name: 'tokenOutIndex') int? tokenOutIndex,
      @JsonKey(name: 'tokenInWeight') int? tokenInWeight,
      @JsonKey(name: 'tokenOutWeight') int? tokenOutWeight,
      @JsonKey(name: 'isStable') bool? isStable,
      @JsonKey(name: 'marketId') int? marketId});
}

/// @nodoc
class _$SwapPathMetadataEntityCopyWithImpl<$Res,
        $Val extends SwapPathMetadataEntity>
    implements $SwapPathMetadataEntityCopyWith<$Res> {
  _$SwapPathMetadataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapPathMetadataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isXToY = freezed,
    Object? tokenInIndex = freezed,
    Object? tokenOutIndex = freezed,
    Object? tokenInWeight = freezed,
    Object? tokenOutWeight = freezed,
    Object? isStable = freezed,
    Object? marketId = freezed,
  }) {
    return _then(_value.copyWith(
      isXToY: freezed == isXToY
          ? _value.isXToY
          : isXToY // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenInIndex: freezed == tokenInIndex
          ? _value.tokenInIndex
          : tokenInIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenOutIndex: freezed == tokenOutIndex
          ? _value.tokenOutIndex
          : tokenOutIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenInWeight: freezed == tokenInWeight
          ? _value.tokenInWeight
          : tokenInWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenOutWeight: freezed == tokenOutWeight
          ? _value.tokenOutWeight
          : tokenOutWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      isStable: freezed == isStable
          ? _value.isStable
          : isStable // ignore: cast_nullable_to_non_nullable
              as bool?,
      marketId: freezed == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwapPathMetadataEntityImplCopyWith<$Res>
    implements $SwapPathMetadataEntityCopyWith<$Res> {
  factory _$$SwapPathMetadataEntityImplCopyWith(
          _$SwapPathMetadataEntityImpl value,
          $Res Function(_$SwapPathMetadataEntityImpl) then) =
      __$$SwapPathMetadataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isXToY') bool? isXToY,
      @JsonKey(name: 'tokenInIndex') int? tokenInIndex,
      @JsonKey(name: 'tokenOutIndex') int? tokenOutIndex,
      @JsonKey(name: 'tokenInWeight') int? tokenInWeight,
      @JsonKey(name: 'tokenOutWeight') int? tokenOutWeight,
      @JsonKey(name: 'isStable') bool? isStable,
      @JsonKey(name: 'marketId') int? marketId});
}

/// @nodoc
class __$$SwapPathMetadataEntityImplCopyWithImpl<$Res>
    extends _$SwapPathMetadataEntityCopyWithImpl<$Res,
        _$SwapPathMetadataEntityImpl>
    implements _$$SwapPathMetadataEntityImplCopyWith<$Res> {
  __$$SwapPathMetadataEntityImplCopyWithImpl(
      _$SwapPathMetadataEntityImpl _value,
      $Res Function(_$SwapPathMetadataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapPathMetadataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isXToY = freezed,
    Object? tokenInIndex = freezed,
    Object? tokenOutIndex = freezed,
    Object? tokenInWeight = freezed,
    Object? tokenOutWeight = freezed,
    Object? isStable = freezed,
    Object? marketId = freezed,
  }) {
    return _then(_$SwapPathMetadataEntityImpl(
      isXToY: freezed == isXToY
          ? _value.isXToY
          : isXToY // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenInIndex: freezed == tokenInIndex
          ? _value.tokenInIndex
          : tokenInIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenOutIndex: freezed == tokenOutIndex
          ? _value.tokenOutIndex
          : tokenOutIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenInWeight: freezed == tokenInWeight
          ? _value.tokenInWeight
          : tokenInWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenOutWeight: freezed == tokenOutWeight
          ? _value.tokenOutWeight
          : tokenOutWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      isStable: freezed == isStable
          ? _value.isStable
          : isStable // ignore: cast_nullable_to_non_nullable
              as bool?,
      marketId: freezed == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapPathMetadataEntityImpl implements _SwapPathMetadataEntity {
  _$SwapPathMetadataEntityImpl(
      {@JsonKey(name: 'isXToY') required this.isXToY,
      @JsonKey(name: 'tokenInIndex') required this.tokenInIndex,
      @JsonKey(name: 'tokenOutIndex') required this.tokenOutIndex,
      @JsonKey(name: 'tokenInWeight') required this.tokenInWeight,
      @JsonKey(name: 'tokenOutWeight') required this.tokenOutWeight,
      @JsonKey(name: 'isStable') required this.isStable,
      @JsonKey(name: 'marketId') required this.marketId});

  factory _$SwapPathMetadataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapPathMetadataEntityImplFromJson(json);

  @override
  @JsonKey(name: 'isXToY')
  final bool? isXToY;
  @override
  @JsonKey(name: 'tokenInIndex')
  final int? tokenInIndex;
  @override
  @JsonKey(name: 'tokenOutIndex')
  final int? tokenOutIndex;
  @override
  @JsonKey(name: 'tokenInWeight')
  final int? tokenInWeight;
  @override
  @JsonKey(name: 'tokenOutWeight')
  final int? tokenOutWeight;
  @override
  @JsonKey(name: 'isStable')
  final bool? isStable;
  @override
  @JsonKey(name: 'marketId')
  final int? marketId;

  @override
  String toString() {
    return 'SwapPathMetadataEntity(isXToY: $isXToY, tokenInIndex: $tokenInIndex, tokenOutIndex: $tokenOutIndex, tokenInWeight: $tokenInWeight, tokenOutWeight: $tokenOutWeight, isStable: $isStable, marketId: $marketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapPathMetadataEntityImpl &&
            (identical(other.isXToY, isXToY) || other.isXToY == isXToY) &&
            (identical(other.tokenInIndex, tokenInIndex) ||
                other.tokenInIndex == tokenInIndex) &&
            (identical(other.tokenOutIndex, tokenOutIndex) ||
                other.tokenOutIndex == tokenOutIndex) &&
            (identical(other.tokenInWeight, tokenInWeight) ||
                other.tokenInWeight == tokenInWeight) &&
            (identical(other.tokenOutWeight, tokenOutWeight) ||
                other.tokenOutWeight == tokenOutWeight) &&
            (identical(other.isStable, isStable) ||
                other.isStable == isStable) &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isXToY, tokenInIndex,
      tokenOutIndex, tokenInWeight, tokenOutWeight, isStable, marketId);

  /// Create a copy of SwapPathMetadataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapPathMetadataEntityImplCopyWith<_$SwapPathMetadataEntityImpl>
      get copyWith => __$$SwapPathMetadataEntityImplCopyWithImpl<
          _$SwapPathMetadataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapPathMetadataEntityImplToJson(
      this,
    );
  }
}

abstract class _SwapPathMetadataEntity implements SwapPathMetadataEntity {
  factory _SwapPathMetadataEntity(
          {@JsonKey(name: 'isXToY') required final bool? isXToY,
          @JsonKey(name: 'tokenInIndex') required final int? tokenInIndex,
          @JsonKey(name: 'tokenOutIndex') required final int? tokenOutIndex,
          @JsonKey(name: 'tokenInWeight') required final int? tokenInWeight,
          @JsonKey(name: 'tokenOutWeight') required final int? tokenOutWeight,
          @JsonKey(name: 'isStable') required final bool? isStable,
          @JsonKey(name: 'marketId') required final int? marketId}) =
      _$SwapPathMetadataEntityImpl;

  factory _SwapPathMetadataEntity.fromJson(Map<String, dynamic> json) =
      _$SwapPathMetadataEntityImpl.fromJson;

  @override
  @JsonKey(name: 'isXToY')
  bool? get isXToY;
  @override
  @JsonKey(name: 'tokenInIndex')
  int? get tokenInIndex;
  @override
  @JsonKey(name: 'tokenOutIndex')
  int? get tokenOutIndex;
  @override
  @JsonKey(name: 'tokenInWeight')
  int? get tokenInWeight;
  @override
  @JsonKey(name: 'tokenOutWeight')
  int? get tokenOutWeight;
  @override
  @JsonKey(name: 'isStable')
  bool? get isStable;
  @override
  @JsonKey(name: 'marketId')
  int? get marketId;

  /// Create a copy of SwapPathMetadataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapPathMetadataEntityImplCopyWith<_$SwapPathMetadataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
