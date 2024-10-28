// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_wallet_nft_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserWalletNFTRemoteModel _$UserWalletNFTRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _UserWalletNFTRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$UserWalletNFTRemoteModel {
  @JsonKey(name: 'nft_id')
  String? get nftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquired_usd_price')
  String? get acquiredUsdPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquired_price')
  String? get acquiredPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection')
  NFTCollectionRemoteModel? get collection =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'nft')
  NFTRemoteModel? get nft => throw _privateConstructorUsedError;

  /// Serializes this UserWalletNFTRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWalletNFTRemoteModelCopyWith<UserWalletNFTRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletNFTRemoteModelCopyWith<$Res> {
  factory $UserWalletNFTRemoteModelCopyWith(UserWalletNFTRemoteModel value,
          $Res Function(UserWalletNFTRemoteModel) then) =
      _$UserWalletNFTRemoteModelCopyWithImpl<$Res, UserWalletNFTRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nft_id') String? nftId,
      @JsonKey(name: 'acquired_usd_price') String? acquiredUsdPrice,
      @JsonKey(name: 'acquired_price') String? acquiredPrice,
      @JsonKey(name: 'collection') NFTCollectionRemoteModel? collection,
      @JsonKey(name: 'nft') NFTRemoteModel? nft});

  $NFTCollectionRemoteModelCopyWith<$Res>? get collection;
  $NFTRemoteModelCopyWith<$Res>? get nft;
}

/// @nodoc
class _$UserWalletNFTRemoteModelCopyWithImpl<$Res,
        $Val extends UserWalletNFTRemoteModel>
    implements $UserWalletNFTRemoteModelCopyWith<$Res> {
  _$UserWalletNFTRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nftId = freezed,
    Object? acquiredUsdPrice = freezed,
    Object? acquiredPrice = freezed,
    Object? collection = freezed,
    Object? nft = freezed,
  }) {
    return _then(_value.copyWith(
      nftId: freezed == nftId
          ? _value.nftId
          : nftId // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredUsdPrice: freezed == acquiredUsdPrice
          ? _value.acquiredUsdPrice
          : acquiredUsdPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredPrice: freezed == acquiredPrice
          ? _value.acquiredPrice
          : acquiredPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as NFTCollectionRemoteModel?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as NFTRemoteModel?,
    ) as $Val);
  }

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NFTCollectionRemoteModelCopyWith<$Res>? get collection {
    if (_value.collection == null) {
      return null;
    }

    return $NFTCollectionRemoteModelCopyWith<$Res>(_value.collection!, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NFTRemoteModelCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $NFTRemoteModelCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWalletNFTRemoteModelImplCopyWith<$Res>
    implements $UserWalletNFTRemoteModelCopyWith<$Res> {
  factory _$$UserWalletNFTRemoteModelImplCopyWith(
          _$UserWalletNFTRemoteModelImpl value,
          $Res Function(_$UserWalletNFTRemoteModelImpl) then) =
      __$$UserWalletNFTRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nft_id') String? nftId,
      @JsonKey(name: 'acquired_usd_price') String? acquiredUsdPrice,
      @JsonKey(name: 'acquired_price') String? acquiredPrice,
      @JsonKey(name: 'collection') NFTCollectionRemoteModel? collection,
      @JsonKey(name: 'nft') NFTRemoteModel? nft});

  @override
  $NFTCollectionRemoteModelCopyWith<$Res>? get collection;
  @override
  $NFTRemoteModelCopyWith<$Res>? get nft;
}

/// @nodoc
class __$$UserWalletNFTRemoteModelImplCopyWithImpl<$Res>
    extends _$UserWalletNFTRemoteModelCopyWithImpl<$Res,
        _$UserWalletNFTRemoteModelImpl>
    implements _$$UserWalletNFTRemoteModelImplCopyWith<$Res> {
  __$$UserWalletNFTRemoteModelImplCopyWithImpl(
      _$UserWalletNFTRemoteModelImpl _value,
      $Res Function(_$UserWalletNFTRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nftId = freezed,
    Object? acquiredUsdPrice = freezed,
    Object? acquiredPrice = freezed,
    Object? collection = freezed,
    Object? nft = freezed,
  }) {
    return _then(_$UserWalletNFTRemoteModelImpl(
      nftId: freezed == nftId
          ? _value.nftId
          : nftId // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredUsdPrice: freezed == acquiredUsdPrice
          ? _value.acquiredUsdPrice
          : acquiredUsdPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      acquiredPrice: freezed == acquiredPrice
          ? _value.acquiredPrice
          : acquiredPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as NFTCollectionRemoteModel?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as NFTRemoteModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWalletNFTRemoteModelImpl implements _UserWalletNFTRemoteModel {
  _$UserWalletNFTRemoteModelImpl(
      {@JsonKey(name: 'nft_id') required this.nftId,
      @JsonKey(name: 'acquired_usd_price') required this.acquiredUsdPrice,
      @JsonKey(name: 'acquired_price') required this.acquiredPrice,
      @JsonKey(name: 'collection') required this.collection,
      @JsonKey(name: 'nft') required this.nft});

  factory _$UserWalletNFTRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWalletNFTRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'nft_id')
  final String? nftId;
  @override
  @JsonKey(name: 'acquired_usd_price')
  final String? acquiredUsdPrice;
  @override
  @JsonKey(name: 'acquired_price')
  final String? acquiredPrice;
  @override
  @JsonKey(name: 'collection')
  final NFTCollectionRemoteModel? collection;
  @override
  @JsonKey(name: 'nft')
  final NFTRemoteModel? nft;

  @override
  String toString() {
    return 'UserWalletNFTRemoteModel(nftId: $nftId, acquiredUsdPrice: $acquiredUsdPrice, acquiredPrice: $acquiredPrice, collection: $collection, nft: $nft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWalletNFTRemoteModelImpl &&
            (identical(other.nftId, nftId) || other.nftId == nftId) &&
            (identical(other.acquiredUsdPrice, acquiredUsdPrice) ||
                other.acquiredUsdPrice == acquiredUsdPrice) &&
            (identical(other.acquiredPrice, acquiredPrice) ||
                other.acquiredPrice == acquiredPrice) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.nft, nft) || other.nft == nft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, nftId, acquiredUsdPrice, acquiredPrice, collection, nft);

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWalletNFTRemoteModelImplCopyWith<_$UserWalletNFTRemoteModelImpl>
      get copyWith => __$$UserWalletNFTRemoteModelImplCopyWithImpl<
          _$UserWalletNFTRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWalletNFTRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _UserWalletNFTRemoteModel implements UserWalletNFTRemoteModel {
  factory _UserWalletNFTRemoteModel(
          {@JsonKey(name: 'nft_id') required final String? nftId,
          @JsonKey(name: 'acquired_usd_price')
          required final String? acquiredUsdPrice,
          @JsonKey(name: 'acquired_price') required final String? acquiredPrice,
          @JsonKey(name: 'collection')
          required final NFTCollectionRemoteModel? collection,
          @JsonKey(name: 'nft') required final NFTRemoteModel? nft}) =
      _$UserWalletNFTRemoteModelImpl;

  factory _UserWalletNFTRemoteModel.fromJson(Map<String, dynamic> json) =
      _$UserWalletNFTRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'nft_id')
  String? get nftId;
  @override
  @JsonKey(name: 'acquired_usd_price')
  String? get acquiredUsdPrice;
  @override
  @JsonKey(name: 'acquired_price')
  String? get acquiredPrice;
  @override
  @JsonKey(name: 'collection')
  NFTCollectionRemoteModel? get collection;
  @override
  @JsonKey(name: 'nft')
  NFTRemoteModel? get nft;

  /// Create a copy of UserWalletNFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWalletNFTRemoteModelImplCopyWith<_$UserWalletNFTRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NFTCollectionRemoteModel _$NFTCollectionRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _NFTCollectionRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$NFTCollectionRemoteModel {
  @JsonKey(name: 'cover_url')
  String? get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  bool? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor')
  int? get floor => throw _privateConstructorUsedError;

  /// Serializes this NFTCollectionRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTCollectionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTCollectionRemoteModelCopyWith<NFTCollectionRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTCollectionRemoteModelCopyWith<$Res> {
  factory $NFTCollectionRemoteModelCopyWith(NFTCollectionRemoteModel value,
          $Res Function(NFTCollectionRemoteModel) then) =
      _$NFTCollectionRemoteModelCopyWithImpl<$Res, NFTCollectionRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'verified') bool? verified,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'floor') int? floor});
}

/// @nodoc
class _$NFTCollectionRemoteModelCopyWithImpl<$Res,
        $Val extends NFTCollectionRemoteModel>
    implements $NFTCollectionRemoteModelCopyWith<$Res> {
  _$NFTCollectionRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTCollectionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverUrl = freezed,
    Object? title = freezed,
    Object? verified = freezed,
    Object? id = freezed,
    Object? floor = freezed,
  }) {
    return _then(_value.copyWith(
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTCollectionRemoteModelImplCopyWith<$Res>
    implements $NFTCollectionRemoteModelCopyWith<$Res> {
  factory _$$NFTCollectionRemoteModelImplCopyWith(
          _$NFTCollectionRemoteModelImpl value,
          $Res Function(_$NFTCollectionRemoteModelImpl) then) =
      __$$NFTCollectionRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'verified') bool? verified,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'floor') int? floor});
}

/// @nodoc
class __$$NFTCollectionRemoteModelImplCopyWithImpl<$Res>
    extends _$NFTCollectionRemoteModelCopyWithImpl<$Res,
        _$NFTCollectionRemoteModelImpl>
    implements _$$NFTCollectionRemoteModelImplCopyWith<$Res> {
  __$$NFTCollectionRemoteModelImplCopyWithImpl(
      _$NFTCollectionRemoteModelImpl _value,
      $Res Function(_$NFTCollectionRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTCollectionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverUrl = freezed,
    Object? title = freezed,
    Object? verified = freezed,
    Object? id = freezed,
    Object? floor = freezed,
  }) {
    return _then(_$NFTCollectionRemoteModelImpl(
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTCollectionRemoteModelImpl implements _NFTCollectionRemoteModel {
  _$NFTCollectionRemoteModelImpl(
      {@JsonKey(name: 'cover_url') required this.coverUrl,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'verified') required this.verified,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'floor') required this.floor});

  factory _$NFTCollectionRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTCollectionRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'verified')
  final bool? verified;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'floor')
  final int? floor;

  @override
  String toString() {
    return 'NFTCollectionRemoteModel(coverUrl: $coverUrl, title: $title, verified: $verified, id: $id, floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTCollectionRemoteModelImpl &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, coverUrl, title, verified, id, floor);

  /// Create a copy of NFTCollectionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTCollectionRemoteModelImplCopyWith<_$NFTCollectionRemoteModelImpl>
      get copyWith => __$$NFTCollectionRemoteModelImplCopyWithImpl<
          _$NFTCollectionRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTCollectionRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _NFTCollectionRemoteModel implements NFTCollectionRemoteModel {
  factory _NFTCollectionRemoteModel(
          {@JsonKey(name: 'cover_url') required final String? coverUrl,
          @JsonKey(name: 'title') required final String? title,
          @JsonKey(name: 'verified') required final bool? verified,
          @JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'floor') required final int? floor}) =
      _$NFTCollectionRemoteModelImpl;

  factory _NFTCollectionRemoteModel.fromJson(Map<String, dynamic> json) =
      _$NFTCollectionRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'cover_url')
  String? get coverUrl;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'verified')
  bool? get verified;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'floor')
  int? get floor;

  /// Create a copy of NFTCollectionRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTCollectionRemoteModelImplCopyWith<_$NFTCollectionRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NFTRemoteModel _$NFTRemoteModelFromJson(Map<String, dynamic> json) {
  return _NFTRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$NFTRemoteModel {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'staked')
  bool? get staked => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_id')
  String? get tokenId => throw _privateConstructorUsedError;
  @JsonKey(name: 'burned')
  bool? get burned => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_id')
  String? get contractId => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  int? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'listings')
  List<NFTListingModel?>? get listings => throw _privateConstructorUsedError;

  /// Serializes this NFTRemoteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTRemoteModelCopyWith<NFTRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTRemoteModelCopyWith<$Res> {
  factory $NFTRemoteModelCopyWith(
          NFTRemoteModel value, $Res Function(NFTRemoteModel) then) =
      _$NFTRemoteModelCopyWithImpl<$Res, NFTRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'staked') bool? staked,
      @JsonKey(name: 'token_id') String? tokenId,
      @JsonKey(name: 'burned') bool? burned,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'contract_id') String? contractId,
      @JsonKey(name: 'version') int? version,
      @JsonKey(name: 'listings') List<NFTListingModel?>? listings});
}

/// @nodoc
class _$NFTRemoteModelCopyWithImpl<$Res, $Val extends NFTRemoteModel>
    implements $NFTRemoteModelCopyWith<$Res> {
  _$NFTRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? staked = freezed,
    Object? tokenId = freezed,
    Object? burned = freezed,
    Object? mediaType = freezed,
    Object? mediaUrl = freezed,
    Object? contractId = freezed,
    Object? version = freezed,
    Object? listings = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      staked: freezed == staked
          ? _value.staked
          : staked // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      burned: freezed == burned
          ? _value.burned
          : burned // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contractId: freezed == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      listings: freezed == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<NFTListingModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTRemoteModelImplCopyWith<$Res>
    implements $NFTRemoteModelCopyWith<$Res> {
  factory _$$NFTRemoteModelImplCopyWith(_$NFTRemoteModelImpl value,
          $Res Function(_$NFTRemoteModelImpl) then) =
      __$$NFTRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'staked') bool? staked,
      @JsonKey(name: 'token_id') String? tokenId,
      @JsonKey(name: 'burned') bool? burned,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'contract_id') String? contractId,
      @JsonKey(name: 'version') int? version,
      @JsonKey(name: 'listings') List<NFTListingModel?>? listings});
}

/// @nodoc
class __$$NFTRemoteModelImplCopyWithImpl<$Res>
    extends _$NFTRemoteModelCopyWithImpl<$Res, _$NFTRemoteModelImpl>
    implements _$$NFTRemoteModelImplCopyWith<$Res> {
  __$$NFTRemoteModelImplCopyWithImpl(
      _$NFTRemoteModelImpl _value, $Res Function(_$NFTRemoteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? staked = freezed,
    Object? tokenId = freezed,
    Object? burned = freezed,
    Object? mediaType = freezed,
    Object? mediaUrl = freezed,
    Object? contractId = freezed,
    Object? version = freezed,
    Object? listings = freezed,
  }) {
    return _then(_$NFTRemoteModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      staked: freezed == staked
          ? _value.staked
          : staked // ignore: cast_nullable_to_non_nullable
              as bool?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String?,
      burned: freezed == burned
          ? _value.burned
          : burned // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contractId: freezed == contractId
          ? _value.contractId
          : contractId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      listings: freezed == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<NFTListingModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTRemoteModelImpl implements _NFTRemoteModel {
  _$NFTRemoteModelImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'owner') required this.owner,
      @JsonKey(name: 'staked') required this.staked,
      @JsonKey(name: 'token_id') required this.tokenId,
      @JsonKey(name: 'burned') required this.burned,
      @JsonKey(name: 'media_type') required this.mediaType,
      @JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'contract_id') required this.contractId,
      @JsonKey(name: 'version') required this.version,
      @JsonKey(name: 'listings')
      required final List<NFTListingModel?>? listings})
      : _listings = listings;

  factory _$NFTRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTRemoteModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'staked')
  final bool? staked;
  @override
  @JsonKey(name: 'token_id')
  final String? tokenId;
  @override
  @JsonKey(name: 'burned')
  final bool? burned;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'contract_id')
  final String? contractId;
  @override
  @JsonKey(name: 'version')
  final int? version;
  final List<NFTListingModel?>? _listings;
  @override
  @JsonKey(name: 'listings')
  List<NFTListingModel?>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NFTRemoteModel(name: $name, owner: $owner, staked: $staked, tokenId: $tokenId, burned: $burned, mediaType: $mediaType, mediaUrl: $mediaUrl, contractId: $contractId, version: $version, listings: $listings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTRemoteModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.staked, staked) || other.staked == staked) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.burned, burned) || other.burned == burned) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.contractId, contractId) ||
                other.contractId == contractId) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      owner,
      staked,
      tokenId,
      burned,
      mediaType,
      mediaUrl,
      contractId,
      version,
      const DeepCollectionEquality().hash(_listings));

  /// Create a copy of NFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTRemoteModelImplCopyWith<_$NFTRemoteModelImpl> get copyWith =>
      __$$NFTRemoteModelImplCopyWithImpl<_$NFTRemoteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _NFTRemoteModel implements NFTRemoteModel {
  factory _NFTRemoteModel(
      {@JsonKey(name: 'name') required final String? name,
      @JsonKey(name: 'owner') required final String? owner,
      @JsonKey(name: 'staked') required final bool? staked,
      @JsonKey(name: 'token_id') required final String? tokenId,
      @JsonKey(name: 'burned') required final bool? burned,
      @JsonKey(name: 'media_type') required final String? mediaType,
      @JsonKey(name: 'media_url') required final String? mediaUrl,
      @JsonKey(name: 'contract_id') required final String? contractId,
      @JsonKey(name: 'version') required final int? version,
      @JsonKey(name: 'listings')
      required final List<NFTListingModel?>? listings}) = _$NFTRemoteModelImpl;

  factory _NFTRemoteModel.fromJson(Map<String, dynamic> json) =
      _$NFTRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'staked')
  bool? get staked;
  @override
  @JsonKey(name: 'token_id')
  String? get tokenId;
  @override
  @JsonKey(name: 'burned')
  bool? get burned;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'contract_id')
  String? get contractId;
  @override
  @JsonKey(name: 'version')
  int? get version;
  @override
  @JsonKey(name: 'listings')
  List<NFTListingModel?>? get listings;

  /// Create a copy of NFTRemoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTRemoteModelImplCopyWith<_$NFTRemoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NFTListingModel _$NFTListingModelFromJson(Map<String, dynamic> json) {
  return _NFTListingModel.fromJson(json);
}

/// @nodoc
mixin _$NFTListingModel {
  @JsonKey(name: 'listed')
  bool? get listed => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int? get price => throw _privateConstructorUsedError;

  /// Serializes this NFTListingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTListingModelCopyWith<NFTListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTListingModelCopyWith<$Res> {
  factory $NFTListingModelCopyWith(
          NFTListingModel value, $Res Function(NFTListingModel) then) =
      _$NFTListingModelCopyWithImpl<$Res, NFTListingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'listed') bool? listed,
      @JsonKey(name: 'price') int? price});
}

/// @nodoc
class _$NFTListingModelCopyWithImpl<$Res, $Val extends NFTListingModel>
    implements $NFTListingModelCopyWith<$Res> {
  _$NFTListingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listed = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      listed: freezed == listed
          ? _value.listed
          : listed // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTListingModelImplCopyWith<$Res>
    implements $NFTListingModelCopyWith<$Res> {
  factory _$$NFTListingModelImplCopyWith(_$NFTListingModelImpl value,
          $Res Function(_$NFTListingModelImpl) then) =
      __$$NFTListingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listed') bool? listed,
      @JsonKey(name: 'price') int? price});
}

/// @nodoc
class __$$NFTListingModelImplCopyWithImpl<$Res>
    extends _$NFTListingModelCopyWithImpl<$Res, _$NFTListingModelImpl>
    implements _$$NFTListingModelImplCopyWith<$Res> {
  __$$NFTListingModelImplCopyWithImpl(
      _$NFTListingModelImpl _value, $Res Function(_$NFTListingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listed = freezed,
    Object? price = freezed,
  }) {
    return _then(_$NFTListingModelImpl(
      listed: freezed == listed
          ? _value.listed
          : listed // ignore: cast_nullable_to_non_nullable
              as bool?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTListingModelImpl implements _NFTListingModel {
  _$NFTListingModelImpl(
      {@JsonKey(name: 'listed') required this.listed,
      @JsonKey(name: 'price') required this.price});

  factory _$NFTListingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTListingModelImplFromJson(json);

  @override
  @JsonKey(name: 'listed')
  final bool? listed;
  @override
  @JsonKey(name: 'price')
  final int? price;

  @override
  String toString() {
    return 'NFTListingModel(listed: $listed, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTListingModelImpl &&
            (identical(other.listed, listed) || other.listed == listed) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listed, price);

  /// Create a copy of NFTListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTListingModelImplCopyWith<_$NFTListingModelImpl> get copyWith =>
      __$$NFTListingModelImplCopyWithImpl<_$NFTListingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTListingModelImplToJson(
      this,
    );
  }
}

abstract class _NFTListingModel implements NFTListingModel {
  factory _NFTListingModel(
          {@JsonKey(name: 'listed') required final bool? listed,
          @JsonKey(name: 'price') required final int? price}) =
      _$NFTListingModelImpl;

  factory _NFTListingModel.fromJson(Map<String, dynamic> json) =
      _$NFTListingModelImpl.fromJson;

  @override
  @JsonKey(name: 'listed')
  bool? get listed;
  @override
  @JsonKey(name: 'price')
  int? get price;

  /// Create a copy of NFTListingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTListingModelImplCopyWith<_$NFTListingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
