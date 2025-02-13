// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../connectivity_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityStatusInitializerHash() =>
    r'a85e997a62c2e2a2bc784dafd4ee13049cf710a6';

/// See also [connectivityStatusInitializer].
@ProviderFor(connectivityStatusInitializer)
final connectivityStatusInitializerProvider =
    Provider<ConnectivityConfig>.internal(
  connectivityStatusInitializer,
  name: r'connectivityStatusInitializerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityStatusInitializerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityStatusInitializerRef = ProviderRef<ConnectivityConfig>;
String _$connectivityStatusHash() =>
    r'96ec8f464a6f57a4c58603e7549fa196144663ea';

/// See also [connectivityStatus].
@ProviderFor(connectivityStatus)
final connectivityStatusProvider =
    FutureProvider<Stream<ConnectivityState>>.internal(
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
typedef ConnectivityStatusRef = FutureProviderRef<Stream<ConnectivityState>>;
String _$isOnlineHash() => r'2ca970499c0a2632f21f993bf6d442dac8040da3';

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
