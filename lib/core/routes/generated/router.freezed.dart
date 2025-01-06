// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppRoute {
  Widget Function(BuildContext, GoRouterState) get builder =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)
        public,
    required TResult Function(
            Widget Function(BuildContext, GoRouterState) builder)
        protected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult? Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PublicRoute value) public,
    required TResult Function(ProtectedRoute value) protected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PublicRoute value)? public,
    TResult? Function(ProtectedRoute value)? protected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PublicRoute value)? public,
    TResult Function(ProtectedRoute value)? protected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppRouteCopyWith<AppRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRouteCopyWith<$Res> {
  factory $AppRouteCopyWith(AppRoute value, $Res Function(AppRoute) then) =
      _$AppRouteCopyWithImpl<$Res, AppRoute>;
  @useResult
  $Res call({Widget Function(BuildContext, GoRouterState) builder});
}

/// @nodoc
class _$AppRouteCopyWithImpl<$Res, $Val extends AppRoute>
    implements $AppRouteCopyWith<$Res> {
  _$AppRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? builder = null,
  }) {
    return _then(_value.copyWith(
      builder: null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as Widget Function(BuildContext, GoRouterState),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicRouteImplCopyWith<$Res>
    implements $AppRouteCopyWith<$Res> {
  factory _$$PublicRouteImplCopyWith(
          _$PublicRouteImpl value, $Res Function(_$PublicRouteImpl) then) =
      __$$PublicRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? redirectIfAuthenticated,
      Widget Function(BuildContext, GoRouterState) builder});
}

/// @nodoc
class __$$PublicRouteImplCopyWithImpl<$Res>
    extends _$AppRouteCopyWithImpl<$Res, _$PublicRouteImpl>
    implements _$$PublicRouteImplCopyWith<$Res> {
  __$$PublicRouteImplCopyWithImpl(
      _$PublicRouteImpl _value, $Res Function(_$PublicRouteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectIfAuthenticated = freezed,
    Object? builder = null,
  }) {
    return _then(_$PublicRouteImpl(
      redirectIfAuthenticated: freezed == redirectIfAuthenticated
          ? _value.redirectIfAuthenticated
          : redirectIfAuthenticated // ignore: cast_nullable_to_non_nullable
              as String?,
      builder: null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as Widget Function(BuildContext, GoRouterState),
    ));
  }
}

/// @nodoc

class _$PublicRouteImpl implements PublicRoute {
  const _$PublicRouteImpl(
      {this.redirectIfAuthenticated, required this.builder});

  @override
  final String? redirectIfAuthenticated;
  @override
  final Widget Function(BuildContext, GoRouterState) builder;

  @override
  String toString() {
    return 'AppRoute.public(redirectIfAuthenticated: $redirectIfAuthenticated, builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicRouteImpl &&
            (identical(
                    other.redirectIfAuthenticated, redirectIfAuthenticated) ||
                other.redirectIfAuthenticated == redirectIfAuthenticated) &&
            (identical(other.builder, builder) || other.builder == builder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, redirectIfAuthenticated, builder);

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicRouteImplCopyWith<_$PublicRouteImpl> get copyWith =>
      __$$PublicRouteImplCopyWithImpl<_$PublicRouteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)
        public,
    required TResult Function(
            Widget Function(BuildContext, GoRouterState) builder)
        protected,
  }) {
    return public(redirectIfAuthenticated, builder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult? Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
  }) {
    return public?.call(redirectIfAuthenticated, builder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(redirectIfAuthenticated, builder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PublicRoute value) public,
    required TResult Function(ProtectedRoute value) protected,
  }) {
    return public(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PublicRoute value)? public,
    TResult? Function(ProtectedRoute value)? protected,
  }) {
    return public?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PublicRoute value)? public,
    TResult Function(ProtectedRoute value)? protected,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(this);
    }
    return orElse();
  }
}

abstract class PublicRoute implements AppRoute {
  const factory PublicRoute(
      {final String? redirectIfAuthenticated,
      required final Widget Function(BuildContext, GoRouterState)
          builder}) = _$PublicRouteImpl;

  String? get redirectIfAuthenticated;
  @override
  Widget Function(BuildContext, GoRouterState) get builder;

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicRouteImplCopyWith<_$PublicRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProtectedRouteImplCopyWith<$Res>
    implements $AppRouteCopyWith<$Res> {
  factory _$$ProtectedRouteImplCopyWith(_$ProtectedRouteImpl value,
          $Res Function(_$ProtectedRouteImpl) then) =
      __$$ProtectedRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget Function(BuildContext, GoRouterState) builder});
}

/// @nodoc
class __$$ProtectedRouteImplCopyWithImpl<$Res>
    extends _$AppRouteCopyWithImpl<$Res, _$ProtectedRouteImpl>
    implements _$$ProtectedRouteImplCopyWith<$Res> {
  __$$ProtectedRouteImplCopyWithImpl(
      _$ProtectedRouteImpl _value, $Res Function(_$ProtectedRouteImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? builder = null,
  }) {
    return _then(_$ProtectedRouteImpl(
      builder: null == builder
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as Widget Function(BuildContext, GoRouterState),
    ));
  }
}

/// @nodoc

class _$ProtectedRouteImpl implements ProtectedRoute {
  const _$ProtectedRouteImpl({required this.builder});

  @override
  final Widget Function(BuildContext, GoRouterState) builder;

  @override
  String toString() {
    return 'AppRoute.protected(builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtectedRouteImpl &&
            (identical(other.builder, builder) || other.builder == builder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, builder);

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtectedRouteImplCopyWith<_$ProtectedRouteImpl> get copyWith =>
      __$$ProtectedRouteImplCopyWithImpl<_$ProtectedRouteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)
        public,
    required TResult Function(
            Widget Function(BuildContext, GoRouterState) builder)
        protected,
  }) {
    return protected(builder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult? Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
  }) {
    return protected?.call(builder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? redirectIfAuthenticated,
            Widget Function(BuildContext, GoRouterState) builder)?
        public,
    TResult Function(Widget Function(BuildContext, GoRouterState) builder)?
        protected,
    required TResult orElse(),
  }) {
    if (protected != null) {
      return protected(builder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PublicRoute value) public,
    required TResult Function(ProtectedRoute value) protected,
  }) {
    return protected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PublicRoute value)? public,
    TResult? Function(ProtectedRoute value)? protected,
  }) {
    return protected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PublicRoute value)? public,
    TResult Function(ProtectedRoute value)? protected,
    required TResult orElse(),
  }) {
    if (protected != null) {
      return protected(this);
    }
    return orElse();
  }
}

abstract class ProtectedRoute implements AppRoute {
  const factory ProtectedRoute(
      {required final Widget Function(BuildContext, GoRouterState)
          builder}) = _$ProtectedRouteImpl;

  @override
  Widget Function(BuildContext, GoRouterState) get builder;

  /// Create a copy of AppRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtectedRouteImplCopyWith<_$ProtectedRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
