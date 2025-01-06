// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../collection_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollectionDetailsModel _$CollectionDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionDetailsModel {
  @JsonKey(name: 'collections')
  List<CollectionInfoModel>? get collectionInfo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'listings')
  List<CollectionListingsModel>? get listings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_stats')
  CollectionStatsModel? get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'actions')
  List<CollectionActivityModel>? get activity =>
      throw _privateConstructorUsedError;

  /// Serializes this CollectionDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionDetailsModelCopyWith<CollectionDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionDetailsModelCopyWith<$Res> {
  factory $CollectionDetailsModelCopyWith(CollectionDetailsModel value,
          $Res Function(CollectionDetailsModel) then) =
      _$CollectionDetailsModelCopyWithImpl<$Res, CollectionDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'collections') List<CollectionInfoModel>? collectionInfo,
      @JsonKey(name: 'listings') List<CollectionListingsModel>? listings,
      @JsonKey(name: 'collection_stats') CollectionStatsModel? stats,
      @JsonKey(name: 'actions') List<CollectionActivityModel>? activity});

  $CollectionStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class _$CollectionDetailsModelCopyWithImpl<$Res,
        $Val extends CollectionDetailsModel>
    implements $CollectionDetailsModelCopyWith<$Res> {
  _$CollectionDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionInfo = freezed,
    Object? listings = freezed,
    Object? stats = freezed,
    Object? activity = freezed,
  }) {
    return _then(_value.copyWith(
      collectionInfo: freezed == collectionInfo
          ? _value.collectionInfo
          : collectionInfo // ignore: cast_nullable_to_non_nullable
              as List<CollectionInfoModel>?,
      listings: freezed == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<CollectionListingsModel>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CollectionStatsModel?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<CollectionActivityModel>?,
    ) as $Val);
  }

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionStatsModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $CollectionStatsModelCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionDetailsModelImplCopyWith<$Res>
    implements $CollectionDetailsModelCopyWith<$Res> {
  factory _$$CollectionDetailsModelImplCopyWith(
          _$CollectionDetailsModelImpl value,
          $Res Function(_$CollectionDetailsModelImpl) then) =
      __$$CollectionDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'collections') List<CollectionInfoModel>? collectionInfo,
      @JsonKey(name: 'listings') List<CollectionListingsModel>? listings,
      @JsonKey(name: 'collection_stats') CollectionStatsModel? stats,
      @JsonKey(name: 'actions') List<CollectionActivityModel>? activity});

  @override
  $CollectionStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$CollectionDetailsModelImplCopyWithImpl<$Res>
    extends _$CollectionDetailsModelCopyWithImpl<$Res,
        _$CollectionDetailsModelImpl>
    implements _$$CollectionDetailsModelImplCopyWith<$Res> {
  __$$CollectionDetailsModelImplCopyWithImpl(
      _$CollectionDetailsModelImpl _value,
      $Res Function(_$CollectionDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionInfo = freezed,
    Object? listings = freezed,
    Object? stats = freezed,
    Object? activity = freezed,
  }) {
    return _then(_$CollectionDetailsModelImpl(
      collectionInfo: freezed == collectionInfo
          ? _value._collectionInfo
          : collectionInfo // ignore: cast_nullable_to_non_nullable
              as List<CollectionInfoModel>?,
      listings: freezed == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<CollectionListingsModel>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as CollectionStatsModel?,
      activity: freezed == activity
          ? _value._activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<CollectionActivityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionDetailsModelImpl implements _CollectionDetailsModel {
  _$CollectionDetailsModelImpl(
      {@JsonKey(name: 'collections')
      required final List<CollectionInfoModel>? collectionInfo,
      @JsonKey(name: 'listings')
      required final List<CollectionListingsModel>? listings,
      @JsonKey(name: 'collection_stats') required this.stats,
      @JsonKey(name: 'actions')
      required final List<CollectionActivityModel>? activity})
      : _collectionInfo = collectionInfo,
        _listings = listings,
        _activity = activity;

  factory _$CollectionDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionDetailsModelImplFromJson(json);

  final List<CollectionInfoModel>? _collectionInfo;
  @override
  @JsonKey(name: 'collections')
  List<CollectionInfoModel>? get collectionInfo {
    final value = _collectionInfo;
    if (value == null) return null;
    if (_collectionInfo is EqualUnmodifiableListView) return _collectionInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CollectionListingsModel>? _listings;
  @override
  @JsonKey(name: 'listings')
  List<CollectionListingsModel>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'collection_stats')
  final CollectionStatsModel? stats;
  final List<CollectionActivityModel>? _activity;
  @override
  @JsonKey(name: 'actions')
  List<CollectionActivityModel>? get activity {
    final value = _activity;
    if (value == null) return null;
    if (_activity is EqualUnmodifiableListView) return _activity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CollectionDetailsModel(collectionInfo: $collectionInfo, listings: $listings, stats: $stats, activity: $activity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionDetailsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._collectionInfo, _collectionInfo) &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._activity, _activity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_collectionInfo),
      const DeepCollectionEquality().hash(_listings),
      stats,
      const DeepCollectionEquality().hash(_activity));

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionDetailsModelImplCopyWith<_$CollectionDetailsModelImpl>
      get copyWith => __$$CollectionDetailsModelImplCopyWithImpl<
          _$CollectionDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionDetailsModel implements CollectionDetailsModel {
  factory _CollectionDetailsModel(
          {@JsonKey(name: 'collections')
          required final List<CollectionInfoModel>? collectionInfo,
          @JsonKey(name: 'listings')
          required final List<CollectionListingsModel>? listings,
          @JsonKey(name: 'collection_stats')
          required final CollectionStatsModel? stats,
          @JsonKey(name: 'actions')
          required final List<CollectionActivityModel>? activity}) =
      _$CollectionDetailsModelImpl;

  factory _CollectionDetailsModel.fromJson(Map<String, dynamic> json) =
      _$CollectionDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'collections')
  List<CollectionInfoModel>? get collectionInfo;
  @override
  @JsonKey(name: 'listings')
  List<CollectionListingsModel>? get listings;
  @override
  @JsonKey(name: 'collection_stats')
  CollectionStatsModel? get stats;
  @override
  @JsonKey(name: 'actions')
  List<CollectionActivityModel>? get activity;

  /// Create a copy of CollectionDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionDetailsModelImplCopyWith<_$CollectionDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionInfoModel _$CollectionInfoModelFromJson(Map<String, dynamic> json) {
  return _CollectionInfoModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionInfoModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'semantic_slug')
  String? get semanticSlug => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor')
  int? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume')
  int? get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd_volume')
  double? get usdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String? get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'supply')
  int? get supply => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  bool? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'discord')
  String? get discord => throw _privateConstructorUsedError;
  @JsonKey(name: 'twitter')
  String? get twitter => throw _privateConstructorUsedError;
  @JsonKey(name: 'website')
  String? get website => throw _privateConstructorUsedError;

  /// Serializes this CollectionInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionInfoModelCopyWith<CollectionInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionInfoModelCopyWith<$Res> {
  factory $CollectionInfoModelCopyWith(
          CollectionInfoModel value, $Res Function(CollectionInfoModel) then) =
      _$CollectionInfoModelCopyWithImpl<$Res, CollectionInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'semantic_slug') String? semanticSlug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'floor') int? floor,
      @JsonKey(name: 'volume') int? volume,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'supply') int? supply,
      @JsonKey(name: 'verified') bool? verified,
      @JsonKey(name: 'discord') String? discord,
      @JsonKey(name: 'twitter') String? twitter,
      @JsonKey(name: 'website') String? website});
}

/// @nodoc
class _$CollectionInfoModelCopyWithImpl<$Res, $Val extends CollectionInfoModel>
    implements $CollectionInfoModelCopyWith<$Res> {
  _$CollectionInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? semanticSlug = freezed,
    Object? description = freezed,
    Object? floor = freezed,
    Object? volume = freezed,
    Object? usdVolume = freezed,
    Object? coverUrl = freezed,
    Object? supply = freezed,
    Object? verified = freezed,
    Object? discord = freezed,
    Object? twitter = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      semanticSlug: freezed == semanticSlug
          ? _value.semanticSlug
          : semanticSlug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionInfoModelImplCopyWith<$Res>
    implements $CollectionInfoModelCopyWith<$Res> {
  factory _$$CollectionInfoModelImplCopyWith(_$CollectionInfoModelImpl value,
          $Res Function(_$CollectionInfoModelImpl) then) =
      __$$CollectionInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'semantic_slug') String? semanticSlug,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'floor') int? floor,
      @JsonKey(name: 'volume') int? volume,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'supply') int? supply,
      @JsonKey(name: 'verified') bool? verified,
      @JsonKey(name: 'discord') String? discord,
      @JsonKey(name: 'twitter') String? twitter,
      @JsonKey(name: 'website') String? website});
}

/// @nodoc
class __$$CollectionInfoModelImplCopyWithImpl<$Res>
    extends _$CollectionInfoModelCopyWithImpl<$Res, _$CollectionInfoModelImpl>
    implements _$$CollectionInfoModelImplCopyWith<$Res> {
  __$$CollectionInfoModelImplCopyWithImpl(_$CollectionInfoModelImpl _value,
      $Res Function(_$CollectionInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? semanticSlug = freezed,
    Object? description = freezed,
    Object? floor = freezed,
    Object? volume = freezed,
    Object? usdVolume = freezed,
    Object? coverUrl = freezed,
    Object? supply = freezed,
    Object? verified = freezed,
    Object? discord = freezed,
    Object? twitter = freezed,
    Object? website = freezed,
  }) {
    return _then(_$CollectionInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      semanticSlug: freezed == semanticSlug
          ? _value.semanticSlug
          : semanticSlug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: freezed == twitter
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionInfoModelImpl implements _CollectionInfoModel {
  _$CollectionInfoModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'slug') required this.slug,
      @JsonKey(name: 'semantic_slug') required this.semanticSlug,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'floor') required this.floor,
      @JsonKey(name: 'volume') required this.volume,
      @JsonKey(name: 'usd_volume') required this.usdVolume,
      @JsonKey(name: 'cover_url') required this.coverUrl,
      @JsonKey(name: 'supply') required this.supply,
      @JsonKey(name: 'verified') required this.verified,
      @JsonKey(name: 'discord') required this.discord,
      @JsonKey(name: 'twitter') required this.twitter,
      @JsonKey(name: 'website') required this.website});

  factory _$CollectionInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'semantic_slug')
  final String? semanticSlug;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'floor')
  final int? floor;
  @override
  @JsonKey(name: 'volume')
  final int? volume;
  @override
  @JsonKey(name: 'usd_volume')
  final double? usdVolume;
  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  @override
  @JsonKey(name: 'supply')
  final int? supply;
  @override
  @JsonKey(name: 'verified')
  final bool? verified;
  @override
  @JsonKey(name: 'discord')
  final String? discord;
  @override
  @JsonKey(name: 'twitter')
  final String? twitter;
  @override
  @JsonKey(name: 'website')
  final String? website;

  @override
  String toString() {
    return 'CollectionInfoModel(id: $id, title: $title, slug: $slug, semanticSlug: $semanticSlug, description: $description, floor: $floor, volume: $volume, usdVolume: $usdVolume, coverUrl: $coverUrl, supply: $supply, verified: $verified, discord: $discord, twitter: $twitter, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.semanticSlug, semanticSlug) ||
                other.semanticSlug == semanticSlug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.usdVolume, usdVolume) ||
                other.usdVolume == usdVolume) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.discord, discord) || other.discord == discord) &&
            (identical(other.twitter, twitter) || other.twitter == twitter) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      slug,
      semanticSlug,
      description,
      floor,
      volume,
      usdVolume,
      coverUrl,
      supply,
      verified,
      discord,
      twitter,
      website);

  /// Create a copy of CollectionInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionInfoModelImplCopyWith<_$CollectionInfoModelImpl> get copyWith =>
      __$$CollectionInfoModelImplCopyWithImpl<_$CollectionInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionInfoModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionInfoModel implements CollectionInfoModel {
  factory _CollectionInfoModel(
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'title') required final String? title,
          @JsonKey(name: 'slug') required final String? slug,
          @JsonKey(name: 'semantic_slug') required final String? semanticSlug,
          @JsonKey(name: 'description') required final String? description,
          @JsonKey(name: 'floor') required final int? floor,
          @JsonKey(name: 'volume') required final int? volume,
          @JsonKey(name: 'usd_volume') required final double? usdVolume,
          @JsonKey(name: 'cover_url') required final String? coverUrl,
          @JsonKey(name: 'supply') required final int? supply,
          @JsonKey(name: 'verified') required final bool? verified,
          @JsonKey(name: 'discord') required final String? discord,
          @JsonKey(name: 'twitter') required final String? twitter,
          @JsonKey(name: 'website') required final String? website}) =
      _$CollectionInfoModelImpl;

  factory _CollectionInfoModel.fromJson(Map<String, dynamic> json) =
      _$CollectionInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'semantic_slug')
  String? get semanticSlug;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'floor')
  int? get floor;
  @override
  @JsonKey(name: 'volume')
  int? get volume;
  @override
  @JsonKey(name: 'usd_volume')
  double? get usdVolume;
  @override
  @JsonKey(name: 'cover_url')
  String? get coverUrl;
  @override
  @JsonKey(name: 'supply')
  int? get supply;
  @override
  @JsonKey(name: 'verified')
  bool? get verified;
  @override
  @JsonKey(name: 'discord')
  String? get discord;
  @override
  @JsonKey(name: 'twitter')
  String? get twitter;
  @override
  @JsonKey(name: 'website')
  String? get website;

  /// Create a copy of CollectionInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionInfoModelImplCopyWith<_$CollectionInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectionListingsModel _$CollectionListingsModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionListingsModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionListingsModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_time')
  String? get blockTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller')
  String? get seller => throw _privateConstructorUsedError;
  @JsonKey(name: 'nft')
  CollectionListingsNFTModel? get nft => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract')
  CollectionListingsContractModel? get contract =>
      throw _privateConstructorUsedError;

  /// Serializes this CollectionListingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionListingsModelCopyWith<CollectionListingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionListingsModelCopyWith<$Res> {
  factory $CollectionListingsModelCopyWith(CollectionListingsModel value,
          $Res Function(CollectionListingsModel) then) =
      _$CollectionListingsModelCopyWithImpl<$Res, CollectionListingsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'seller') String? seller,
      @JsonKey(name: 'nft') CollectionListingsNFTModel? nft,
      @JsonKey(name: 'contract') CollectionListingsContractModel? contract});

  $CollectionListingsNFTModelCopyWith<$Res>? get nft;
  $CollectionListingsContractModelCopyWith<$Res>? get contract;
}

/// @nodoc
class _$CollectionListingsModelCopyWithImpl<$Res,
        $Val extends CollectionListingsModel>
    implements $CollectionListingsModelCopyWith<$Res> {
  _$CollectionListingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? blockTime = freezed,
    Object? seller = freezed,
    Object? nft = freezed,
    Object? contract = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as CollectionListingsNFTModel?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as CollectionListingsContractModel?,
    ) as $Val);
  }

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionListingsNFTModelCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $CollectionListingsNFTModelCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionListingsContractModelCopyWith<$Res>? get contract {
    if (_value.contract == null) {
      return null;
    }

    return $CollectionListingsContractModelCopyWith<$Res>(_value.contract!,
        (value) {
      return _then(_value.copyWith(contract: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionListingsModelImplCopyWith<$Res>
    implements $CollectionListingsModelCopyWith<$Res> {
  factory _$$CollectionListingsModelImplCopyWith(
          _$CollectionListingsModelImpl value,
          $Res Function(_$CollectionListingsModelImpl) then) =
      __$$CollectionListingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'seller') String? seller,
      @JsonKey(name: 'nft') CollectionListingsNFTModel? nft,
      @JsonKey(name: 'contract') CollectionListingsContractModel? contract});

  @override
  $CollectionListingsNFTModelCopyWith<$Res>? get nft;
  @override
  $CollectionListingsContractModelCopyWith<$Res>? get contract;
}

/// @nodoc
class __$$CollectionListingsModelImplCopyWithImpl<$Res>
    extends _$CollectionListingsModelCopyWithImpl<$Res,
        _$CollectionListingsModelImpl>
    implements _$$CollectionListingsModelImplCopyWith<$Res> {
  __$$CollectionListingsModelImplCopyWithImpl(
      _$CollectionListingsModelImpl _value,
      $Res Function(_$CollectionListingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? price = freezed,
    Object? blockTime = freezed,
    Object? seller = freezed,
    Object? nft = freezed,
    Object? contract = freezed,
  }) {
    return _then(_$CollectionListingsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as CollectionListingsNFTModel?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as CollectionListingsContractModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionListingsModelImpl implements _CollectionListingsModel {
  _$CollectionListingsModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'block_time') required this.blockTime,
      @JsonKey(name: 'seller') required this.seller,
      @JsonKey(name: 'nft') required this.nft,
      @JsonKey(name: 'contract') required this.contract});

  factory _$CollectionListingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionListingsModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'price')
  final int? price;
  @override
  @JsonKey(name: 'block_time')
  final String? blockTime;
  @override
  @JsonKey(name: 'seller')
  final String? seller;
  @override
  @JsonKey(name: 'nft')
  final CollectionListingsNFTModel? nft;
  @override
  @JsonKey(name: 'contract')
  final CollectionListingsContractModel? contract;

  @override
  String toString() {
    return 'CollectionListingsModel(id: $id, price: $price, blockTime: $blockTime, seller: $seller, nft: $nft, contract: $contract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionListingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.nft, nft) || other.nft == nft) &&
            (identical(other.contract, contract) ||
                other.contract == contract));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, blockTime, seller, nft, contract);

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionListingsModelImplCopyWith<_$CollectionListingsModelImpl>
      get copyWith => __$$CollectionListingsModelImplCopyWithImpl<
          _$CollectionListingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionListingsModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionListingsModel implements CollectionListingsModel {
  factory _CollectionListingsModel(
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'price') required final int? price,
          @JsonKey(name: 'block_time') required final String? blockTime,
          @JsonKey(name: 'seller') required final String? seller,
          @JsonKey(name: 'nft') required final CollectionListingsNFTModel? nft,
          @JsonKey(name: 'contract')
          required final CollectionListingsContractModel? contract}) =
      _$CollectionListingsModelImpl;

  factory _CollectionListingsModel.fromJson(Map<String, dynamic> json) =
      _$CollectionListingsModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'price')
  int? get price;
  @override
  @JsonKey(name: 'block_time')
  String? get blockTime;
  @override
  @JsonKey(name: 'seller')
  String? get seller;
  @override
  @JsonKey(name: 'nft')
  CollectionListingsNFTModel? get nft;
  @override
  @JsonKey(name: 'contract')
  CollectionListingsContractModel? get contract;

  /// Create a copy of CollectionListingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionListingsModelImplCopyWith<_$CollectionListingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionListingsNFTModel _$CollectionListingsNFTModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionListingsNFTModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionListingsNFTModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ranking')
  int? get ranking => throw _privateConstructorUsedError;

  /// Serializes this CollectionListingsNFTModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionListingsNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionListingsNFTModelCopyWith<CollectionListingsNFTModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionListingsNFTModelCopyWith<$Res> {
  factory $CollectionListingsNFTModelCopyWith(CollectionListingsNFTModel value,
          $Res Function(CollectionListingsNFTModel) then) =
      _$CollectionListingsNFTModelCopyWithImpl<$Res,
          CollectionListingsNFTModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'ranking') int? ranking});
}

/// @nodoc
class _$CollectionListingsNFTModelCopyWithImpl<$Res,
        $Val extends CollectionListingsNFTModel>
    implements $CollectionListingsNFTModelCopyWith<$Res> {
  _$CollectionListingsNFTModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionListingsNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mediaUrl = freezed,
    Object? mediaType = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionListingsNFTModelImplCopyWith<$Res>
    implements $CollectionListingsNFTModelCopyWith<$Res> {
  factory _$$CollectionListingsNFTModelImplCopyWith(
          _$CollectionListingsNFTModelImpl value,
          $Res Function(_$CollectionListingsNFTModelImpl) then) =
      __$$CollectionListingsNFTModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'ranking') int? ranking});
}

/// @nodoc
class __$$CollectionListingsNFTModelImplCopyWithImpl<$Res>
    extends _$CollectionListingsNFTModelCopyWithImpl<$Res,
        _$CollectionListingsNFTModelImpl>
    implements _$$CollectionListingsNFTModelImplCopyWith<$Res> {
  __$$CollectionListingsNFTModelImplCopyWithImpl(
      _$CollectionListingsNFTModelImpl _value,
      $Res Function(_$CollectionListingsNFTModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionListingsNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mediaUrl = freezed,
    Object? mediaType = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_$CollectionListingsNFTModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionListingsNFTModelImpl implements _CollectionListingsNFTModel {
  _$CollectionListingsNFTModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'media_type') required this.mediaType,
      @JsonKey(name: 'ranking') required this.ranking});

  factory _$CollectionListingsNFTModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CollectionListingsNFTModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  @JsonKey(name: 'ranking')
  final int? ranking;

  @override
  String toString() {
    return 'CollectionListingsNFTModel(id: $id, name: $name, mediaUrl: $mediaUrl, mediaType: $mediaType, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionListingsNFTModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, mediaUrl, mediaType, ranking);

  /// Create a copy of CollectionListingsNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionListingsNFTModelImplCopyWith<_$CollectionListingsNFTModelImpl>
      get copyWith => __$$CollectionListingsNFTModelImplCopyWithImpl<
          _$CollectionListingsNFTModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionListingsNFTModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionListingsNFTModel
    implements CollectionListingsNFTModel {
  factory _CollectionListingsNFTModel(
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'name') required final String? name,
          @JsonKey(name: 'media_url') required final String? mediaUrl,
          @JsonKey(name: 'media_type') required final String? mediaType,
          @JsonKey(name: 'ranking') required final int? ranking}) =
      _$CollectionListingsNFTModelImpl;

  factory _CollectionListingsNFTModel.fromJson(Map<String, dynamic> json) =
      _$CollectionListingsNFTModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'ranking')
  int? get ranking;

  /// Create a copy of CollectionListingsNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionListingsNFTModelImplCopyWith<_$CollectionListingsNFTModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionListingsContractModel _$CollectionListingsContractModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionListingsContractModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionListingsContractModel {
  @JsonKey(name: 'key')
  String? get key => throw _privateConstructorUsedError;

  /// Serializes this CollectionListingsContractModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionListingsContractModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionListingsContractModelCopyWith<CollectionListingsContractModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionListingsContractModelCopyWith<$Res> {
  factory $CollectionListingsContractModelCopyWith(
          CollectionListingsContractModel value,
          $Res Function(CollectionListingsContractModel) then) =
      _$CollectionListingsContractModelCopyWithImpl<$Res,
          CollectionListingsContractModel>;
  @useResult
  $Res call({@JsonKey(name: 'key') String? key});
}

/// @nodoc
class _$CollectionListingsContractModelCopyWithImpl<$Res,
        $Val extends CollectionListingsContractModel>
    implements $CollectionListingsContractModelCopyWith<$Res> {
  _$CollectionListingsContractModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionListingsContractModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionListingsContractModelImplCopyWith<$Res>
    implements $CollectionListingsContractModelCopyWith<$Res> {
  factory _$$CollectionListingsContractModelImplCopyWith(
          _$CollectionListingsContractModelImpl value,
          $Res Function(_$CollectionListingsContractModelImpl) then) =
      __$$CollectionListingsContractModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'key') String? key});
}

/// @nodoc
class __$$CollectionListingsContractModelImplCopyWithImpl<$Res>
    extends _$CollectionListingsContractModelCopyWithImpl<$Res,
        _$CollectionListingsContractModelImpl>
    implements _$$CollectionListingsContractModelImplCopyWith<$Res> {
  __$$CollectionListingsContractModelImplCopyWithImpl(
      _$CollectionListingsContractModelImpl _value,
      $Res Function(_$CollectionListingsContractModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionListingsContractModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
  }) {
    return _then(_$CollectionListingsContractModelImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionListingsContractModelImpl
    implements _CollectionListingsContractModel {
  _$CollectionListingsContractModelImpl(
      {@JsonKey(name: 'key') required this.key});

  factory _$CollectionListingsContractModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CollectionListingsContractModelImplFromJson(json);

  @override
  @JsonKey(name: 'key')
  final String? key;

  @override
  String toString() {
    return 'CollectionListingsContractModel(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionListingsContractModelImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key);

  /// Create a copy of CollectionListingsContractModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionListingsContractModelImplCopyWith<
          _$CollectionListingsContractModelImpl>
      get copyWith => __$$CollectionListingsContractModelImplCopyWithImpl<
          _$CollectionListingsContractModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionListingsContractModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionListingsContractModel
    implements CollectionListingsContractModel {
  factory _CollectionListingsContractModel(
          {@JsonKey(name: 'key') required final String? key}) =
      _$CollectionListingsContractModelImpl;

  factory _CollectionListingsContractModel.fromJson(Map<String, dynamic> json) =
      _$CollectionListingsContractModelImpl.fromJson;

  @override
  @JsonKey(name: 'key')
  String? get key;

  /// Create a copy of CollectionListingsContractModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionListingsContractModelImplCopyWith<
          _$CollectionListingsContractModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionStatsModel _$CollectionStatsModelFromJson(Map<String, dynamic> json) {
  return _CollectionStatsModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionStatsModel {
  @JsonKey(name: 'total_mint_volume')
  String? get totalMintVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_mint_usd_volume')
  String? get totalMintUsdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  int? get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_usd_volume')
  String? get totalUsdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_volume')
  String? get totalVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_volume')
  String? get dayVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_sales')
  int? get daySales => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_usd_volume')
  String? get dayUsdVolume => throw _privateConstructorUsedError;

  /// Serializes this CollectionStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionStatsModelCopyWith<CollectionStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionStatsModelCopyWith<$Res> {
  factory $CollectionStatsModelCopyWith(CollectionStatsModel value,
          $Res Function(CollectionStatsModel) then) =
      _$CollectionStatsModelCopyWithImpl<$Res, CollectionStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_mint_volume') String? totalMintVolume,
      @JsonKey(name: 'total_mint_usd_volume') String? totalMintUsdVolume,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'total_usd_volume') String? totalUsdVolume,
      @JsonKey(name: 'total_volume') String? totalVolume,
      @JsonKey(name: 'day_volume') String? dayVolume,
      @JsonKey(name: 'day_sales') int? daySales,
      @JsonKey(name: 'day_usd_volume') String? dayUsdVolume});
}

/// @nodoc
class _$CollectionStatsModelCopyWithImpl<$Res,
        $Val extends CollectionStatsModel>
    implements $CollectionStatsModelCopyWith<$Res> {
  _$CollectionStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMintVolume = freezed,
    Object? totalMintUsdVolume = freezed,
    Object? totalSales = freezed,
    Object? totalUsdVolume = freezed,
    Object? totalVolume = freezed,
    Object? dayVolume = freezed,
    Object? daySales = freezed,
    Object? dayUsdVolume = freezed,
  }) {
    return _then(_value.copyWith(
      totalMintVolume: freezed == totalMintVolume
          ? _value.totalMintVolume
          : totalMintVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMintUsdVolume: freezed == totalMintUsdVolume
          ? _value.totalMintUsdVolume
          : totalMintUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      totalUsdVolume: freezed == totalUsdVolume
          ? _value.totalUsdVolume
          : totalUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      dayVolume: freezed == dayVolume
          ? _value.dayVolume
          : dayVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      daySales: freezed == daySales
          ? _value.daySales
          : daySales // ignore: cast_nullable_to_non_nullable
              as int?,
      dayUsdVolume: freezed == dayUsdVolume
          ? _value.dayUsdVolume
          : dayUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionStatsModelImplCopyWith<$Res>
    implements $CollectionStatsModelCopyWith<$Res> {
  factory _$$CollectionStatsModelImplCopyWith(_$CollectionStatsModelImpl value,
          $Res Function(_$CollectionStatsModelImpl) then) =
      __$$CollectionStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_mint_volume') String? totalMintVolume,
      @JsonKey(name: 'total_mint_usd_volume') String? totalMintUsdVolume,
      @JsonKey(name: 'total_sales') int? totalSales,
      @JsonKey(name: 'total_usd_volume') String? totalUsdVolume,
      @JsonKey(name: 'total_volume') String? totalVolume,
      @JsonKey(name: 'day_volume') String? dayVolume,
      @JsonKey(name: 'day_sales') int? daySales,
      @JsonKey(name: 'day_usd_volume') String? dayUsdVolume});
}

/// @nodoc
class __$$CollectionStatsModelImplCopyWithImpl<$Res>
    extends _$CollectionStatsModelCopyWithImpl<$Res, _$CollectionStatsModelImpl>
    implements _$$CollectionStatsModelImplCopyWith<$Res> {
  __$$CollectionStatsModelImplCopyWithImpl(_$CollectionStatsModelImpl _value,
      $Res Function(_$CollectionStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMintVolume = freezed,
    Object? totalMintUsdVolume = freezed,
    Object? totalSales = freezed,
    Object? totalUsdVolume = freezed,
    Object? totalVolume = freezed,
    Object? dayVolume = freezed,
    Object? daySales = freezed,
    Object? dayUsdVolume = freezed,
  }) {
    return _then(_$CollectionStatsModelImpl(
      totalMintVolume: freezed == totalMintVolume
          ? _value.totalMintVolume
          : totalMintVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMintUsdVolume: freezed == totalMintUsdVolume
          ? _value.totalMintUsdVolume
          : totalMintUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      totalUsdVolume: freezed == totalUsdVolume
          ? _value.totalUsdVolume
          : totalUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVolume: freezed == totalVolume
          ? _value.totalVolume
          : totalVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      dayVolume: freezed == dayVolume
          ? _value.dayVolume
          : dayVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      daySales: freezed == daySales
          ? _value.daySales
          : daySales // ignore: cast_nullable_to_non_nullable
              as int?,
      dayUsdVolume: freezed == dayUsdVolume
          ? _value.dayUsdVolume
          : dayUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionStatsModelImpl implements _CollectionStatsModel {
  _$CollectionStatsModelImpl(
      {@JsonKey(name: 'total_mint_volume') required this.totalMintVolume,
      @JsonKey(name: 'total_mint_usd_volume') required this.totalMintUsdVolume,
      @JsonKey(name: 'total_sales') required this.totalSales,
      @JsonKey(name: 'total_usd_volume') required this.totalUsdVolume,
      @JsonKey(name: 'total_volume') required this.totalVolume,
      @JsonKey(name: 'day_volume') required this.dayVolume,
      @JsonKey(name: 'day_sales') required this.daySales,
      @JsonKey(name: 'day_usd_volume') required this.dayUsdVolume});

  factory _$CollectionStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_mint_volume')
  final String? totalMintVolume;
  @override
  @JsonKey(name: 'total_mint_usd_volume')
  final String? totalMintUsdVolume;
  @override
  @JsonKey(name: 'total_sales')
  final int? totalSales;
  @override
  @JsonKey(name: 'total_usd_volume')
  final String? totalUsdVolume;
  @override
  @JsonKey(name: 'total_volume')
  final String? totalVolume;
  @override
  @JsonKey(name: 'day_volume')
  final String? dayVolume;
  @override
  @JsonKey(name: 'day_sales')
  final int? daySales;
  @override
  @JsonKey(name: 'day_usd_volume')
  final String? dayUsdVolume;

  @override
  String toString() {
    return 'CollectionStatsModel(totalMintVolume: $totalMintVolume, totalMintUsdVolume: $totalMintUsdVolume, totalSales: $totalSales, totalUsdVolume: $totalUsdVolume, totalVolume: $totalVolume, dayVolume: $dayVolume, daySales: $daySales, dayUsdVolume: $dayUsdVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionStatsModelImpl &&
            (identical(other.totalMintVolume, totalMintVolume) ||
                other.totalMintVolume == totalMintVolume) &&
            (identical(other.totalMintUsdVolume, totalMintUsdVolume) ||
                other.totalMintUsdVolume == totalMintUsdVolume) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.totalUsdVolume, totalUsdVolume) ||
                other.totalUsdVolume == totalUsdVolume) &&
            (identical(other.totalVolume, totalVolume) ||
                other.totalVolume == totalVolume) &&
            (identical(other.dayVolume, dayVolume) ||
                other.dayVolume == dayVolume) &&
            (identical(other.daySales, daySales) ||
                other.daySales == daySales) &&
            (identical(other.dayUsdVolume, dayUsdVolume) ||
                other.dayUsdVolume == dayUsdVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalMintVolume,
      totalMintUsdVolume,
      totalSales,
      totalUsdVolume,
      totalVolume,
      dayVolume,
      daySales,
      dayUsdVolume);

  /// Create a copy of CollectionStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionStatsModelImplCopyWith<_$CollectionStatsModelImpl>
      get copyWith =>
          __$$CollectionStatsModelImplCopyWithImpl<_$CollectionStatsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionStatsModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionStatsModel implements CollectionStatsModel {
  factory _CollectionStatsModel(
      {@JsonKey(name: 'total_mint_volume')
      required final String? totalMintVolume,
      @JsonKey(name: 'total_mint_usd_volume')
      required final String? totalMintUsdVolume,
      @JsonKey(name: 'total_sales') required final int? totalSales,
      @JsonKey(name: 'total_usd_volume') required final String? totalUsdVolume,
      @JsonKey(name: 'total_volume') required final String? totalVolume,
      @JsonKey(name: 'day_volume') required final String? dayVolume,
      @JsonKey(name: 'day_sales') required final int? daySales,
      @JsonKey(name: 'day_usd_volume')
      required final String? dayUsdVolume}) = _$CollectionStatsModelImpl;

  factory _CollectionStatsModel.fromJson(Map<String, dynamic> json) =
      _$CollectionStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_mint_volume')
  String? get totalMintVolume;
  @override
  @JsonKey(name: 'total_mint_usd_volume')
  String? get totalMintUsdVolume;
  @override
  @JsonKey(name: 'total_sales')
  int? get totalSales;
  @override
  @JsonKey(name: 'total_usd_volume')
  String? get totalUsdVolume;
  @override
  @JsonKey(name: 'total_volume')
  String? get totalVolume;
  @override
  @JsonKey(name: 'day_volume')
  String? get dayVolume;
  @override
  @JsonKey(name: 'day_sales')
  int? get daySales;
  @override
  @JsonKey(name: 'day_usd_volume')
  String? get dayUsdVolume;

  /// Create a copy of CollectionStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionStatsModelImplCopyWith<_$CollectionStatsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionActivityModel _$CollectionActivityModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionActivityModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionActivityModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd_price')
  double? get usdPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender')
  String? get sender => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver')
  String? get receiver => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_time')
  String? get blockTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'nft')
  CollectionActivityNFTModel? get nft => throw _privateConstructorUsedError;

  /// Serializes this CollectionActivityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionActivityModelCopyWith<CollectionActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionActivityModelCopyWith<$Res> {
  factory $CollectionActivityModelCopyWith(CollectionActivityModel value,
          $Res Function(CollectionActivityModel) then) =
      _$CollectionActivityModelCopyWithImpl<$Res, CollectionActivityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'usd_price') double? usdPrice,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'receiver') String? receiver,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'nft') CollectionActivityNFTModel? nft});

  $CollectionActivityNFTModelCopyWith<$Res>? get nft;
}

/// @nodoc
class _$CollectionActivityModelCopyWithImpl<$Res,
        $Val extends CollectionActivityModel>
    implements $CollectionActivityModelCopyWith<$Res> {
  _$CollectionActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? usdPrice = freezed,
    Object? sender = freezed,
    Object? receiver = freezed,
    Object? blockTime = freezed,
    Object? nft = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      usdPrice: freezed == usdPrice
          ? _value.usdPrice
          : usdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as CollectionActivityNFTModel?,
    ) as $Val);
  }

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionActivityNFTModelCopyWith<$Res>? get nft {
    if (_value.nft == null) {
      return null;
    }

    return $CollectionActivityNFTModelCopyWith<$Res>(_value.nft!, (value) {
      return _then(_value.copyWith(nft: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionActivityModelImplCopyWith<$Res>
    implements $CollectionActivityModelCopyWith<$Res> {
  factory _$$CollectionActivityModelImplCopyWith(
          _$CollectionActivityModelImpl value,
          $Res Function(_$CollectionActivityModelImpl) then) =
      __$$CollectionActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'price') int? price,
      @JsonKey(name: 'usd_price') double? usdPrice,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'receiver') String? receiver,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'nft') CollectionActivityNFTModel? nft});

  @override
  $CollectionActivityNFTModelCopyWith<$Res>? get nft;
}

/// @nodoc
class __$$CollectionActivityModelImplCopyWithImpl<$Res>
    extends _$CollectionActivityModelCopyWithImpl<$Res,
        _$CollectionActivityModelImpl>
    implements _$$CollectionActivityModelImplCopyWith<$Res> {
  __$$CollectionActivityModelImplCopyWithImpl(
      _$CollectionActivityModelImpl _value,
      $Res Function(_$CollectionActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? usdPrice = freezed,
    Object? sender = freezed,
    Object? receiver = freezed,
    Object? blockTime = freezed,
    Object? nft = freezed,
  }) {
    return _then(_$CollectionActivityModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      usdPrice: freezed == usdPrice
          ? _value.usdPrice
          : usdPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nft: freezed == nft
          ? _value.nft
          : nft // ignore: cast_nullable_to_non_nullable
              as CollectionActivityNFTModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionActivityModelImpl implements _CollectionActivityModel {
  _$CollectionActivityModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'usd_price') required this.usdPrice,
      @JsonKey(name: 'sender') required this.sender,
      @JsonKey(name: 'receiver') required this.receiver,
      @JsonKey(name: 'block_time') required this.blockTime,
      @JsonKey(name: 'nft') required this.nft});

  factory _$CollectionActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionActivityModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'price')
  final int? price;
  @override
  @JsonKey(name: 'usd_price')
  final double? usdPrice;
  @override
  @JsonKey(name: 'sender')
  final String? sender;
  @override
  @JsonKey(name: 'receiver')
  final String? receiver;
  @override
  @JsonKey(name: 'block_time')
  final String? blockTime;
  @override
  @JsonKey(name: 'nft')
  final CollectionActivityNFTModel? nft;

  @override
  String toString() {
    return 'CollectionActivityModel(id: $id, type: $type, price: $price, usdPrice: $usdPrice, sender: $sender, receiver: $receiver, blockTime: $blockTime, nft: $nft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionActivityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.usdPrice, usdPrice) ||
                other.usdPrice == usdPrice) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime) &&
            (identical(other.nft, nft) || other.nft == nft));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, price, usdPrice, sender, receiver, blockTime, nft);

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionActivityModelImplCopyWith<_$CollectionActivityModelImpl>
      get copyWith => __$$CollectionActivityModelImplCopyWithImpl<
          _$CollectionActivityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionActivityModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionActivityModel implements CollectionActivityModel {
  factory _CollectionActivityModel(
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'type') required final String? type,
          @JsonKey(name: 'price') required final int? price,
          @JsonKey(name: 'usd_price') required final double? usdPrice,
          @JsonKey(name: 'sender') required final String? sender,
          @JsonKey(name: 'receiver') required final String? receiver,
          @JsonKey(name: 'block_time') required final String? blockTime,
          @JsonKey(name: 'nft')
          required final CollectionActivityNFTModel? nft}) =
      _$CollectionActivityModelImpl;

  factory _CollectionActivityModel.fromJson(Map<String, dynamic> json) =
      _$CollectionActivityModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'price')
  int? get price;
  @override
  @JsonKey(name: 'usd_price')
  double? get usdPrice;
  @override
  @JsonKey(name: 'sender')
  String? get sender;
  @override
  @JsonKey(name: 'receiver')
  String? get receiver;
  @override
  @JsonKey(name: 'block_time')
  String? get blockTime;
  @override
  @JsonKey(name: 'nft')
  CollectionActivityNFTModel? get nft;

  /// Create a copy of CollectionActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionActivityModelImplCopyWith<_$CollectionActivityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionActivityNFTModel _$CollectionActivityNFTModelFromJson(
    Map<String, dynamic> json) {
  return _CollectionActivityNFTModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionActivityNFTModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'ranking')
  int? get ranking => throw _privateConstructorUsedError;

  /// Serializes this CollectionActivityNFTModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionActivityNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionActivityNFTModelCopyWith<CollectionActivityNFTModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionActivityNFTModelCopyWith<$Res> {
  factory $CollectionActivityNFTModelCopyWith(CollectionActivityNFTModel value,
          $Res Function(CollectionActivityNFTModel) then) =
      _$CollectionActivityNFTModelCopyWithImpl<$Res,
          CollectionActivityNFTModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'ranking') int? ranking});
}

/// @nodoc
class _$CollectionActivityNFTModelCopyWithImpl<$Res,
        $Val extends CollectionActivityNFTModel>
    implements $CollectionActivityNFTModelCopyWith<$Res> {
  _$CollectionActivityNFTModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionActivityNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mediaUrl = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionActivityNFTModelImplCopyWith<$Res>
    implements $CollectionActivityNFTModelCopyWith<$Res> {
  factory _$$CollectionActivityNFTModelImplCopyWith(
          _$CollectionActivityNFTModelImpl value,
          $Res Function(_$CollectionActivityNFTModelImpl) then) =
      __$$CollectionActivityNFTModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'ranking') int? ranking});
}

/// @nodoc
class __$$CollectionActivityNFTModelImplCopyWithImpl<$Res>
    extends _$CollectionActivityNFTModelCopyWithImpl<$Res,
        _$CollectionActivityNFTModelImpl>
    implements _$$CollectionActivityNFTModelImplCopyWith<$Res> {
  __$$CollectionActivityNFTModelImplCopyWithImpl(
      _$CollectionActivityNFTModelImpl _value,
      $Res Function(_$CollectionActivityNFTModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionActivityNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? mediaUrl = freezed,
    Object? ranking = freezed,
  }) {
    return _then(_$CollectionActivityNFTModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ranking: freezed == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionActivityNFTModelImpl implements _CollectionActivityNFTModel {
  _$CollectionActivityNFTModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'ranking') required this.ranking});

  factory _$CollectionActivityNFTModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CollectionActivityNFTModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'ranking')
  final int? ranking;

  @override
  String toString() {
    return 'CollectionActivityNFTModel(id: $id, name: $name, mediaUrl: $mediaUrl, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionActivityNFTModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, mediaUrl, ranking);

  /// Create a copy of CollectionActivityNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionActivityNFTModelImplCopyWith<_$CollectionActivityNFTModelImpl>
      get copyWith => __$$CollectionActivityNFTModelImplCopyWithImpl<
          _$CollectionActivityNFTModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionActivityNFTModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionActivityNFTModel
    implements CollectionActivityNFTModel {
  factory _CollectionActivityNFTModel(
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'name') required final String? name,
          @JsonKey(name: 'media_url') required final String? mediaUrl,
          @JsonKey(name: 'ranking') required final int? ranking}) =
      _$CollectionActivityNFTModelImpl;

  factory _CollectionActivityNFTModel.fromJson(Map<String, dynamic> json) =
      _$CollectionActivityNFTModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'ranking')
  int? get ranking;

  /// Create a copy of CollectionActivityNFTModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionActivityNFTModelImplCopyWith<_$CollectionActivityNFTModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
