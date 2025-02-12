// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../connectivity_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectivityStatus {}

/// @nodoc
abstract class $ConnectivityStatusCopyWith<$Res> {
  factory $ConnectivityStatusCopyWith(
          ConnectivityStatus value, $Res Function(ConnectivityStatus) then) =
      _$ConnectivityStatusCopyWithImpl<$Res, ConnectivityStatus>;
}

/// @nodoc
class _$ConnectivityStatusCopyWithImpl<$Res, $Val extends ConnectivityStatus>
    implements $ConnectivityStatusCopyWith<$Res> {
  _$ConnectivityStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectivityStatus
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
    extends _$ConnectivityStatusCopyWithImpl<$Res, _$OnlineImpl>
    implements _$$OnlineImplCopyWith<$Res> {
  __$$OnlineImplCopyWithImpl(
      _$OnlineImpl _value, $Res Function(_$OnlineImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityStatus
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
}

abstract class Online extends ConnectivityStatus {
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
    extends _$ConnectivityStatusCopyWithImpl<$Res, _$LimitedImpl>
    implements _$$LimitedImplCopyWith<$Res> {
  __$$LimitedImplCopyWithImpl(
      _$LimitedImpl _value, $Res Function(_$LimitedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityStatus
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
}

abstract class Limited extends ConnectivityStatus {
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
    extends _$ConnectivityStatusCopyWithImpl<$Res, _$OfflineImpl>
    implements _$$OfflineImplCopyWith<$Res> {
  __$$OfflineImplCopyWithImpl(
      _$OfflineImpl _value, $Res Function(_$OfflineImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectivityStatus
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
}

abstract class Offline extends ConnectivityStatus {
  const factory Offline() = _$OfflineImpl;
  const Offline._() : super._();
}
