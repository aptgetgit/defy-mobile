// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_wallet_token_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserWalletTokenRemoteModel _$UserWalletTokenRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _UserWalletTokenRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserWalletTokenRemoteModel {
  @JsonKey(name: 'metadata')
  MetaDataModel? get metaData => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_address')
  String? get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_type')
  String? get assetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_frozen')
  bool? get isFrozen => throw _privateConstructorUsedError;

  /// Serializes this UserWalletTokenRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWalletTokenRemoteModelCopyWith<UserWalletTokenRemoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletTokenRemoteModelCopyWith<$Res> {
  factory $UserWalletTokenRemoteModelCopyWith(UserWalletTokenRemoteModel value,
          $Res Function(UserWalletTokenRemoteModel) then) =
      _$UserWalletTokenRemoteModelCopyWithImpl<$Res,
          UserWalletTokenRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'metadata') MetaDataModel? metaData,
      @JsonKey(name: 'owner_address') String? ownerAddress,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'asset_type') String? assetType,
      @JsonKey(name: 'is_frozen') bool? isFrozen});

  $MetaDataModelCopyWith<$Res>? get metaData;
}

/// @nodoc
class _$UserWalletTokenRemoteModelCopyWithImpl<$Res,
        $Val extends UserWalletTokenRemoteModel>
    implements $UserWalletTokenRemoteModelCopyWith<$Res> {
  _$UserWalletTokenRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaData = freezed,
    Object? ownerAddress = freezed,
    Object? amount = freezed,
    Object? assetType = freezed,
    Object? isFrozen = freezed,
  }) {
    return _then(_value.copyWith(
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaDataModel?,
      ownerAddress: freezed == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isFrozen: freezed == isFrozen
          ? _value.isFrozen
          : isFrozen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaDataModelCopyWith<$Res>? get metaData {
    if (_value.metaData == null) {
      return null;
    }

    return $MetaDataModelCopyWith<$Res>(_value.metaData!, (value) {
      return _then(_value.copyWith(metaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWalletTokenRemoteModelImplCopyWith<$Res>
    implements $UserWalletTokenRemoteModelCopyWith<$Res> {
  factory _$$UserWalletTokenRemoteModelImplCopyWith(
          _$UserWalletTokenRemoteModelImpl value,
          $Res Function(_$UserWalletTokenRemoteModelImpl) then) =
      __$$UserWalletTokenRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'metadata') MetaDataModel? metaData,
      @JsonKey(name: 'owner_address') String? ownerAddress,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'asset_type') String? assetType,
      @JsonKey(name: 'is_frozen') bool? isFrozen});

  @override
  $MetaDataModelCopyWith<$Res>? get metaData;
}

/// @nodoc
class __$$UserWalletTokenRemoteModelImplCopyWithImpl<$Res>
    extends _$UserWalletTokenRemoteModelCopyWithImpl<$Res,
        _$UserWalletTokenRemoteModelImpl>
    implements _$$UserWalletTokenRemoteModelImplCopyWith<$Res> {
  __$$UserWalletTokenRemoteModelImplCopyWithImpl(
      _$UserWalletTokenRemoteModelImpl _value,
      $Res Function(_$UserWalletTokenRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metaData = freezed,
    Object? ownerAddress = freezed,
    Object? amount = freezed,
    Object? assetType = freezed,
    Object? isFrozen = freezed,
  }) {
    return _then(_$UserWalletTokenRemoteModelImpl(
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaDataModel?,
      ownerAddress: freezed == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isFrozen: freezed == isFrozen
          ? _value.isFrozen
          : isFrozen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWalletTokenRemoteModelImpl extends _UserWalletTokenRemoteModel {
  _$UserWalletTokenRemoteModelImpl(
      {@JsonKey(name: 'metadata') required this.metaData,
      @JsonKey(name: 'owner_address') required this.ownerAddress,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'asset_type') required this.assetType,
      @JsonKey(name: 'is_frozen') required this.isFrozen})
      : super._();

  factory _$UserWalletTokenRemoteModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserWalletTokenRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'metadata')
  final MetaDataModel? metaData;
  @override
  @JsonKey(name: 'owner_address')
  final String? ownerAddress;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'asset_type')
  final String? assetType;
  @override
  @JsonKey(name: 'is_frozen')
  final bool? isFrozen;

  @override
  String toString() {
    return 'UserWalletTokenRemoteModel(metaData: $metaData, ownerAddress: $ownerAddress, amount: $amount, assetType: $assetType, isFrozen: $isFrozen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWalletTokenRemoteModelImpl &&
            (identical(other.metaData, metaData) ||
                other.metaData == metaData) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.isFrozen, isFrozen) ||
                other.isFrozen == isFrozen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, metaData, ownerAddress, amount, assetType, isFrozen);

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWalletTokenRemoteModelImplCopyWith<_$UserWalletTokenRemoteModelImpl>
      get copyWith => __$$UserWalletTokenRemoteModelImplCopyWithImpl<
          _$UserWalletTokenRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWalletTokenRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _UserWalletTokenRemoteModel extends UserWalletTokenRemoteModel {
  factory _UserWalletTokenRemoteModel(
          {@JsonKey(name: 'metadata') required final MetaDataModel? metaData,
          @JsonKey(name: 'owner_address') required final String? ownerAddress,
          @JsonKey(name: 'amount') required final int? amount,
          @JsonKey(name: 'asset_type') required final String? assetType,
          @JsonKey(name: 'is_frozen') required final bool? isFrozen}) =
      _$UserWalletTokenRemoteModelImpl;
  _UserWalletTokenRemoteModel._() : super._();

  factory _UserWalletTokenRemoteModel.fromJson(Map<String, dynamic> json) =
      _$UserWalletTokenRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'metadata')
  MetaDataModel? get metaData;
  @override
  @JsonKey(name: 'owner_address')
  String? get ownerAddress;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'asset_type')
  String? get assetType;
  @override
  @JsonKey(name: 'is_frozen')
  bool? get isFrozen;

  /// Create a copy of UserWalletTokenRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWalletTokenRemoteModelImplCopyWith<_$UserWalletTokenRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) {
  return _MetaDataModel.fromJson(json);
}

/// @nodoc
mixin _$MetaDataModel {
  @JsonKey(name: 'decimals')
  int? get decimals => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'symbol')
  String? get symbol => throw _privateConstructorUsedError;

  /// Serializes this MetaDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaDataModelCopyWith<MetaDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataModelCopyWith<$Res> {
  factory $MetaDataModelCopyWith(
          MetaDataModel value, $Res Function(MetaDataModel) then) =
      _$MetaDataModelCopyWithImpl<$Res, MetaDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'decimals') int? decimals,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'symbol') String? symbol});
}

/// @nodoc
class _$MetaDataModelCopyWithImpl<$Res, $Val extends MetaDataModel>
    implements $MetaDataModelCopyWith<$Res> {
  _$MetaDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decimals = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      decimals: freezed == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataModelImplCopyWith<$Res>
    implements $MetaDataModelCopyWith<$Res> {
  factory _$$MetaDataModelImplCopyWith(
          _$MetaDataModelImpl value, $Res Function(_$MetaDataModelImpl) then) =
      __$$MetaDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'decimals') int? decimals,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'symbol') String? symbol});
}

/// @nodoc
class __$$MetaDataModelImplCopyWithImpl<$Res>
    extends _$MetaDataModelCopyWithImpl<$Res, _$MetaDataModelImpl>
    implements _$$MetaDataModelImplCopyWith<$Res> {
  __$$MetaDataModelImplCopyWithImpl(
      _$MetaDataModelImpl _value, $Res Function(_$MetaDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decimals = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$MetaDataModelImpl(
      decimals: freezed == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataModelImpl extends _MetaDataModel {
  _$MetaDataModelImpl(
      {@JsonKey(name: 'decimals') required this.decimals,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'symbol') required this.symbol})
      : super._();

  factory _$MetaDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'decimals')
  final int? decimals;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'symbol')
  final String? symbol;

  @override
  String toString() {
    return 'MetaDataModel(decimals: $decimals, name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataModelImpl &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, decimals, name, symbol);

  /// Create a copy of MetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataModelImplCopyWith<_$MetaDataModelImpl> get copyWith =>
      __$$MetaDataModelImplCopyWithImpl<_$MetaDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataModelImplToJson(
      this,
    );
  }
}

abstract class _MetaDataModel extends MetaDataModel {
  factory _MetaDataModel(
          {@JsonKey(name: 'decimals') required final int? decimals,
          @JsonKey(name: 'name') required final String? name,
          @JsonKey(name: 'symbol') required final String? symbol}) =
      _$MetaDataModelImpl;
  _MetaDataModel._() : super._();

  factory _MetaDataModel.fromJson(Map<String, dynamic> json) =
      _$MetaDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'decimals')
  int? get decimals;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'symbol')
  String? get symbol;

  /// Create a copy of MetaDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaDataModelImplCopyWith<_$MetaDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
