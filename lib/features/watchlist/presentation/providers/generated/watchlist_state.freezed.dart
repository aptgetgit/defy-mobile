// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../watchlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WatchlistState {
  List<WatchlistCollection> get collections =>
      throw _privateConstructorUsedError;
  int get selectedTabIndex => throw _privateConstructorUsedError;
  bool get isDeleteMode => throw _privateConstructorUsedError;
  String? get selectedCollectionId => throw _privateConstructorUsedError;
  String? get editingCollectionId => throw _privateConstructorUsedError;
  String? get newCollectionName => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistStateCopyWith<WatchlistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistStateCopyWith<$Res> {
  factory $WatchlistStateCopyWith(
          WatchlistState value, $Res Function(WatchlistState) then) =
      _$WatchlistStateCopyWithImpl<$Res, WatchlistState>;
  @useResult
  $Res call(
      {List<WatchlistCollection> collections,
      int selectedTabIndex,
      bool isDeleteMode,
      String? selectedCollectionId,
      String? editingCollectionId,
      String? newCollectionName});
}

/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res, $Val extends WatchlistState>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? selectedTabIndex = null,
    Object? isDeleteMode = null,
    Object? selectedCollectionId = freezed,
    Object? editingCollectionId = freezed,
    Object? newCollectionName = freezed,
  }) {
    return _then(_value.copyWith(
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<WatchlistCollection>,
      selectedTabIndex: null == selectedTabIndex
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCollectionId: freezed == selectedCollectionId
          ? _value.selectedCollectionId
          : selectedCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      editingCollectionId: freezed == editingCollectionId
          ? _value.editingCollectionId
          : editingCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      newCollectionName: freezed == newCollectionName
          ? _value.newCollectionName
          : newCollectionName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistStateImplCopyWith<$Res>
    implements $WatchlistStateCopyWith<$Res> {
  factory _$$WatchlistStateImplCopyWith(_$WatchlistStateImpl value,
          $Res Function(_$WatchlistStateImpl) then) =
      __$$WatchlistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WatchlistCollection> collections,
      int selectedTabIndex,
      bool isDeleteMode,
      String? selectedCollectionId,
      String? editingCollectionId,
      String? newCollectionName});
}

/// @nodoc
class __$$WatchlistStateImplCopyWithImpl<$Res>
    extends _$WatchlistStateCopyWithImpl<$Res, _$WatchlistStateImpl>
    implements _$$WatchlistStateImplCopyWith<$Res> {
  __$$WatchlistStateImplCopyWithImpl(
      _$WatchlistStateImpl _value, $Res Function(_$WatchlistStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? selectedTabIndex = null,
    Object? isDeleteMode = null,
    Object? selectedCollectionId = freezed,
    Object? editingCollectionId = freezed,
    Object? newCollectionName = freezed,
  }) {
    return _then(_$WatchlistStateImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<WatchlistCollection>,
      selectedTabIndex: null == selectedTabIndex
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCollectionId: freezed == selectedCollectionId
          ? _value.selectedCollectionId
          : selectedCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      editingCollectionId: freezed == editingCollectionId
          ? _value.editingCollectionId
          : editingCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      newCollectionName: freezed == newCollectionName
          ? _value.newCollectionName
          : newCollectionName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WatchlistStateImpl implements _WatchlistState {
  const _$WatchlistStateImpl(
      {final List<WatchlistCollection> collections = const [],
      this.selectedTabIndex = 0,
      this.isDeleteMode = false,
      this.selectedCollectionId,
      this.editingCollectionId,
      this.newCollectionName})
      : _collections = collections;

  final List<WatchlistCollection> _collections;
  @override
  @JsonKey()
  List<WatchlistCollection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  @JsonKey()
  final int selectedTabIndex;
  @override
  @JsonKey()
  final bool isDeleteMode;
  @override
  final String? selectedCollectionId;
  @override
  final String? editingCollectionId;
  @override
  final String? newCollectionName;

  @override
  String toString() {
    return 'WatchlistState(collections: $collections, selectedTabIndex: $selectedTabIndex, isDeleteMode: $isDeleteMode, selectedCollectionId: $selectedCollectionId, editingCollectionId: $editingCollectionId, newCollectionName: $newCollectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistStateImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                other.selectedTabIndex == selectedTabIndex) &&
            (identical(other.isDeleteMode, isDeleteMode) ||
                other.isDeleteMode == isDeleteMode) &&
            (identical(other.selectedCollectionId, selectedCollectionId) ||
                other.selectedCollectionId == selectedCollectionId) &&
            (identical(other.editingCollectionId, editingCollectionId) ||
                other.editingCollectionId == editingCollectionId) &&
            (identical(other.newCollectionName, newCollectionName) ||
                other.newCollectionName == newCollectionName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_collections),
      selectedTabIndex,
      isDeleteMode,
      selectedCollectionId,
      editingCollectionId,
      newCollectionName);

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistStateImplCopyWith<_$WatchlistStateImpl> get copyWith =>
      __$$WatchlistStateImplCopyWithImpl<_$WatchlistStateImpl>(
          this, _$identity);
}

abstract class _WatchlistState implements WatchlistState {
  const factory _WatchlistState(
      {final List<WatchlistCollection> collections,
      final int selectedTabIndex,
      final bool isDeleteMode,
      final String? selectedCollectionId,
      final String? editingCollectionId,
      final String? newCollectionName}) = _$WatchlistStateImpl;

  @override
  List<WatchlistCollection> get collections;
  @override
  int get selectedTabIndex;
  @override
  bool get isDeleteMode;
  @override
  String? get selectedCollectionId;
  @override
  String? get editingCollectionId;
  @override
  String? get newCollectionName;

  /// Create a copy of WatchlistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistStateImplCopyWith<_$WatchlistStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
