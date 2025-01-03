// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../marketplace_filter_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarketplaceFilterStateModel {
  List<String> get selectedSortBy => throw _privateConstructorUsedError;
  List<String> get selectedPeriod => throw _privateConstructorUsedError;
  bool get isAscending => throw _privateConstructorUsedError;

  /// Create a copy of MarketplaceFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketplaceFilterStateModelCopyWith<MarketplaceFilterStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceFilterStateModelCopyWith<$Res> {
  factory $MarketplaceFilterStateModelCopyWith(
          MarketplaceFilterStateModel value,
          $Res Function(MarketplaceFilterStateModel) then) =
      _$MarketplaceFilterStateModelCopyWithImpl<$Res,
          MarketplaceFilterStateModel>;
  @useResult
  $Res call(
      {List<String> selectedSortBy,
      List<String> selectedPeriod,
      bool isAscending});
}

/// @nodoc
class _$MarketplaceFilterStateModelCopyWithImpl<$Res,
        $Val extends MarketplaceFilterStateModel>
    implements $MarketplaceFilterStateModelCopyWith<$Res> {
  _$MarketplaceFilterStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketplaceFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSortBy = null,
    Object? selectedPeriod = null,
    Object? isAscending = null,
  }) {
    return _then(_value.copyWith(
      selectedSortBy: null == selectedSortBy
          ? _value.selectedSortBy
          : selectedSortBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPeriod: null == selectedPeriod
          ? _value.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketplaceFilterStateModelImplCopyWith<$Res>
    implements $MarketplaceFilterStateModelCopyWith<$Res> {
  factory _$$MarketplaceFilterStateModelImplCopyWith(
          _$MarketplaceFilterStateModelImpl value,
          $Res Function(_$MarketplaceFilterStateModelImpl) then) =
      __$$MarketplaceFilterStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> selectedSortBy,
      List<String> selectedPeriod,
      bool isAscending});
}

/// @nodoc
class __$$MarketplaceFilterStateModelImplCopyWithImpl<$Res>
    extends _$MarketplaceFilterStateModelCopyWithImpl<$Res,
        _$MarketplaceFilterStateModelImpl>
    implements _$$MarketplaceFilterStateModelImplCopyWith<$Res> {
  __$$MarketplaceFilterStateModelImplCopyWithImpl(
      _$MarketplaceFilterStateModelImpl _value,
      $Res Function(_$MarketplaceFilterStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketplaceFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSortBy = null,
    Object? selectedPeriod = null,
    Object? isAscending = null,
  }) {
    return _then(_$MarketplaceFilterStateModelImpl(
      selectedSortBy: null == selectedSortBy
          ? _value._selectedSortBy
          : selectedSortBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedPeriod: null == selectedPeriod
          ? _value._selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAscending: null == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MarketplaceFilterStateModelImpl
    implements _MarketplaceFilterStateModel {
  const _$MarketplaceFilterStateModelImpl(
      {final List<String> selectedSortBy = const ['Volume'],
      final List<String> selectedPeriod = const ['24 Hrs'],
      this.isAscending = false})
      : _selectedSortBy = selectedSortBy,
        _selectedPeriod = selectedPeriod;

  final List<String> _selectedSortBy;
  @override
  @JsonKey()
  List<String> get selectedSortBy {
    if (_selectedSortBy is EqualUnmodifiableListView) return _selectedSortBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSortBy);
  }

  final List<String> _selectedPeriod;
  @override
  @JsonKey()
  List<String> get selectedPeriod {
    if (_selectedPeriod is EqualUnmodifiableListView) return _selectedPeriod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPeriod);
  }

  @override
  @JsonKey()
  final bool isAscending;

  @override
  String toString() {
    return 'MarketplaceFilterStateModel(selectedSortBy: $selectedSortBy, selectedPeriod: $selectedPeriod, isAscending: $isAscending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketplaceFilterStateModelImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedSortBy, _selectedSortBy) &&
            const DeepCollectionEquality()
                .equals(other._selectedPeriod, _selectedPeriod) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedSortBy),
      const DeepCollectionEquality().hash(_selectedPeriod),
      isAscending);

  /// Create a copy of MarketplaceFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketplaceFilterStateModelImplCopyWith<_$MarketplaceFilterStateModelImpl>
      get copyWith => __$$MarketplaceFilterStateModelImplCopyWithImpl<
          _$MarketplaceFilterStateModelImpl>(this, _$identity);
}

abstract class _MarketplaceFilterStateModel
    implements MarketplaceFilterStateModel {
  const factory _MarketplaceFilterStateModel(
      {final List<String> selectedSortBy,
      final List<String> selectedPeriod,
      final bool isAscending}) = _$MarketplaceFilterStateModelImpl;

  @override
  List<String> get selectedSortBy;
  @override
  List<String> get selectedPeriod;
  @override
  bool get isAscending;

  /// Create a copy of MarketplaceFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketplaceFilterStateModelImplCopyWith<_$MarketplaceFilterStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
