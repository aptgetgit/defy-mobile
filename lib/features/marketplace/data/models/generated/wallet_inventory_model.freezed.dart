// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../wallet_inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletInventoryModel _$WalletInventoryModelFromJson(Map<String, dynamic> json) {
  return _WalletInventoryModel.fromJson(json);
}

/// @nodoc
mixin _$WalletInventoryModel {
  @JsonKey(name: 'aptos')
  AptosModel get aptos => throw _privateConstructorUsedError;

  /// Serializes this WalletInventoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletInventoryModelCopyWith<WalletInventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletInventoryModelCopyWith<$Res> {
  factory $WalletInventoryModelCopyWith(WalletInventoryModel value,
          $Res Function(WalletInventoryModel) then) =
      _$WalletInventoryModelCopyWithImpl<$Res, WalletInventoryModel>;
  @useResult
  $Res call({@JsonKey(name: 'aptos') AptosModel aptos});

  $AptosModelCopyWith<$Res> get aptos;
}

/// @nodoc
class _$WalletInventoryModelCopyWithImpl<$Res,
        $Val extends WalletInventoryModel>
    implements $WalletInventoryModelCopyWith<$Res> {
  _$WalletInventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aptos = null,
  }) {
    return _then(_value.copyWith(
      aptos: null == aptos
          ? _value.aptos
          : aptos // ignore: cast_nullable_to_non_nullable
              as AptosModel,
    ) as $Val);
  }

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AptosModelCopyWith<$Res> get aptos {
    return $AptosModelCopyWith<$Res>(_value.aptos, (value) {
      return _then(_value.copyWith(aptos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletInventoryModelImplCopyWith<$Res>
    implements $WalletInventoryModelCopyWith<$Res> {
  factory _$$WalletInventoryModelImplCopyWith(_$WalletInventoryModelImpl value,
          $Res Function(_$WalletInventoryModelImpl) then) =
      __$$WalletInventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'aptos') AptosModel aptos});

  @override
  $AptosModelCopyWith<$Res> get aptos;
}

/// @nodoc
class __$$WalletInventoryModelImplCopyWithImpl<$Res>
    extends _$WalletInventoryModelCopyWithImpl<$Res, _$WalletInventoryModelImpl>
    implements _$$WalletInventoryModelImplCopyWith<$Res> {
  __$$WalletInventoryModelImplCopyWithImpl(_$WalletInventoryModelImpl _value,
      $Res Function(_$WalletInventoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aptos = null,
  }) {
    return _then(_$WalletInventoryModelImpl(
      aptos: null == aptos
          ? _value.aptos
          : aptos // ignore: cast_nullable_to_non_nullable
              as AptosModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletInventoryModelImpl implements _WalletInventoryModel {
  _$WalletInventoryModelImpl({@JsonKey(name: 'aptos') required this.aptos});

  factory _$WalletInventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletInventoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'aptos')
  final AptosModel aptos;

  @override
  String toString() {
    return 'WalletInventoryModel(aptos: $aptos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletInventoryModelImpl &&
            (identical(other.aptos, aptos) || other.aptos == aptos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, aptos);

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletInventoryModelImplCopyWith<_$WalletInventoryModelImpl>
      get copyWith =>
          __$$WalletInventoryModelImplCopyWithImpl<_$WalletInventoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletInventoryModelImplToJson(
      this,
    );
  }
}

abstract class _WalletInventoryModel implements WalletInventoryModel {
  factory _WalletInventoryModel(
          {@JsonKey(name: 'aptos') required final AptosModel aptos}) =
      _$WalletInventoryModelImpl;

  factory _WalletInventoryModel.fromJson(Map<String, dynamic> json) =
      _$WalletInventoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'aptos')
  AptosModel get aptos;

  /// Create a copy of WalletInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletInventoryModelImplCopyWith<_$WalletInventoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AptosModel _$AptosModelFromJson(Map<String, dynamic> json) {
  return _AptosModel.fromJson(json);
}

/// @nodoc
mixin _$AptosModel {
  @JsonKey(name: 'collections')
  List<CollectionModel> get collections => throw _privateConstructorUsedError;

  /// Serializes this AptosModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AptosModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AptosModelCopyWith<AptosModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AptosModelCopyWith<$Res> {
  factory $AptosModelCopyWith(
          AptosModel value, $Res Function(AptosModel) then) =
      _$AptosModelCopyWithImpl<$Res, AptosModel>;
  @useResult
  $Res call({@JsonKey(name: 'collections') List<CollectionModel> collections});
}

/// @nodoc
class _$AptosModelCopyWithImpl<$Res, $Val extends AptosModel>
    implements $AptosModelCopyWith<$Res> {
  _$AptosModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AptosModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
  }) {
    return _then(_value.copyWith(
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AptosModelImplCopyWith<$Res>
    implements $AptosModelCopyWith<$Res> {
  factory _$$AptosModelImplCopyWith(
          _$AptosModelImpl value, $Res Function(_$AptosModelImpl) then) =
      __$$AptosModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'collections') List<CollectionModel> collections});
}

/// @nodoc
class __$$AptosModelImplCopyWithImpl<$Res>
    extends _$AptosModelCopyWithImpl<$Res, _$AptosModelImpl>
    implements _$$AptosModelImplCopyWith<$Res> {
  __$$AptosModelImplCopyWithImpl(
      _$AptosModelImpl _value, $Res Function(_$AptosModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AptosModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
  }) {
    return _then(_$AptosModelImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AptosModelImpl implements _AptosModel {
  _$AptosModelImpl(
      {@JsonKey(name: 'collections')
      required final List<CollectionModel> collections})
      : _collections = collections;

  factory _$AptosModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AptosModelImplFromJson(json);

  final List<CollectionModel> _collections;
  @override
  @JsonKey(name: 'collections')
  List<CollectionModel> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  String toString() {
    return 'AptosModel(collections: $collections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AptosModelImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collections));

  /// Create a copy of AptosModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AptosModelImplCopyWith<_$AptosModelImpl> get copyWith =>
      __$$AptosModelImplCopyWithImpl<_$AptosModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AptosModelImplToJson(
      this,
    );
  }
}

abstract class _AptosModel implements AptosModel {
  factory _AptosModel(
      {@JsonKey(name: 'collections')
      required final List<CollectionModel> collections}) = _$AptosModelImpl;

  factory _AptosModel.fromJson(Map<String, dynamic> json) =
      _$AptosModelImpl.fromJson;

  @override
  @JsonKey(name: 'collections')
  List<CollectionModel> get collections;

  /// Create a copy of AptosModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AptosModelImplCopyWith<_$AptosModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) {
  return _CollectionModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionModel {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor')
  double? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd_volume')
  double? get usdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  bool get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String? get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'nfts')
  List<NFTModel> get nfts => throw _privateConstructorUsedError;

  /// Serializes this CollectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionModelCopyWith<CollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionModelCopyWith<$Res> {
  factory $CollectionModelCopyWith(
          CollectionModel value, $Res Function(CollectionModel) then) =
      _$CollectionModelCopyWithImpl<$Res, CollectionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'floor') double? floor,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'verified') bool verified,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'nfts') List<NFTModel> nfts});
}

/// @nodoc
class _$CollectionModelCopyWithImpl<$Res, $Val extends CollectionModel>
    implements $CollectionModelCopyWith<$Res> {
  _$CollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? floor = freezed,
    Object? usdVolume = freezed,
    Object? verified = null,
    Object? coverUrl = freezed,
    Object? nfts = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as double?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nfts: null == nfts
          ? _value.nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<NFTModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionModelImplCopyWith<$Res>
    implements $CollectionModelCopyWith<$Res> {
  factory _$$CollectionModelImplCopyWith(_$CollectionModelImpl value,
          $Res Function(_$CollectionModelImpl) then) =
      __$$CollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'floor') double? floor,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'verified') bool verified,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'nfts') List<NFTModel> nfts});
}

/// @nodoc
class __$$CollectionModelImplCopyWithImpl<$Res>
    extends _$CollectionModelCopyWithImpl<$Res, _$CollectionModelImpl>
    implements _$$CollectionModelImplCopyWith<$Res> {
  __$$CollectionModelImplCopyWithImpl(
      _$CollectionModelImpl _value, $Res Function(_$CollectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? floor = freezed,
    Object? usdVolume = freezed,
    Object? verified = null,
    Object? coverUrl = freezed,
    Object? nfts = null,
  }) {
    return _then(_$CollectionModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as double?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nfts: null == nfts
          ? _value._nfts
          : nfts // ignore: cast_nullable_to_non_nullable
              as List<NFTModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionModelImpl implements _CollectionModel {
  _$CollectionModelImpl(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'floor') this.floor,
      @JsonKey(name: 'usd_volume') this.usdVolume,
      @JsonKey(name: 'verified') required this.verified,
      @JsonKey(name: 'cover_url') this.coverUrl,
      @JsonKey(name: 'nfts') required final List<NFTModel> nfts})
      : _nfts = nfts;

  factory _$CollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionModelImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'floor')
  final double? floor;
  @override
  @JsonKey(name: 'usd_volume')
  final double? usdVolume;
  @override
  @JsonKey(name: 'verified')
  final bool verified;
  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  final List<NFTModel> _nfts;
  @override
  @JsonKey(name: 'nfts')
  List<NFTModel> get nfts {
    if (_nfts is EqualUnmodifiableListView) return _nfts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nfts);
  }

  @override
  String toString() {
    return 'CollectionModel(title: $title, description: $description, floor: $floor, usdVolume: $usdVolume, verified: $verified, coverUrl: $coverUrl, nfts: $nfts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.usdVolume, usdVolume) ||
                other.usdVolume == usdVolume) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            const DeepCollectionEquality().equals(other._nfts, _nfts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      floor,
      usdVolume,
      verified,
      coverUrl,
      const DeepCollectionEquality().hash(_nfts));

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionModelImplCopyWith<_$CollectionModelImpl> get copyWith =>
      __$$CollectionModelImplCopyWithImpl<_$CollectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionModel implements CollectionModel {
  factory _CollectionModel(
          {@JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'floor') final double? floor,
          @JsonKey(name: 'usd_volume') final double? usdVolume,
          @JsonKey(name: 'verified') required final bool verified,
          @JsonKey(name: 'cover_url') final String? coverUrl,
          @JsonKey(name: 'nfts') required final List<NFTModel> nfts}) =
      _$CollectionModelImpl;

  factory _CollectionModel.fromJson(Map<String, dynamic> json) =
      _$CollectionModelImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'floor')
  double? get floor;
  @override
  @JsonKey(name: 'usd_volume')
  double? get usdVolume;
  @override
  @JsonKey(name: 'verified')
  bool get verified;
  @override
  @JsonKey(name: 'cover_url')
  String? get coverUrl;
  @override
  @JsonKey(name: 'nfts')
  List<NFTModel> get nfts;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionModelImplCopyWith<_$CollectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NFTModel _$NFTModelFromJson(Map<String, dynamic> json) {
  return _NFTModel.fromJson(json);
}

/// @nodoc
mixin _$NFTModel {
  @JsonKey(name: 'media_url')
  String get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection')
  CollectionTitleModel get collection => throw _privateConstructorUsedError;

  /// Serializes this NFTModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTModelCopyWith<NFTModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTModelCopyWith<$Res> {
  factory $NFTModelCopyWith(NFTModel value, $Res Function(NFTModel) then) =
      _$NFTModelCopyWithImpl<$Res, NFTModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'media_url') String mediaUrl,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'collection') CollectionTitleModel collection});

  $CollectionTitleModelCopyWith<$Res> get collection;
}

/// @nodoc
class _$NFTModelCopyWithImpl<$Res, $Val extends NFTModel>
    implements $NFTModelCopyWith<$Res> {
  _$NFTModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? name = null,
    Object? owner = null,
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionTitleModel,
    ) as $Val);
  }

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionTitleModelCopyWith<$Res> get collection {
    return $CollectionTitleModelCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NFTModelImplCopyWith<$Res>
    implements $NFTModelCopyWith<$Res> {
  factory _$$NFTModelImplCopyWith(
          _$NFTModelImpl value, $Res Function(_$NFTModelImpl) then) =
      __$$NFTModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'media_url') String mediaUrl,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'owner') String owner,
      @JsonKey(name: 'collection') CollectionTitleModel collection});

  @override
  $CollectionTitleModelCopyWith<$Res> get collection;
}

/// @nodoc
class __$$NFTModelImplCopyWithImpl<$Res>
    extends _$NFTModelCopyWithImpl<$Res, _$NFTModelImpl>
    implements _$$NFTModelImplCopyWith<$Res> {
  __$$NFTModelImplCopyWithImpl(
      _$NFTModelImpl _value, $Res Function(_$NFTModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrl = null,
    Object? name = null,
    Object? owner = null,
    Object? collection = null,
  }) {
    return _then(_$NFTModelImpl(
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionTitleModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTModelImpl implements _NFTModel {
  _$NFTModelImpl(
      {@JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'owner') required this.owner,
      @JsonKey(name: 'collection') required this.collection});

  factory _$NFTModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTModelImplFromJson(json);

  @override
  @JsonKey(name: 'media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'owner')
  final String owner;
  @override
  @JsonKey(name: 'collection')
  final CollectionTitleModel collection;

  @override
  String toString() {
    return 'NFTModel(mediaUrl: $mediaUrl, name: $name, owner: $owner, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTModelImpl &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mediaUrl, name, owner, collection);

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTModelImplCopyWith<_$NFTModelImpl> get copyWith =>
      __$$NFTModelImplCopyWithImpl<_$NFTModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTModelImplToJson(
      this,
    );
  }
}

abstract class _NFTModel implements NFTModel {
  factory _NFTModel(
      {@JsonKey(name: 'media_url') required final String mediaUrl,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'owner') required final String owner,
      @JsonKey(name: 'collection')
      required final CollectionTitleModel collection}) = _$NFTModelImpl;

  factory _NFTModel.fromJson(Map<String, dynamic> json) =
      _$NFTModelImpl.fromJson;

  @override
  @JsonKey(name: 'media_url')
  String get mediaUrl;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'owner')
  String get owner;
  @override
  @JsonKey(name: 'collection')
  CollectionTitleModel get collection;

  /// Create a copy of NFTModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTModelImplCopyWith<_$NFTModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectionTitleModel _$CollectionTitleModelFromJson(Map<String, dynamic> json) {
  return _CollectionTitleModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionTitleModel {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;

  /// Serializes this CollectionTitleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionTitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionTitleModelCopyWith<CollectionTitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionTitleModelCopyWith<$Res> {
  factory $CollectionTitleModelCopyWith(CollectionTitleModel value,
          $Res Function(CollectionTitleModel) then) =
      _$CollectionTitleModelCopyWithImpl<$Res, CollectionTitleModel>;
  @useResult
  $Res call({@JsonKey(name: 'title') String title});
}

/// @nodoc
class _$CollectionTitleModelCopyWithImpl<$Res,
        $Val extends CollectionTitleModel>
    implements $CollectionTitleModelCopyWith<$Res> {
  _$CollectionTitleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionTitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionTitleModelImplCopyWith<$Res>
    implements $CollectionTitleModelCopyWith<$Res> {
  factory _$$CollectionTitleModelImplCopyWith(_$CollectionTitleModelImpl value,
          $Res Function(_$CollectionTitleModelImpl) then) =
      __$$CollectionTitleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'title') String title});
}

/// @nodoc
class __$$CollectionTitleModelImplCopyWithImpl<$Res>
    extends _$CollectionTitleModelCopyWithImpl<$Res, _$CollectionTitleModelImpl>
    implements _$$CollectionTitleModelImplCopyWith<$Res> {
  __$$CollectionTitleModelImplCopyWithImpl(_$CollectionTitleModelImpl _value,
      $Res Function(_$CollectionTitleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionTitleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$CollectionTitleModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionTitleModelImpl implements _CollectionTitleModel {
  _$CollectionTitleModelImpl({@JsonKey(name: 'title') required this.title});

  factory _$CollectionTitleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionTitleModelImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  String toString() {
    return 'CollectionTitleModel(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionTitleModelImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of CollectionTitleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionTitleModelImplCopyWith<_$CollectionTitleModelImpl>
      get copyWith =>
          __$$CollectionTitleModelImplCopyWithImpl<_$CollectionTitleModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionTitleModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionTitleModel implements CollectionTitleModel {
  factory _CollectionTitleModel(
          {@JsonKey(name: 'title') required final String title}) =
      _$CollectionTitleModelImpl;

  factory _CollectionTitleModel.fromJson(Map<String, dynamic> json) =
      _$CollectionTitleModelImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;

  /// Create a copy of CollectionTitleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionTitleModelImplCopyWith<_$CollectionTitleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
