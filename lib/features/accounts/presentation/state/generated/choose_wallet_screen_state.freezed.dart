// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../choose_wallet_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChooseWalletScreenState {
  int get currentIndex => throw _privateConstructorUsedError;
  bool get isUpdated => throw _privateConstructorUsedError;

  /// Create a copy of ChooseWalletScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChooseWalletScreenStateCopyWith<ChooseWalletScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseWalletScreenStateCopyWith<$Res> {
  factory $ChooseWalletScreenStateCopyWith(ChooseWalletScreenState value,
          $Res Function(ChooseWalletScreenState) then) =
      _$ChooseWalletScreenStateCopyWithImpl<$Res, ChooseWalletScreenState>;
  @useResult
  $Res call({int currentIndex, bool isUpdated});
}

/// @nodoc
class _$ChooseWalletScreenStateCopyWithImpl<$Res,
        $Val extends ChooseWalletScreenState>
    implements $ChooseWalletScreenStateCopyWith<$Res> {
  _$ChooseWalletScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChooseWalletScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isUpdated = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChooseWalletScreenStateImplCopyWith<$Res>
    implements $ChooseWalletScreenStateCopyWith<$Res> {
  factory _$$ChooseWalletScreenStateImplCopyWith(
          _$ChooseWalletScreenStateImpl value,
          $Res Function(_$ChooseWalletScreenStateImpl) then) =
      __$$ChooseWalletScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, bool isUpdated});
}

/// @nodoc
class __$$ChooseWalletScreenStateImplCopyWithImpl<$Res>
    extends _$ChooseWalletScreenStateCopyWithImpl<$Res,
        _$ChooseWalletScreenStateImpl>
    implements _$$ChooseWalletScreenStateImplCopyWith<$Res> {
  __$$ChooseWalletScreenStateImplCopyWithImpl(
      _$ChooseWalletScreenStateImpl _value,
      $Res Function(_$ChooseWalletScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChooseWalletScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? isUpdated = null,
  }) {
    return _then(_$ChooseWalletScreenStateImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isUpdated: null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChooseWalletScreenStateImpl implements _ChooseWalletScreenState {
  const _$ChooseWalletScreenStateImpl(
      {this.currentIndex = 0, this.isUpdated = false});

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final bool isUpdated;

  @override
  String toString() {
    return 'ChooseWalletScreenState(currentIndex: $currentIndex, isUpdated: $isUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseWalletScreenStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.isUpdated, isUpdated) ||
                other.isUpdated == isUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex, isUpdated);

  /// Create a copy of ChooseWalletScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseWalletScreenStateImplCopyWith<_$ChooseWalletScreenStateImpl>
      get copyWith => __$$ChooseWalletScreenStateImplCopyWithImpl<
          _$ChooseWalletScreenStateImpl>(this, _$identity);
}

abstract class _ChooseWalletScreenState implements ChooseWalletScreenState {
  const factory _ChooseWalletScreenState(
      {final int currentIndex,
      final bool isUpdated}) = _$ChooseWalletScreenStateImpl;

  @override
  int get currentIndex;
  @override
  bool get isUpdated;

  /// Create a copy of ChooseWalletScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChooseWalletScreenStateImplCopyWith<_$ChooseWalletScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
