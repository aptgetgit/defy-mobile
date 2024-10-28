// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_wallet_nft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserWalletNFT _$UserWalletNFTFromJson(Map<String, dynamic> json) {
  return _UserWalletNFT.fromJson(json);
}

/// @nodoc
mixin _$UserWalletNFT {
  String? get nftId => throw _privateConstructorUsedError;
  String? get acquiredUsdPrice => throw _privateConstructorUsedError;
  String? get acquiredPrice => throw _privateConstructorUsedError;
  NFTCollection? get collection => throw _privateConstructorUsedError;
  NFT? get nft => throw _privateConstructorUsedError;

  /// Serializes this UserWalletNFT to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserWalletNFT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWalletNFTCopyWith<UserWalletNFT> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletNFTCopyWith<$Res> {
  factory $UserWalletNFTCopyWith(
          UserWalletNFT value, $Res Function(UserWalletNFT) then) =
      _$UserWalletNFTCopyWithImpl<$Res, UserWalletNFT>;
  @useResult
  $Res call(
      {String? nftId,
      String? acquiredUsdPrice,
      String? acquiredPrice,
      NFTCollection? collection,
      NFT? nft});

  $NFTCollectionCopyWith<$Res>? get collection;
  $NFTCopyWith<$Res>? get nft;
}

/// @nodoc
class _$UserWalletNFTCopyWithImpl<$Res, $Val extends UserWalletNFT>
    implements $UserWalletNFTCopyWith<$Res> {
  _$UserWalletNFTCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWalletNFT
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
              as NFTCollection?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as NFT?,
    ) as $Val);
  }

  /// Create a copy of UserWalletNFT
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NFTCollectionCopyWith<$Res>? get collection {
    if (_value.collection == null) {
      return null;
    }

    return $NFTCollectionCopyWith<$Res>(_value.collection!, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }

  /// Create a copy of UserWalletNFT
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NFTCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $NFTCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserWalletNFTImplCopyWith<$Res>
    implements $UserWalletNFTCopyWith<$Res> {
  factory _$$UserWalletNFTImplCopyWith(
          _$UserWalletNFTImpl value, $Res Function(_$UserWalletNFTImpl) then) =
      __$$UserWalletNFTImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nftId,
      String? acquiredUsdPrice,
      String? acquiredPrice,
      NFTCollection? collection,
      NFT? nft});

  @override
  $NFTCollectionCopyWith<$Res>? get collection;
  @override
  $NFTCopyWith<$Res>? get nft;
}

/// @nodoc
class __$$UserWalletNFTImplCopyWithImpl<$Res>
    extends _$UserWalletNFTCopyWithImpl<$Res, _$UserWalletNFTImpl>
    implements _$$UserWalletNFTImplCopyWith<$Res> {
  __$$UserWalletNFTImplCopyWithImpl(
      _$UserWalletNFTImpl _value, $Res Function(_$UserWalletNFTImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserWalletNFT
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
    return _then(_$UserWalletNFTImpl(
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
              as NFTCollection?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as NFT?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWalletNFTImpl extends _UserWalletNFT {
  const _$UserWalletNFTImpl(
      {required this.nftId,
      required this.acquiredUsdPrice,
      required this.acquiredPrice,
      required this.collection,
      required this.nft})
      : super._();

  factory _$UserWalletNFTImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWalletNFTImplFromJson(json);

  @override
  final String? nftId;
  @override
  final String? acquiredUsdPrice;
  @override
  final String? acquiredPrice;
  @override
  final NFTCollection? collection;
  @override
  final NFT? nft;

  @override
  String toString() {
    return 'UserWalletNFT(nftId: $nftId, acquiredUsdPrice: $acquiredUsdPrice, acquiredPrice: $acquiredPrice, collection: $collection, nft: $nft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWalletNFTImpl &&
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

  /// Create a copy of UserWalletNFT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWalletNFTImplCopyWith<_$UserWalletNFTImpl> get copyWith =>
      __$$UserWalletNFTImplCopyWithImpl<_$UserWalletNFTImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWalletNFTImplToJson(
      this,
    );
  }
}

abstract class _UserWalletNFT extends UserWalletNFT {
  const factory _UserWalletNFT(
      {required final String? nftId,
      required final String? acquiredUsdPrice,
      required final String? acquiredPrice,
      required final NFTCollection? collection,
      required final NFT? nft}) = _$UserWalletNFTImpl;
  const _UserWalletNFT._() : super._();

  factory _UserWalletNFT.fromJson(Map<String, dynamic> json) =
      _$UserWalletNFTImpl.fromJson;

  @override
  String? get nftId;
  @override
  String? get acquiredUsdPrice;
  @override
  String? get acquiredPrice;
  @override
  NFTCollection? get collection;
  @override
  NFT? get nft;

  /// Create a copy of UserWalletNFT
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWalletNFTImplCopyWith<_$UserWalletNFTImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NFTCollection _$NFTCollectionFromJson(Map<String, dynamic> json) {
  return _NFTCollection.fromJson(json);
}

/// @nodoc
mixin _$NFTCollection {
  String? get coverUrl => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  bool? get verified => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  int? get floor => throw _privateConstructorUsedError;

  /// Serializes this NFTCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTCollectionCopyWith<NFTCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTCollectionCopyWith<$Res> {
  factory $NFTCollectionCopyWith(
          NFTCollection value, $Res Function(NFTCollection) then) =
      _$NFTCollectionCopyWithImpl<$Res, NFTCollection>;
  @useResult
  $Res call(
      {String? coverUrl,
      String? title,
      bool? verified,
      String? id,
      int? floor});
}

/// @nodoc
class _$NFTCollectionCopyWithImpl<$Res, $Val extends NFTCollection>
    implements $NFTCollectionCopyWith<$Res> {
  _$NFTCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTCollection
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
abstract class _$$NFTCollectionImplCopyWith<$Res>
    implements $NFTCollectionCopyWith<$Res> {
  factory _$$NFTCollectionImplCopyWith(
          _$NFTCollectionImpl value, $Res Function(_$NFTCollectionImpl) then) =
      __$$NFTCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? coverUrl,
      String? title,
      bool? verified,
      String? id,
      int? floor});
}

/// @nodoc
class __$$NFTCollectionImplCopyWithImpl<$Res>
    extends _$NFTCollectionCopyWithImpl<$Res, _$NFTCollectionImpl>
    implements _$$NFTCollectionImplCopyWith<$Res> {
  __$$NFTCollectionImplCopyWithImpl(
      _$NFTCollectionImpl _value, $Res Function(_$NFTCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTCollection
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
    return _then(_$NFTCollectionImpl(
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
class _$NFTCollectionImpl extends _NFTCollection {
  const _$NFTCollectionImpl(
      {required this.coverUrl,
      required this.title,
      required this.verified,
      required this.id,
      required this.floor})
      : super._();

  factory _$NFTCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTCollectionImplFromJson(json);

  @override
  final String? coverUrl;
  @override
  final String? title;
  @override
  final bool? verified;
  @override
  final String? id;
  @override
  final int? floor;

  @override
  String toString() {
    return 'NFTCollection(coverUrl: $coverUrl, title: $title, verified: $verified, id: $id, floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTCollectionImpl &&
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

  /// Create a copy of NFTCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTCollectionImplCopyWith<_$NFTCollectionImpl> get copyWith =>
      __$$NFTCollectionImplCopyWithImpl<_$NFTCollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTCollectionImplToJson(
      this,
    );
  }
}

abstract class _NFTCollection extends NFTCollection {
  const factory _NFTCollection(
      {required final String? coverUrl,
      required final String? title,
      required final bool? verified,
      required final String? id,
      required final int? floor}) = _$NFTCollectionImpl;
  const _NFTCollection._() : super._();

  factory _NFTCollection.fromJson(Map<String, dynamic> json) =
      _$NFTCollectionImpl.fromJson;

  @override
  String? get coverUrl;
  @override
  String? get title;
  @override
  bool? get verified;
  @override
  String? get id;
  @override
  int? get floor;

  /// Create a copy of NFTCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTCollectionImplCopyWith<_$NFTCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NFT _$NFTFromJson(Map<String, dynamic> json) {
  return _NFT.fromJson(json);
}

/// @nodoc
mixin _$NFT {
  String? get name => throw _privateConstructorUsedError;
  String? get owner => throw _privateConstructorUsedError;
  bool? get staked => throw _privateConstructorUsedError;
  String? get tokenId => throw _privateConstructorUsedError;
  bool? get burned => throw _privateConstructorUsedError;
  String? get mediaType => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get contractId => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  List<NFTListing?>? get listings => throw _privateConstructorUsedError;

  /// Serializes this NFT to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTCopyWith<NFT> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTCopyWith<$Res> {
  factory $NFTCopyWith(NFT value, $Res Function(NFT) then) =
      _$NFTCopyWithImpl<$Res, NFT>;
  @useResult
  $Res call(
      {String? name,
      String? owner,
      bool? staked,
      String? tokenId,
      bool? burned,
      String? mediaType,
      String? mediaUrl,
      String? contractId,
      int? version,
      List<NFTListing?>? listings});
}

/// @nodoc
class _$NFTCopyWithImpl<$Res, $Val extends NFT> implements $NFTCopyWith<$Res> {
  _$NFTCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFT
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
              as List<NFTListing?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTImplCopyWith<$Res> implements $NFTCopyWith<$Res> {
  factory _$$NFTImplCopyWith(_$NFTImpl value, $Res Function(_$NFTImpl) then) =
      __$$NFTImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? owner,
      bool? staked,
      String? tokenId,
      bool? burned,
      String? mediaType,
      String? mediaUrl,
      String? contractId,
      int? version,
      List<NFTListing?>? listings});
}

/// @nodoc
class __$$NFTImplCopyWithImpl<$Res> extends _$NFTCopyWithImpl<$Res, _$NFTImpl>
    implements _$$NFTImplCopyWith<$Res> {
  __$$NFTImplCopyWithImpl(_$NFTImpl _value, $Res Function(_$NFTImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFT
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
    return _then(_$NFTImpl(
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
              as List<NFTListing?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NFTImpl extends _NFT {
  const _$NFTImpl(
      {required this.name,
      required this.owner,
      required this.staked,
      required this.tokenId,
      required this.burned,
      required this.mediaType,
      required this.mediaUrl,
      required this.contractId,
      required this.version,
      required final List<NFTListing?>? listings})
      : _listings = listings,
        super._();

  factory _$NFTImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTImplFromJson(json);

  @override
  final String? name;
  @override
  final String? owner;
  @override
  final bool? staked;
  @override
  final String? tokenId;
  @override
  final bool? burned;
  @override
  final String? mediaType;
  @override
  final String? mediaUrl;
  @override
  final String? contractId;
  @override
  final int? version;
  final List<NFTListing?>? _listings;
  @override
  List<NFTListing?>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NFT(name: $name, owner: $owner, staked: $staked, tokenId: $tokenId, burned: $burned, mediaType: $mediaType, mediaUrl: $mediaUrl, contractId: $contractId, version: $version, listings: $listings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTImpl &&
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

  /// Create a copy of NFT
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTImplCopyWith<_$NFTImpl> get copyWith =>
      __$$NFTImplCopyWithImpl<_$NFTImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTImplToJson(
      this,
    );
  }
}

abstract class _NFT extends NFT {
  const factory _NFT(
      {required final String? name,
      required final String? owner,
      required final bool? staked,
      required final String? tokenId,
      required final bool? burned,
      required final String? mediaType,
      required final String? mediaUrl,
      required final String? contractId,
      required final int? version,
      required final List<NFTListing?>? listings}) = _$NFTImpl;
  const _NFT._() : super._();

  factory _NFT.fromJson(Map<String, dynamic> json) = _$NFTImpl.fromJson;

  @override
  String? get name;
  @override
  String? get owner;
  @override
  bool? get staked;
  @override
  String? get tokenId;
  @override
  bool? get burned;
  @override
  String? get mediaType;
  @override
  String? get mediaUrl;
  @override
  String? get contractId;
  @override
  int? get version;
  @override
  List<NFTListing?>? get listings;

  /// Create a copy of NFT
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTImplCopyWith<_$NFTImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NFTListing _$NFTListingFromJson(Map<String, dynamic> json) {
  return _NFTListing.fromJson(json);
}

/// @nodoc
mixin _$NFTListing {
  bool? get listed => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  /// Serializes this NFTListing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NFTListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTListingCopyWith<NFTListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTListingCopyWith<$Res> {
  factory $NFTListingCopyWith(
          NFTListing value, $Res Function(NFTListing) then) =
      _$NFTListingCopyWithImpl<$Res, NFTListing>;
  @useResult
  $Res call({bool? listed, int? price});
}

/// @nodoc
class _$NFTListingCopyWithImpl<$Res, $Val extends NFTListing>
    implements $NFTListingCopyWith<$Res> {
  _$NFTListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTListing
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
abstract class _$$NFTListingImplCopyWith<$Res>
    implements $NFTListingCopyWith<$Res> {
  factory _$$NFTListingImplCopyWith(
          _$NFTListingImpl value, $Res Function(_$NFTListingImpl) then) =
      __$$NFTListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? listed, int? price});
}

/// @nodoc
class __$$NFTListingImplCopyWithImpl<$Res>
    extends _$NFTListingCopyWithImpl<$Res, _$NFTListingImpl>
    implements _$$NFTListingImplCopyWith<$Res> {
  __$$NFTListingImplCopyWithImpl(
      _$NFTListingImpl _value, $Res Function(_$NFTListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listed = freezed,
    Object? price = freezed,
  }) {
    return _then(_$NFTListingImpl(
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
class _$NFTListingImpl extends _NFTListing {
  const _$NFTListingImpl({required this.listed, required this.price})
      : super._();

  factory _$NFTListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NFTListingImplFromJson(json);

  @override
  final bool? listed;
  @override
  final int? price;

  @override
  String toString() {
    return 'NFTListing(listed: $listed, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTListingImpl &&
            (identical(other.listed, listed) || other.listed == listed) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listed, price);

  /// Create a copy of NFTListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTListingImplCopyWith<_$NFTListingImpl> get copyWith =>
      __$$NFTListingImplCopyWithImpl<_$NFTListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NFTListingImplToJson(
      this,
    );
  }
}

abstract class _NFTListing extends NFTListing {
  const factory _NFTListing(
      {required final bool? listed,
      required final int? price}) = _$NFTListingImpl;
  const _NFTListing._() : super._();

  factory _NFTListing.fromJson(Map<String, dynamic> json) =
      _$NFTListingImpl.fromJson;

  @override
  bool? get listed;
  @override
  int? get price;

  /// Create a copy of NFTListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTListingImplCopyWith<_$NFTListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
