// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../wallet_creation_wallet_background_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletBackgroundState {
  Color get selectedColor => throw _privateConstructorUsedError;
  double get sliderPosition => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;

  /// Create a copy of WalletBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletBackgroundStateCopyWith<WalletBackgroundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBackgroundStateCopyWith<$Res> {
  factory $WalletBackgroundStateCopyWith(WalletBackgroundState value,
          $Res Function(WalletBackgroundState) then) =
      _$WalletBackgroundStateCopyWithImpl<$Res, WalletBackgroundState>;
  @useResult
  $Res call({Color selectedColor, double sliderPosition, int selectedIndex});
}

/// @nodoc
class _$WalletBackgroundStateCopyWithImpl<$Res,
        $Val extends WalletBackgroundState>
    implements $WalletBackgroundStateCopyWith<$Res> {
  _$WalletBackgroundStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedColor = null,
    Object? sliderPosition = null,
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedColor: null == selectedColor
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as Color,
      sliderPosition: null == sliderPosition
          ? _value.sliderPosition
          : sliderPosition // ignore: cast_nullable_to_non_nullable
              as double,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletBackgroundStateImplCopyWith<$Res>
    implements $WalletBackgroundStateCopyWith<$Res> {
  factory _$$WalletBackgroundStateImplCopyWith(
          _$WalletBackgroundStateImpl value,
          $Res Function(_$WalletBackgroundStateImpl) then) =
      __$$WalletBackgroundStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color selectedColor, double sliderPosition, int selectedIndex});
}

/// @nodoc
class __$$WalletBackgroundStateImplCopyWithImpl<$Res>
    extends _$WalletBackgroundStateCopyWithImpl<$Res,
        _$WalletBackgroundStateImpl>
    implements _$$WalletBackgroundStateImplCopyWith<$Res> {
  __$$WalletBackgroundStateImplCopyWithImpl(_$WalletBackgroundStateImpl _value,
      $Res Function(_$WalletBackgroundStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedColor = null,
    Object? sliderPosition = null,
    Object? selectedIndex = null,
  }) {
    return _then(_$WalletBackgroundStateImpl(
      selectedColor: null == selectedColor
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as Color,
      sliderPosition: null == sliderPosition
          ? _value.sliderPosition
          : sliderPosition // ignore: cast_nullable_to_non_nullable
              as double,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletBackgroundStateImpl implements _WalletBackgroundState {
  const _$WalletBackgroundStateImpl(
      {this.selectedColor = AppColors.blue,
      this.sliderPosition = 0.0,
      this.selectedIndex = 0});

  @override
  @JsonKey()
  final Color selectedColor;
  @override
  @JsonKey()
  final double sliderPosition;
  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'WalletBackgroundState(selectedColor: $selectedColor, sliderPosition: $sliderPosition, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBackgroundStateImpl &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.sliderPosition, sliderPosition) ||
                other.sliderPosition == sliderPosition) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedColor, sliderPosition, selectedIndex);

  /// Create a copy of WalletBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletBackgroundStateImplCopyWith<_$WalletBackgroundStateImpl>
      get copyWith => __$$WalletBackgroundStateImplCopyWithImpl<
          _$WalletBackgroundStateImpl>(this, _$identity);
}

abstract class _WalletBackgroundState implements WalletBackgroundState {
  const factory _WalletBackgroundState(
      {final Color selectedColor,
      final double sliderPosition,
      final int selectedIndex}) = _$WalletBackgroundStateImpl;

  @override
  Color get selectedColor;
  @override
  double get sliderPosition;
  @override
  int get selectedIndex;

  /// Create a copy of WalletBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletBackgroundStateImplCopyWith<_$WalletBackgroundStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
