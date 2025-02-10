// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkInitializerHash() =>
    r'11d2b6cb46ac031b967c40bb0820c8ad0dadb53b';

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
String _$networkStatusHash() => r'b3f69ef893a44bf5415bc67d0ff27a092d2bef04';

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
String _$isOnlineHash() => r'0a8a028dca9ed74e457cd457924442af422a8be4';

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
