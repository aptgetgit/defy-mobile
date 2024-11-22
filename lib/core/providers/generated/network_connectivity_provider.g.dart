// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkInitializerHash() =>
    r'038ca2cafde11293fc707b3a5f7c286778184b69';

/// See also [networkInitializer].
@ProviderFor(networkInitializer)
final networkInitializerProvider = Provider<NetworkConnectivityConfig>.internal(
  networkInitializer,
  name: r'networkInitializerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkInitializerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetworkInitializerRef = ProviderRef<NetworkConnectivityConfig>;
String _$networkStatusHash() => r'1197c80cabd67f38bda05ade6ee332d40a16cb22';

/// See also [networkStatus].
@ProviderFor(networkStatus)
final networkStatusProvider = StreamProvider<NetworkStatus>.internal(
  networkStatus,
  name: r'networkStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetworkStatusRef = StreamProviderRef<NetworkStatus>;
String _$isOnlineHash() => r'65b3c92bdbccf87bf0f4e14b99bc0eea99468df0';

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
