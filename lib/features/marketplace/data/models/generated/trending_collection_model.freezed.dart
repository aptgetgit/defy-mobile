// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../trending_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrendingCollectionModel _$TrendingCollectionModelFromJson(
    Map<String, dynamic> json) {
  return _TrendingCollectionModel.fromJson(json);
}

/// @nodoc
mixin _$TrendingCollectionModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_trades_count')
  int? get currentTradesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_usd_volume')
  String? get currentUsdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_volume')
  String? get currentVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_trades_count')
  int? get previousTradesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_usd_volume')
  String? get previousUsdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_volume')
  String? get previousVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection')
  CollectionModel? get collection => throw _privateConstructorUsedError;

  /// Serializes this TrendingCollectionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendingCollectionModelCopyWith<TrendingCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingCollectionModelCopyWith<$Res> {
  factory $TrendingCollectionModelCopyWith(TrendingCollectionModel value,
          $Res Function(TrendingCollectionModel) then) =
      _$TrendingCollectionModelCopyWithImpl<$Res, TrendingCollectionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_trades_count') int? currentTradesCount,
      @JsonKey(name: 'current_usd_volume') String? currentUsdVolume,
      @JsonKey(name: 'current_volume') String? currentVolume,
      @JsonKey(name: 'previous_trades_count') int? previousTradesCount,
      @JsonKey(name: 'previous_usd_volume') String? previousUsdVolume,
      @JsonKey(name: 'previous_volume') String? previousVolume,
      @JsonKey(name: 'collection') CollectionModel? collection});

  $CollectionModelCopyWith<$Res>? get collection;
}

/// @nodoc
class _$TrendingCollectionModelCopyWithImpl<$Res,
        $Val extends TrendingCollectionModel>
    implements $TrendingCollectionModelCopyWith<$Res> {
  _$TrendingCollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? currentTradesCount = freezed,
    Object? currentUsdVolume = freezed,
    Object? currentVolume = freezed,
    Object? previousTradesCount = freezed,
    Object? previousUsdVolume = freezed,
    Object? previousVolume = freezed,
    Object? collection = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTradesCount: freezed == currentTradesCount
          ? _value.currentTradesCount
          : currentTradesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentUsdVolume: freezed == currentUsdVolume
          ? _value.currentUsdVolume
          : currentUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVolume: freezed == currentVolume
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTradesCount: freezed == previousTradesCount
          ? _value.previousTradesCount
          : previousTradesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previousUsdVolume: freezed == previousUsdVolume
          ? _value.previousUsdVolume
          : previousUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      previousVolume: freezed == previousVolume
          ? _value.previousVolume
          : previousVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionModel?,
    ) as $Val);
  }

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionModelCopyWith<$Res>? get collection {
    if (_value.collection == null) {
      return null;
    }

    return $CollectionModelCopyWith<$Res>(_value.collection!, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrendingCollectionModelImplCopyWith<$Res>
    implements $TrendingCollectionModelCopyWith<$Res> {
  factory _$$TrendingCollectionModelImplCopyWith(
          _$TrendingCollectionModelImpl value,
          $Res Function(_$TrendingCollectionModelImpl) then) =
      __$$TrendingCollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'current_trades_count') int? currentTradesCount,
      @JsonKey(name: 'current_usd_volume') String? currentUsdVolume,
      @JsonKey(name: 'current_volume') String? currentVolume,
      @JsonKey(name: 'previous_trades_count') int? previousTradesCount,
      @JsonKey(name: 'previous_usd_volume') String? previousUsdVolume,
      @JsonKey(name: 'previous_volume') String? previousVolume,
      @JsonKey(name: 'collection') CollectionModel? collection});

  @override
  $CollectionModelCopyWith<$Res>? get collection;
}

/// @nodoc
class __$$TrendingCollectionModelImplCopyWithImpl<$Res>
    extends _$TrendingCollectionModelCopyWithImpl<$Res,
        _$TrendingCollectionModelImpl>
    implements _$$TrendingCollectionModelImplCopyWith<$Res> {
  __$$TrendingCollectionModelImplCopyWithImpl(
      _$TrendingCollectionModelImpl _value,
      $Res Function(_$TrendingCollectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? currentTradesCount = freezed,
    Object? currentUsdVolume = freezed,
    Object? currentVolume = freezed,
    Object? previousTradesCount = freezed,
    Object? previousUsdVolume = freezed,
    Object? previousVolume = freezed,
    Object? collection = freezed,
  }) {
    return _then(_$TrendingCollectionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentTradesCount: freezed == currentTradesCount
          ? _value.currentTradesCount
          : currentTradesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentUsdVolume: freezed == currentUsdVolume
          ? _value.currentUsdVolume
          : currentUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      currentVolume: freezed == currentVolume
          ? _value.currentVolume
          : currentVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTradesCount: freezed == previousTradesCount
          ? _value.previousTradesCount
          : previousTradesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      previousUsdVolume: freezed == previousUsdVolume
          ? _value.previousUsdVolume
          : previousUsdVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      previousVolume: freezed == previousVolume
          ? _value.previousVolume
          : previousVolume // ignore: cast_nullable_to_non_nullable
              as String?,
      collection: freezed == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as CollectionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendingCollectionModelImpl implements _TrendingCollectionModel {
  _$TrendingCollectionModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'current_trades_count') required this.currentTradesCount,
      @JsonKey(name: 'current_usd_volume') required this.currentUsdVolume,
      @JsonKey(name: 'current_volume') required this.currentVolume,
      @JsonKey(name: 'previous_trades_count') required this.previousTradesCount,
      @JsonKey(name: 'previous_usd_volume') required this.previousUsdVolume,
      @JsonKey(name: 'previous_volume') required this.previousVolume,
      @JsonKey(name: 'collection') required this.collection});

  factory _$TrendingCollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingCollectionModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'current_trades_count')
  final int? currentTradesCount;
  @override
  @JsonKey(name: 'current_usd_volume')
  final String? currentUsdVolume;
  @override
  @JsonKey(name: 'current_volume')
  final String? currentVolume;
  @override
  @JsonKey(name: 'previous_trades_count')
  final int? previousTradesCount;
  @override
  @JsonKey(name: 'previous_usd_volume')
  final String? previousUsdVolume;
  @override
  @JsonKey(name: 'previous_volume')
  final String? previousVolume;
  @override
  @JsonKey(name: 'collection')
  final CollectionModel? collection;

  @override
  String toString() {
    return 'TrendingCollectionModel(id: $id, currentTradesCount: $currentTradesCount, currentUsdVolume: $currentUsdVolume, currentVolume: $currentVolume, previousTradesCount: $previousTradesCount, previousUsdVolume: $previousUsdVolume, previousVolume: $previousVolume, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingCollectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentTradesCount, currentTradesCount) ||
                other.currentTradesCount == currentTradesCount) &&
            (identical(other.currentUsdVolume, currentUsdVolume) ||
                other.currentUsdVolume == currentUsdVolume) &&
            (identical(other.currentVolume, currentVolume) ||
                other.currentVolume == currentVolume) &&
            (identical(other.previousTradesCount, previousTradesCount) ||
                other.previousTradesCount == previousTradesCount) &&
            (identical(other.previousUsdVolume, previousUsdVolume) ||
                other.previousUsdVolume == previousUsdVolume) &&
            (identical(other.previousVolume, previousVolume) ||
                other.previousVolume == previousVolume) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currentTradesCount,
      currentUsdVolume,
      currentVolume,
      previousTradesCount,
      previousUsdVolume,
      previousVolume,
      collection);

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingCollectionModelImplCopyWith<_$TrendingCollectionModelImpl>
      get copyWith => __$$TrendingCollectionModelImplCopyWithImpl<
          _$TrendingCollectionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendingCollectionModelImplToJson(
      this,
    );
  }
}

abstract class _TrendingCollectionModel implements TrendingCollectionModel {
  factory _TrendingCollectionModel(
      {@JsonKey(name: 'id') required final String? id,
      @JsonKey(name: 'current_trades_count')
      required final int? currentTradesCount,
      @JsonKey(name: 'current_usd_volume')
      required final String? currentUsdVolume,
      @JsonKey(name: 'current_volume') required final String? currentVolume,
      @JsonKey(name: 'previous_trades_count')
      required final int? previousTradesCount,
      @JsonKey(name: 'previous_usd_volume')
      required final String? previousUsdVolume,
      @JsonKey(name: 'previous_volume') required final String? previousVolume,
      @JsonKey(name: 'collection')
      required final CollectionModel?
          collection}) = _$TrendingCollectionModelImpl;

  factory _TrendingCollectionModel.fromJson(Map<String, dynamic> json) =
      _$TrendingCollectionModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'current_trades_count')
  int? get currentTradesCount;
  @override
  @JsonKey(name: 'current_usd_volume')
  String? get currentUsdVolume;
  @override
  @JsonKey(name: 'current_volume')
  String? get currentVolume;
  @override
  @JsonKey(name: 'previous_trades_count')
  int? get previousTradesCount;
  @override
  @JsonKey(name: 'previous_usd_volume')
  String? get previousUsdVolume;
  @override
  @JsonKey(name: 'previous_volume')
  String? get previousVolume;
  @override
  @JsonKey(name: 'collection')
  CollectionModel? get collection;

  /// Create a copy of TrendingCollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingCollectionModelImplCopyWith<_$TrendingCollectionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) {
  return _CollectionModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'slug')
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'supply')
  int? get supply => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String? get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor')
  int? get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd_volume')
  double? get usdVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'volume')
  int? get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  bool? get verified => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'supply') int? supply,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'floor') int? floor,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'volume') int? volume,
      @JsonKey(name: 'verified') bool? verified});
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
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? supply = freezed,
    Object? coverUrl = freezed,
    Object? floor = freezed,
    Object? usdVolume = freezed,
    Object? volume = freezed,
    Object? verified = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'slug') String? slug,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'supply') int? supply,
      @JsonKey(name: 'cover_url') String? coverUrl,
      @JsonKey(name: 'floor') int? floor,
      @JsonKey(name: 'usd_volume') double? usdVolume,
      @JsonKey(name: 'volume') int? volume,
      @JsonKey(name: 'verified') bool? verified});
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
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? supply = freezed,
    Object? coverUrl = freezed,
    Object? floor = freezed,
    Object? usdVolume = freezed,
    Object? volume = freezed,
    Object? verified = freezed,
  }) {
    return _then(_$CollectionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      supply: freezed == supply
          ? _value.supply
          : supply // ignore: cast_nullable_to_non_nullable
              as int?,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      usdVolume: freezed == usdVolume
          ? _value.usdVolume
          : usdVolume // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionModelImpl implements _CollectionModel {
  _$CollectionModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'slug') required this.slug,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'supply') required this.supply,
      @JsonKey(name: 'cover_url') required this.coverUrl,
      @JsonKey(name: 'floor') required this.floor,
      @JsonKey(name: 'usd_volume') required this.usdVolume,
      @JsonKey(name: 'volume') required this.volume,
      @JsonKey(name: 'verified') required this.verified});

  factory _$CollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'slug')
  final String? slug;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'supply')
  final int? supply;
  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  @override
  @JsonKey(name: 'floor')
  final int? floor;
  @override
  @JsonKey(name: 'usd_volume')
  final double? usdVolume;
  @override
  @JsonKey(name: 'volume')
  final int? volume;
  @override
  @JsonKey(name: 'verified')
  final bool? verified;

  @override
  String toString() {
    return 'CollectionModel(id: $id, slug: $slug, title: $title, supply: $supply, coverUrl: $coverUrl, floor: $floor, usdVolume: $usdVolume, volume: $volume, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.supply, supply) || other.supply == supply) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.usdVolume, usdVolume) ||
                other.usdVolume == usdVolume) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, title, supply,
      coverUrl, floor, usdVolume, volume, verified);

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
          {@JsonKey(name: 'id') required final String? id,
          @JsonKey(name: 'slug') required final String? slug,
          @JsonKey(name: 'title') required final String? title,
          @JsonKey(name: 'supply') required final int? supply,
          @JsonKey(name: 'cover_url') required final String? coverUrl,
          @JsonKey(name: 'floor') required final int? floor,
          @JsonKey(name: 'usd_volume') required final double? usdVolume,
          @JsonKey(name: 'volume') required final int? volume,
          @JsonKey(name: 'verified') required final bool? verified}) =
      _$CollectionModelImpl;

  factory _CollectionModel.fromJson(Map<String, dynamic> json) =
      _$CollectionModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'slug')
  String? get slug;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'supply')
  int? get supply;
  @override
  @JsonKey(name: 'cover_url')
  String? get coverUrl;
  @override
  @JsonKey(name: 'floor')
  int? get floor;
  @override
  @JsonKey(name: 'usd_volume')
  double? get usdVolume;
  @override
  @JsonKey(name: 'volume')
  int? get volume;
  @override
  @JsonKey(name: 'verified')
  bool? get verified;

  /// Create a copy of CollectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionModelImplCopyWith<_$CollectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
