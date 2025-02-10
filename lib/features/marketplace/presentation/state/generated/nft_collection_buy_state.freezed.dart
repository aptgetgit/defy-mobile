// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../nft_collection_buy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NFTCollectionBuyStateModel _$NFTCollectionBuyStateModelFromJson(
    Map<String, dynamic> json) {
  return _NFTCollectionBuyStateModel.fromJson(json);
}

/// @nodoc
mixin _$NFTCollectionBuyStateModel {
  Set<String> get selectedNFTs => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;
  bool get isAscending => throw _privateConstructorUsedError;
  Map<String, dynamic> get filter => throw _privateConstructorUsedError;
  double get sweepValue => throw _privateConstructorUsedError;

  /// Create a copy of NFTCollectionBuyStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NFTCollectionBuyStateModelCopyWith<NFTCollectionBuyStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NFTCollectionBuyStateModelCopyWith<$Res> {
  factory $NFTCollectionBuyStateModelCopyWith(NFTCollectionBuyStateModel value,
          $Res Function(NFTCollectionBuyStateModel) then) =
      _$NFTCollectionBuyStateModelCopyWithImpl<$Res,
          NFTCollectionBuyStateModel>;
  @useResult
  $Res call(
      {Set<String> selectedNFTs,
      String sortBy,
      bool isAscending,
      Map<String, dynamic> filter,
      double sweepValue});
}

/// @nodoc
class _$NFTCollectionBuyStateModelCopyWithImpl<$Res,
        $Val extends NFTCollectionBuyStateModel>
    implements $NFTCollectionBuyStateModelCopyWith<$Res> {
  _$NFTCollectionBuyStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NFTCollectionBuyStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNFTs = null,
    Object? sortBy = null,
    Object? isAscending = null,
    Object? filter = null,
    Object? sweepValue = null,
  }) {
    return _then(_value.copyWith(
      selectedNFTs: null == selectedNFTs
          ? _value.selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sweepValue: null == sweepValue
          ? _value.sweepValue
          : sweepValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NFTCollectionBuyStateModelImplCopyWith<$Res>
    implements $NFTCollectionBuyStateModelCopyWith<$Res> {
  factory _$$NFTCollectionBuyStateModelImplCopyWith(
          _$NFTCollectionBuyStateModelImpl value,
          $Res Function(_$NFTCollectionBuyStateModelImpl) then) =
      __$$NFTCollectionBuyStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<String> selectedNFTs,
      String sortBy,
      bool isAscending,
      Map<String, dynamic> filter,
      double sweepValue});
}

/// @nodoc
class __$$NFTCollectionBuyStateModelImplCopyWithImpl<$Res>
    extends _$NFTCollectionBuyStateModelCopyWithImpl<$Res,
        _$NFTCollectionBuyStateModelImpl>
    implements _$$NFTCollectionBuyStateModelImplCopyWith<$Res> {
  __$$NFTCollectionBuyStateModelImplCopyWithImpl(
      _$NFTCollectionBuyStateModelImpl _value,
      $Res Function(_$NFTCollectionBuyStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NFTCollectionBuyStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNFTs = null,
    Object? sortBy = null,
    Object? isAscending = null,
    Object? filter = null,
    Object? sweepValue = null,
  }) {
    return _then(_$NFTCollectionBuyStateModelImpl(
      selectedNFTs: null == selectedNFTs
          ? _value._selectedNFTs
          : selectedNFTs // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
      filter: null == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sweepValue: null == sweepValue
          ? _value.sweepValue
          : sweepValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NFTCollectionBuyStateModelImpl implements _NFTCollectionBuyStateModel {
  const _$NFTCollectionBuyStateModelImpl(
      {final Set<String> selectedNFTs = const {},
      this.sortBy = "Collection Volume",
      this.isAscending = true,
      final Map<String, dynamic> filter = const {},
      this.sweepValue = 0.0})
      : _selectedNFTs = selectedNFTs,
        _filter = filter;

  factory _$NFTCollectionBuyStateModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NFTCollectionBuyStateModelImplFromJson(json);

  final Set<String> _selectedNFTs;
  @override
  @JsonKey()
  Set<String> get selectedNFTs {
    if (_selectedNFTs is EqualUnmodifiableSetView) return _selectedNFTs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedNFTs);
  }

  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final bool isAscending;
  final Map<String, dynamic> _filter;
  @override
  @JsonKey()
  Map<String, dynamic> get filter {
    if (_filter is EqualUnmodifiableMapView) return _filter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filter);
  }

  @override
  @JsonKey()
  final double sweepValue;

  @override
  String toString() {
    return 'NFTCollectionBuyStateModel(selectedNFTs: $selectedNFTs, sortBy: $sortBy, isAscending: $isAscending, filter: $filter, sweepValue: $sweepValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NFTCollectionBuyStateModelImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedNFTs, _selectedNFTs) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending) &&
            const DeepCollectionEquality().equals(other._filter, _filter) &&
            (identical(other.sweepValue, sweepValue) ||
                other.sweepValue == sweepValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedNFTs),
      sortBy,
      isAscending,
      const DeepCollectionEquality().hash(_filter),
      sweepValue);

  /// Create a copy of NFTCollectionBuyStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NFTCollectionBuyStateModelImplCopyWith<_$NFTCollectionBuyStateModelImpl>
      get copyWith => __$$NFTCollectionBuyStateModelImplCopyWithImpl<
          _$NFTCollectionBuyStateModelImpl>(this, _$identity);
}

abstract class _NFTCollectionBuyStateModel
    implements NFTCollectionBuyStateModel {
  const factory _NFTCollectionBuyStateModel(
      {final Set<String> selectedNFTs,
      final String sortBy,
      final bool isAscending,
      final Map<String, dynamic> filter,
      final double sweepValue}) = _$NFTCollectionBuyStateModelImpl;

  factory _NFTCollectionBuyStateModel.fromJson(Map<String, dynamic> json) =
      _$NFTCollectionBuyStateModelImpl.fromJson;

  @override
  Set<String> get selectedNFTs;
  @override
  String get sortBy;
  @override
  bool get isAscending;
  @override
  Map<String, dynamic> get filter;
  @override
  double get sweepValue;

  /// Create a copy of NFTCollectionBuyStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NFTCollectionBuyStateModelImplCopyWith<_$NFTCollectionBuyStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
