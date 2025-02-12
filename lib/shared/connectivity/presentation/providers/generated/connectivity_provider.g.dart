// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityInitializerHash() =>
    r'b68307f9c68693879b2b651e5fa7a7807426e135';

/// See also [connectivityInitializer].
@ProviderFor(connectivityInitializer)
final connectivityInitializerProvider = Provider<ConnectivityConfig>.internal(
  connectivityInitializer,
  name: r'connectivityInitializerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityInitializerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityInitializerRef = ProviderRef<ConnectivityConfig>;
String _$connectivityStatusHash() =>
    r'9e3b508b4da624362b2e7b56775d8292795a09e5';

/// See also [connectivityStatus].
@ProviderFor(connectivityStatus)
final connectivityStatusProvider =
    FutureProvider<Stream<ConnectivityStatus>>.internal(
  connectivityStatus,
  name: r'connectivityStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityStatusRef = FutureProviderRef<Stream<ConnectivityStatus>>;
String _$isOnlineHash() => r'81fb0efba20a23a4aff764edbe27722a7beaa726';

/// See also [isOnline].
@ProviderFor(isOnline)
final isOnlineProvider = AutoDisposeStreamProvider<bool>.internal(
  isOnline,
  name: r'isOnlineProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isOnlineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsOnlineRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
