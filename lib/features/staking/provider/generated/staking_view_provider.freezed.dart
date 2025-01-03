// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../staking_view_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StakingViewState {
  String get usdAmount => throw _privateConstructorUsedError;
  String get aptosAmount => throw _privateConstructorUsedError;
  bool get isUsdAmount => throw _privateConstructorUsedError;

  /// Create a copy of StakingViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StakingViewStateCopyWith<StakingViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakingViewStateCopyWith<$Res> {
  factory $StakingViewStateCopyWith(
          StakingViewState value, $Res Function(StakingViewState) then) =
      _$StakingViewStateCopyWithImpl<$Res, StakingViewState>;
  @useResult
  $Res call({String usdAmount, String aptosAmount, bool isUsdAmount});
}

/// @nodoc
class _$StakingViewStateCopyWithImpl<$Res, $Val extends StakingViewState>
    implements $StakingViewStateCopyWith<$Res> {
  _$StakingViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StakingViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usdAmount = null,
    Object? aptosAmount = null,
    Object? isUsdAmount = null,
  }) {
    return _then(_value.copyWith(
      usdAmount: null == usdAmount
          ? _value.usdAmount
          : usdAmount // ignore: cast_nullable_to_non_nullable
              as String,
      aptosAmount: null == aptosAmount
          ? _value.aptosAmount
          : aptosAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isUsdAmount: null == isUsdAmount
          ? _value.isUsdAmount
          : isUsdAmount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StakingViewStateImplCopyWith<$Res>
    implements $StakingViewStateCopyWith<$Res> {
  factory _$$StakingViewStateImplCopyWith(_$StakingViewStateImpl value,
          $Res Function(_$StakingViewStateImpl) then) =
      __$$StakingViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String usdAmount, String aptosAmount, bool isUsdAmount});
}

/// @nodoc
class __$$StakingViewStateImplCopyWithImpl<$Res>
    extends _$StakingViewStateCopyWithImpl<$Res, _$StakingViewStateImpl>
    implements _$$StakingViewStateImplCopyWith<$Res> {
  __$$StakingViewStateImplCopyWithImpl(_$StakingViewStateImpl _value,
      $Res Function(_$StakingViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StakingViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usdAmount = null,
    Object? aptosAmount = null,
    Object? isUsdAmount = null,
  }) {
    return _then(_$StakingViewStateImpl(
      usdAmount: null == usdAmount
          ? _value.usdAmount
          : usdAmount // ignore: cast_nullable_to_non_nullable
              as String,
      aptosAmount: null == aptosAmount
          ? _value.aptosAmount
          : aptosAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isUsdAmount: null == isUsdAmount
          ? _value.isUsdAmount
          : isUsdAmount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StakingViewStateImpl implements _StakingViewState {
  const _$StakingViewStateImpl(
      {this.usdAmount = '0', this.aptosAmount = '0', this.isUsdAmount = true});

  @override
  @JsonKey()
  final String usdAmount;
  @override
  @JsonKey()
  final String aptosAmount;
  @override
  @JsonKey()
  final bool isUsdAmount;

  @override
  String toString() {
    return 'StakingViewState(usdAmount: $usdAmount, aptosAmount: $aptosAmount, isUsdAmount: $isUsdAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StakingViewStateImpl &&
            (identical(other.usdAmount, usdAmount) ||
                other.usdAmount == usdAmount) &&
            (identical(other.aptosAmount, aptosAmount) ||
                other.aptosAmount == aptosAmount) &&
            (identical(other.isUsdAmount, isUsdAmount) ||
                other.isUsdAmount == isUsdAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, usdAmount, aptosAmount, isUsdAmount);

  /// Create a copy of StakingViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StakingViewStateImplCopyWith<_$StakingViewStateImpl> get copyWith =>
      __$$StakingViewStateImplCopyWithImpl<_$StakingViewStateImpl>(
          this, _$identity);
}

abstract class _StakingViewState implements StakingViewState {
  const factory _StakingViewState(
      {final String usdAmount,
      final String aptosAmount,
      final bool isUsdAmount}) = _$StakingViewStateImpl;

  @override
  String get usdAmount;
  @override
  String get aptosAmount;
  @override
  bool get isUsdAmount;

  /// Create a copy of StakingViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StakingViewStateImplCopyWith<_$StakingViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
