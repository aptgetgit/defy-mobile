// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../swap_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SwapModel _$SwapModelFromJson(Map<String, dynamic> json) {
  return _SwapModel.fromJson(json);
}

/// @nodoc
mixin _$SwapModel {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  SwapDataModel? get data => throw _privateConstructorUsedError;

  /// Serializes this SwapModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapModelCopyWith<SwapModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapModelCopyWith<$Res> {
  factory $SwapModelCopyWith(SwapModel value, $Res Function(SwapModel) then) =
      _$SwapModelCopyWithImpl<$Res, SwapModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SwapDataModel? data});

  $SwapDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$SwapModelCopyWithImpl<$Res, $Val extends SwapModel>
    implements $SwapModelCopyWith<$Res> {
  _$SwapModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapModel
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
              as SwapDataModel?,
    ) as $Val);
  }

  /// Create a copy of SwapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapDataModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SwapDataModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapModelImplCopyWith<$Res>
    implements $SwapModelCopyWith<$Res> {
  factory _$$SwapModelImplCopyWith(
          _$SwapModelImpl value, $Res Function(_$SwapModelImpl) then) =
      __$$SwapModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'data') SwapDataModel? data});

  @override
  $SwapDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SwapModelImplCopyWithImpl<$Res>
    extends _$SwapModelCopyWithImpl<$Res, _$SwapModelImpl>
    implements _$$SwapModelImplCopyWith<$Res> {
  __$$SwapModelImplCopyWithImpl(
      _$SwapModelImpl _value, $Res Function(_$SwapModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SwapModelImpl(
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
              as SwapDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapModelImpl extends _SwapModel {
  _$SwapModelImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'data') required this.data})
      : super._();

  factory _$SwapModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapModelImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final SwapDataModel? data;

  @override
  String toString() {
    return 'SwapModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, data);

  /// Create a copy of SwapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapModelImplCopyWith<_$SwapModelImpl> get copyWith =>
      __$$SwapModelImplCopyWithImpl<_$SwapModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapModelImplToJson(
      this,
    );
  }
}

abstract class _SwapModel extends SwapModel {
  factory _SwapModel(
          {@JsonKey(name: 'code') required final int? code,
          @JsonKey(name: 'message') required final String? message,
          @JsonKey(name: 'data') required final SwapDataModel? data}) =
      _$SwapModelImpl;
  _SwapModel._() : super._();

  factory _SwapModel.fromJson(Map<String, dynamic> json) =
      _$SwapModelImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'data')
  SwapDataModel? get data;

  /// Create a copy of SwapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapModelImplCopyWith<_$SwapModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapDataModel _$SwapDataModelFromJson(Map<String, dynamic> json) {
  return _SwapDataModel.fromJson(json);
}

/// @nodoc
mixin _$SwapDataModel {
  @JsonKey(name: 'srcCoinType')
  String? get srcCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstCoinType')
  String? get dstCoinType => throw _privateConstructorUsedError;
  @JsonKey(name: 'srcAmount')
  String? get srcAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dstAmount')
  String? get dstAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paths')
  List<List<SwapPathItemModel>> get paths => throw _privateConstructorUsedError;

  /// Serializes this SwapDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapDataModelCopyWith<SwapDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapDataModelCopyWith<$Res> {
  factory $SwapDataModelCopyWith(
          SwapDataModel value, $Res Function(SwapDataModel) then) =
      _$SwapDataModelCopyWithImpl<$Res, SwapDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'paths') List<List<SwapPathItemModel>> paths});
}

/// @nodoc
class _$SwapDataModelCopyWithImpl<$Res, $Val extends SwapDataModel>
    implements $SwapDataModelCopyWith<$Res> {
  _$SwapDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapDataModel
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
              as List<List<SwapPathItemModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwapDataModelImplCopyWith<$Res>
    implements $SwapDataModelCopyWith<$Res> {
  factory _$$SwapDataModelImplCopyWith(
          _$SwapDataModelImpl value, $Res Function(_$SwapDataModelImpl) then) =
      __$$SwapDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'paths') List<List<SwapPathItemModel>> paths});
}

/// @nodoc
class __$$SwapDataModelImplCopyWithImpl<$Res>
    extends _$SwapDataModelCopyWithImpl<$Res, _$SwapDataModelImpl>
    implements _$$SwapDataModelImplCopyWith<$Res> {
  __$$SwapDataModelImplCopyWithImpl(
      _$SwapDataModelImpl _value, $Res Function(_$SwapDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapDataModel
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
    return _then(_$SwapDataModelImpl(
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
              as List<List<SwapPathItemModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapDataModelImpl extends _SwapDataModel {
  _$SwapDataModelImpl(
      {@JsonKey(name: 'srcCoinType') required this.srcCoinType,
      @JsonKey(name: 'dstCoinType') required this.dstCoinType,
      @JsonKey(name: 'srcAmount') required this.srcAmount,
      @JsonKey(name: 'dstAmount') required this.dstAmount,
      @JsonKey(name: 'paths')
      required final List<List<SwapPathItemModel>> paths})
      : _paths = paths,
        super._();

  factory _$SwapDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapDataModelImplFromJson(json);

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
  final List<List<SwapPathItemModel>> _paths;
  @override
  @JsonKey(name: 'paths')
  List<List<SwapPathItemModel>> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'SwapDataModel(srcCoinType: $srcCoinType, dstCoinType: $dstCoinType, srcAmount: $srcAmount, dstAmount: $dstAmount, paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapDataModelImpl &&
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

  /// Create a copy of SwapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapDataModelImplCopyWith<_$SwapDataModelImpl> get copyWith =>
      __$$SwapDataModelImplCopyWithImpl<_$SwapDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapDataModelImplToJson(
      this,
    );
  }
}

abstract class _SwapDataModel extends SwapDataModel {
  factory _SwapDataModel(
          {@JsonKey(name: 'srcCoinType') required final String? srcCoinType,
          @JsonKey(name: 'dstCoinType') required final String? dstCoinType,
          @JsonKey(name: 'srcAmount') required final String? srcAmount,
          @JsonKey(name: 'dstAmount') required final String? dstAmount,
          @JsonKey(name: 'paths')
          required final List<List<SwapPathItemModel>> paths}) =
      _$SwapDataModelImpl;
  _SwapDataModel._() : super._();

  factory _SwapDataModel.fromJson(Map<String, dynamic> json) =
      _$SwapDataModelImpl.fromJson;

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
  List<List<SwapPathItemModel>> get paths;

  /// Create a copy of SwapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapDataModelImplCopyWith<_$SwapDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapPathItemModel _$SwapPathItemModelFromJson(Map<String, dynamic> json) {
  return _SwapPathItemModel.fromJson(json);
}

/// @nodoc
mixin _$SwapPathItemModel {
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
  SwapPathMetadataModel? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SwapPathItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapPathItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapPathItemModelCopyWith<SwapPathItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapPathItemModelCopyWith<$Res> {
  factory $SwapPathItemModelCopyWith(
          SwapPathItemModel value, $Res Function(SwapPathItemModel) then) =
      _$SwapPathItemModelCopyWithImpl<$Res, SwapPathItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'poolId') String? poolId,
      @JsonKey(name: 'source') String? source,
      @JsonKey(name: 'sourceType') String? sourceType,
      @JsonKey(name: 'srcCoinType') String? srcCoinType,
      @JsonKey(name: 'dstCoinType') String? dstCoinType,
      @JsonKey(name: 'srcAmount') String? srcAmount,
      @JsonKey(name: 'dstAmount') String? dstAmount,
      @JsonKey(name: 'metadata') SwapPathMetadataModel? metadata});

  $SwapPathMetadataModelCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$SwapPathItemModelCopyWithImpl<$Res, $Val extends SwapPathItemModel>
    implements $SwapPathItemModelCopyWith<$Res> {
  _$SwapPathItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapPathItemModel
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
              as SwapPathMetadataModel?,
    ) as $Val);
  }

  /// Create a copy of SwapPathItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapPathMetadataModelCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $SwapPathMetadataModelCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SwapPathItemModelImplCopyWith<$Res>
    implements $SwapPathItemModelCopyWith<$Res> {
  factory _$$SwapPathItemModelImplCopyWith(_$SwapPathItemModelImpl value,
          $Res Function(_$SwapPathItemModelImpl) then) =
      __$$SwapPathItemModelImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'metadata') SwapPathMetadataModel? metadata});

  @override
  $SwapPathMetadataModelCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$SwapPathItemModelImplCopyWithImpl<$Res>
    extends _$SwapPathItemModelCopyWithImpl<$Res, _$SwapPathItemModelImpl>
    implements _$$SwapPathItemModelImplCopyWith<$Res> {
  __$$SwapPathItemModelImplCopyWithImpl(_$SwapPathItemModelImpl _value,
      $Res Function(_$SwapPathItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapPathItemModel
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
    return _then(_$SwapPathItemModelImpl(
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
              as SwapPathMetadataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwapPathItemModelImpl extends _SwapPathItemModel {
  _$SwapPathItemModelImpl(
      {@JsonKey(name: 'poolId') required this.poolId,
      @JsonKey(name: 'source') required this.source,
      @JsonKey(name: 'sourceType') required this.sourceType,
      @JsonKey(name: 'srcCoinType') required this.srcCoinType,
      @JsonKey(name: 'dstCoinType') required this.dstCoinType,
      @JsonKey(name: 'srcAmount') required this.srcAmount,
      @JsonKey(name: 'dstAmount') required this.dstAmount,
      @JsonKey(name: 'metadata') required this.metadata})
      : super._();

  factory _$SwapPathItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapPathItemModelImplFromJson(json);

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
  final SwapPathMetadataModel? metadata;

  @override
  String toString() {
    return 'SwapPathItemModel(poolId: $poolId, source: $source, sourceType: $sourceType, srcCoinType: $srcCoinType, dstCoinType: $dstCoinType, srcAmount: $srcAmount, dstAmount: $dstAmount, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapPathItemModelImpl &&
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

  /// Create a copy of SwapPathItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapPathItemModelImplCopyWith<_$SwapPathItemModelImpl> get copyWith =>
      __$$SwapPathItemModelImplCopyWithImpl<_$SwapPathItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapPathItemModelImplToJson(
      this,
    );
  }
}

abstract class _SwapPathItemModel extends SwapPathItemModel {
  factory _SwapPathItemModel(
          {@JsonKey(name: 'poolId') required final String? poolId,
          @JsonKey(name: 'source') required final String? source,
          @JsonKey(name: 'sourceType') required final String? sourceType,
          @JsonKey(name: 'srcCoinType') required final String? srcCoinType,
          @JsonKey(name: 'dstCoinType') required final String? dstCoinType,
          @JsonKey(name: 'srcAmount') required final String? srcAmount,
          @JsonKey(name: 'dstAmount') required final String? dstAmount,
          @JsonKey(name: 'metadata')
          required final SwapPathMetadataModel? metadata}) =
      _$SwapPathItemModelImpl;
  _SwapPathItemModel._() : super._();

  factory _SwapPathItemModel.fromJson(Map<String, dynamic> json) =
      _$SwapPathItemModelImpl.fromJson;

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
  SwapPathMetadataModel? get metadata;

  /// Create a copy of SwapPathItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapPathItemModelImplCopyWith<_$SwapPathItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SwapPathMetadataModel _$SwapPathMetadataModelFromJson(
    Map<String, dynamic> json) {
  return _SwapPathMetadataModel.fromJson(json);
}

/// @nodoc
mixin _$SwapPathMetadataModel {
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

  /// Serializes this SwapPathMetadataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwapPathMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwapPathMetadataModelCopyWith<SwapPathMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwapPathMetadataModelCopyWith<$Res> {
  factory $SwapPathMetadataModelCopyWith(SwapPathMetadataModel value,
          $Res Function(SwapPathMetadataModel) then) =
      _$SwapPathMetadataModelCopyWithImpl<$Res, SwapPathMetadataModel>;
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
class _$SwapPathMetadataModelCopyWithImpl<$Res,
        $Val extends SwapPathMetadataModel>
    implements $SwapPathMetadataModelCopyWith<$Res> {
  _$SwapPathMetadataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwapPathMetadataModel
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
abstract class _$$SwapPathMetadataModelImplCopyWith<$Res>
    implements $SwapPathMetadataModelCopyWith<$Res> {
  factory _$$SwapPathMetadataModelImplCopyWith(
          _$SwapPathMetadataModelImpl value,
          $Res Function(_$SwapPathMetadataModelImpl) then) =
      __$$SwapPathMetadataModelImplCopyWithImpl<$Res>;
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
class __$$SwapPathMetadataModelImplCopyWithImpl<$Res>
    extends _$SwapPathMetadataModelCopyWithImpl<$Res,
        _$SwapPathMetadataModelImpl>
    implements _$$SwapPathMetadataModelImplCopyWith<$Res> {
  __$$SwapPathMetadataModelImplCopyWithImpl(_$SwapPathMetadataModelImpl _value,
      $Res Function(_$SwapPathMetadataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwapPathMetadataModel
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
    return _then(_$SwapPathMetadataModelImpl(
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
class _$SwapPathMetadataModelImpl extends _SwapPathMetadataModel {
  _$SwapPathMetadataModelImpl(
      {@JsonKey(name: 'isXToY') required this.isXToY,
      @JsonKey(name: 'tokenInIndex') required this.tokenInIndex,
      @JsonKey(name: 'tokenOutIndex') required this.tokenOutIndex,
      @JsonKey(name: 'tokenInWeight') required this.tokenInWeight,
      @JsonKey(name: 'tokenOutWeight') required this.tokenOutWeight,
      @JsonKey(name: 'isStable') required this.isStable,
      @JsonKey(name: 'marketId') required this.marketId})
      : super._();

  factory _$SwapPathMetadataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwapPathMetadataModelImplFromJson(json);

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
    return 'SwapPathMetadataModel(isXToY: $isXToY, tokenInIndex: $tokenInIndex, tokenOutIndex: $tokenOutIndex, tokenInWeight: $tokenInWeight, tokenOutWeight: $tokenOutWeight, isStable: $isStable, marketId: $marketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapPathMetadataModelImpl &&
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

  /// Create a copy of SwapPathMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapPathMetadataModelImplCopyWith<_$SwapPathMetadataModelImpl>
      get copyWith => __$$SwapPathMetadataModelImplCopyWithImpl<
          _$SwapPathMetadataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwapPathMetadataModelImplToJson(
      this,
    );
  }
}

abstract class _SwapPathMetadataModel extends SwapPathMetadataModel {
  factory _SwapPathMetadataModel(
          {@JsonKey(name: 'isXToY') required final bool? isXToY,
          @JsonKey(name: 'tokenInIndex') required final int? tokenInIndex,
          @JsonKey(name: 'tokenOutIndex') required final int? tokenOutIndex,
          @JsonKey(name: 'tokenInWeight') required final int? tokenInWeight,
          @JsonKey(name: 'tokenOutWeight') required final int? tokenOutWeight,
          @JsonKey(name: 'isStable') required final bool? isStable,
          @JsonKey(name: 'marketId') required final int? marketId}) =
      _$SwapPathMetadataModelImpl;
  _SwapPathMetadataModel._() : super._();

  factory _SwapPathMetadataModel.fromJson(Map<String, dynamic> json) =
      _$SwapPathMetadataModelImpl.fromJson;

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

  /// Create a copy of SwapPathMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwapPathMetadataModelImplCopyWith<_$SwapPathMetadataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
