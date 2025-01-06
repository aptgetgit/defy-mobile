// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_wallet_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserWalletToken _$UserWalletTokenFromJson(Map<String, dynamic> json) {
  return _UserWalletToken.fromJson(json);
}

/// @nodoc
mixin _$UserWalletToken {
  MetaDataEntity? get metaData => throw _privateConstructorUsedError;
  String? get ownerAddress => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get assetType => throw _privateConstructorUsedError;
  bool? get isFrozen => throw _privateConstructorUsedError;

  /// Serializes this UserWalletToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserWalletToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWalletTokenCopyWith<UserWalletToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletTokenCopyWith<$Res> {
  factory $UserWalletTokenCopyWith(
          UserWalletToken value, $Res Function(UserWalletToken) then) =
      _$UserWalletTokenCopyWithImpl<$Res, UserWalletToken>;
  @useResult
  $Res call(
      {MetaDataEntity? metaData,
      String? ownerAddress,
      int? amount,
      String? assetType,
      bool? isFrozen});

  $MetaDataEntityCopyWith<$Res>? get metaData;
}

/// @nodoc
class _$UserWalletTokenCopyWithImpl<$Res, $Val extends UserWalletToken>
    implements $UserWalletTokenCopyWith<$Res> {
  _$UserWalletTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWalletToken
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
              as MetaDataEntity?,
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

  /// Create a copy of UserWalletToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaDataEntityCopyWith<$Res>? get metaData {
    if (_value.metaData == null) {
      return null;
    }

    return $MetaDataEntityCopyWith<$Res>(_value.metaData!, (value) {
      return _then(_value.copyWith(metaData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWalletTokenImplCopyWith<$Res>
    implements $UserWalletTokenCopyWith<$Res> {
  factory _$$UserWalletTokenImplCopyWith(_$UserWalletTokenImpl value,
          $Res Function(_$UserWalletTokenImpl) then) =
      __$$UserWalletTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MetaDataEntity? metaData,
      String? ownerAddress,
      int? amount,
      String? assetType,
      bool? isFrozen});

  @override
  $MetaDataEntityCopyWith<$Res>? get metaData;
}

/// @nodoc
class __$$UserWalletTokenImplCopyWithImpl<$Res>
    extends _$UserWalletTokenCopyWithImpl<$Res, _$UserWalletTokenImpl>
    implements _$$UserWalletTokenImplCopyWith<$Res> {
  __$$UserWalletTokenImplCopyWithImpl(
      _$UserWalletTokenImpl _value, $Res Function(_$UserWalletTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWalletToken
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
    return _then(_$UserWalletTokenImpl(
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaDataEntity?,
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
class _$UserWalletTokenImpl extends _UserWalletToken {
  const _$UserWalletTokenImpl(
      {required this.metaData,
      required this.ownerAddress,
      required this.amount,
      required this.assetType,
      required this.isFrozen})
      : super._();

  factory _$UserWalletTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWalletTokenImplFromJson(json);

  @override
  final MetaDataEntity? metaData;
  @override
  final String? ownerAddress;
  @override
  final int? amount;
  @override
  final String? assetType;
  @override
  final bool? isFrozen;

  @override
  String toString() {
    return 'UserWalletToken(metaData: $metaData, ownerAddress: $ownerAddress, amount: $amount, assetType: $assetType, isFrozen: $isFrozen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWalletTokenImpl &&
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

  /// Create a copy of UserWalletToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWalletTokenImplCopyWith<_$UserWalletTokenImpl> get copyWith =>
      __$$UserWalletTokenImplCopyWithImpl<_$UserWalletTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWalletTokenImplToJson(
      this,
    );
  }
}

abstract class _UserWalletToken extends UserWalletToken {
  const factory _UserWalletToken(
      {required final MetaDataEntity? metaData,
      required final String? ownerAddress,
      required final int? amount,
      required final String? assetType,
      required final bool? isFrozen}) = _$UserWalletTokenImpl;
  const _UserWalletToken._() : super._();

  factory _UserWalletToken.fromJson(Map<String, dynamic> json) =
      _$UserWalletTokenImpl.fromJson;

  @override
  MetaDataEntity? get metaData;
  @override
  String? get ownerAddress;
  @override
  int? get amount;
  @override
  String? get assetType;
  @override
  bool? get isFrozen;

  /// Create a copy of UserWalletToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWalletTokenImplCopyWith<_$UserWalletTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaDataEntity _$MetaDataEntityFromJson(Map<String, dynamic> json) {
  return _MetaDataEntity.fromJson(json);
}

/// @nodoc
mixin _$MetaDataEntity {
  int? get decimals => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;

  /// Serializes this MetaDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaDataEntityCopyWith<MetaDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataEntityCopyWith<$Res> {
  factory $MetaDataEntityCopyWith(
          MetaDataEntity value, $Res Function(MetaDataEntity) then) =
      _$MetaDataEntityCopyWithImpl<$Res, MetaDataEntity>;
  @useResult
  $Res call({int? decimals, String? name, String? symbol});
}

/// @nodoc
class _$MetaDataEntityCopyWithImpl<$Res, $Val extends MetaDataEntity>
    implements $MetaDataEntityCopyWith<$Res> {
  _$MetaDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaDataEntity
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
abstract class _$$MetaDataEntityImplCopyWith<$Res>
    implements $MetaDataEntityCopyWith<$Res> {
  factory _$$MetaDataEntityImplCopyWith(_$MetaDataEntityImpl value,
          $Res Function(_$MetaDataEntityImpl) then) =
      __$$MetaDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? decimals, String? name, String? symbol});
}

/// @nodoc
class __$$MetaDataEntityImplCopyWithImpl<$Res>
    extends _$MetaDataEntityCopyWithImpl<$Res, _$MetaDataEntityImpl>
    implements _$$MetaDataEntityImplCopyWith<$Res> {
  __$$MetaDataEntityImplCopyWithImpl(
      _$MetaDataEntityImpl _value, $Res Function(_$MetaDataEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decimals = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$MetaDataEntityImpl(
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
class _$MetaDataEntityImpl extends _MetaDataEntity {
  const _$MetaDataEntityImpl(
      {required this.decimals, required this.name, required this.symbol})
      : super._();

  factory _$MetaDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataEntityImplFromJson(json);

  @override
  final int? decimals;
  @override
  final String? name;
  @override
  final String? symbol;

  @override
  String toString() {
    return 'MetaDataEntity(decimals: $decimals, name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataEntityImpl &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, decimals, name, symbol);

  /// Create a copy of MetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataEntityImplCopyWith<_$MetaDataEntityImpl> get copyWith =>
      __$$MetaDataEntityImplCopyWithImpl<_$MetaDataEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataEntityImplToJson(
      this,
    );
  }
}

abstract class _MetaDataEntity extends MetaDataEntity {
  const factory _MetaDataEntity(
      {required final int? decimals,
      required final String? name,
      required final String? symbol}) = _$MetaDataEntityImpl;
  const _MetaDataEntity._() : super._();

  factory _MetaDataEntity.fromJson(Map<String, dynamic> json) =
      _$MetaDataEntityImpl.fromJson;

  @override
  int? get decimals;
  @override
  String? get name;
  @override
  String? get symbol;

  /// Create a copy of MetaDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaDataEntityImplCopyWith<_$MetaDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
