// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../network_connectivity_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() online,
    required TResult Function() limited,
    required TResult Function() offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? online,
    TResult? Function()? limited,
    TResult? Function()? offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? online,
    TResult Function()? limited,
    TResult Function()? offline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(Limited value) limited,
    required TResult Function(Offline value) offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(Limited value)? limited,
    TResult? Function(Offline value)? offline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(Limited value)? limited,
    TResult Function(Offline value)? offline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkStatusCopyWith<$Res> {
  factory $NetworkStatusCopyWith(
          NetworkStatus value, $Res Function(NetworkStatus) then) =
      _$NetworkStatusCopyWithImpl<$Res, NetworkStatus>;
}

/// @nodoc
class _$NetworkStatusCopyWithImpl<$Res, $Val extends NetworkStatus>
    implements $NetworkStatusCopyWith<$Res> {
  _$NetworkStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnlineImplCopyWith<$Res> {
  factory _$$OnlineImplCopyWith(
          _$OnlineImpl value, $Res Function(_$OnlineImpl) then) =
      __$$OnlineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnlineImplCopyWithImpl<$Res>
    extends _$NetworkStatusCopyWithImpl<$Res, _$OnlineImpl>
    implements _$$OnlineImplCopyWith<$Res> {
  __$$OnlineImplCopyWithImpl(
      _$OnlineImpl _value, $Res Function(_$OnlineImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnlineImpl extends Online {
  const _$OnlineImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnlineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() online,
    required TResult Function() limited,
    required TResult Function() offline,
  }) {
    return online();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? online,
    TResult? Function()? limited,
    TResult? Function()? offline,
  }) {
    return online?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? online,
    TResult Function()? limited,
    TResult Function()? offline,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(Limited value) limited,
    required TResult Function(Offline value) offline,
  }) {
    return online(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(Limited value)? limited,
    TResult? Function(Offline value)? offline,
  }) {
    return online?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(Limited value)? limited,
    TResult Function(Offline value)? offline,
    required TResult orElse(),
  }) {
    if (online != null) {
      return online(this);
    }
    return orElse();
  }
}

abstract class Online extends NetworkStatus {
  const factory Online() = _$OnlineImpl;
  const Online._() : super._();
}

/// @nodoc
abstract class _$$LimitedImplCopyWith<$Res> {
  factory _$$LimitedImplCopyWith(
          _$LimitedImpl value, $Res Function(_$LimitedImpl) then) =
      __$$LimitedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LimitedImplCopyWithImpl<$Res>
    extends _$NetworkStatusCopyWithImpl<$Res, _$LimitedImpl>
    implements _$$LimitedImplCopyWith<$Res> {
  __$$LimitedImplCopyWithImpl(
      _$LimitedImpl _value, $Res Function(_$LimitedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LimitedImpl extends Limited {
  const _$LimitedImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LimitedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() online,
    required TResult Function() limited,
    required TResult Function() offline,
  }) {
    return limited();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? online,
    TResult? Function()? limited,
    TResult? Function()? offline,
  }) {
    return limited?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? online,
    TResult Function()? limited,
    TResult Function()? offline,
    required TResult orElse(),
  }) {
    if (limited != null) {
      return limited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(Limited value) limited,
    required TResult Function(Offline value) offline,
  }) {
    return limited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(Limited value)? limited,
    TResult? Function(Offline value)? offline,
  }) {
    return limited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(Limited value)? limited,
    TResult Function(Offline value)? offline,
    required TResult orElse(),
  }) {
    if (limited != null) {
      return limited(this);
    }
    return orElse();
  }
}

abstract class Limited extends NetworkStatus {
  const factory Limited() = _$LimitedImpl;
  const Limited._() : super._();
}

/// @nodoc
abstract class _$$OfflineImplCopyWith<$Res> {
  factory _$$OfflineImplCopyWith(
          _$OfflineImpl value, $Res Function(_$OfflineImpl) then) =
      __$$OfflineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OfflineImplCopyWithImpl<$Res>
    extends _$NetworkStatusCopyWithImpl<$Res, _$OfflineImpl>
    implements _$$OfflineImplCopyWith<$Res> {
  __$$OfflineImplCopyWithImpl(
      _$OfflineImpl _value, $Res Function(_$OfflineImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OfflineImpl extends Offline {
  const _$OfflineImpl() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OfflineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() online,
    required TResult Function() limited,
    required TResult Function() offline,
  }) {
    return offline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? online,
    TResult? Function()? limited,
    TResult? Function()? offline,
  }) {
    return offline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? online,
    TResult Function()? limited,
    TResult Function()? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Online value) online,
    required TResult Function(Limited value) limited,
    required TResult Function(Offline value) offline,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Online value)? online,
    TResult? Function(Limited value)? limited,
    TResult? Function(Offline value)? offline,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Online value)? online,
    TResult Function(Limited value)? limited,
    TResult Function(Offline value)? offline,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class Offline extends NetworkStatus {
  const factory Offline() = _$OfflineImpl;
  const Offline._() : super._();
}
