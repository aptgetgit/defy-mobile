// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkInitializerHash() =>
    r'c90133321d42301e882365e6759b525453275cf6';

/// See also [networkInitializer].
@ProviderFor(networkInitializer)
final networkInitializerProvider = Provider<NetworkConfig>.internal(
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
typedef NetworkInitializerRef = ProviderRef<NetworkConfig>;
String _$networkStatusHash() => r'38c1edb0bf90c27d0a7b0ca140df275d2519f257';

/// See also [networkStatus].
@ProviderFor(networkStatus)
final networkStatusProvider = FutureProvider<Stream<NetworkStatus>>.internal(
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
typedef NetworkStatusRef = FutureProviderRef<Stream<NetworkStatus>>;
String _$isOnlineHash() => r'fbf5f4213505fdf2b34e4f8ada870ca68a3ad3bd';

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
