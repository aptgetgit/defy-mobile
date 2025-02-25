// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../network_config_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkConfigsHash() => r'bb6304c42d1963f36041ef0d8d84f6dd41be72c6';

/// See also [networkConfigs].
@ProviderFor(networkConfigs)
final networkConfigsProvider =
    AutoDisposeProvider<List<NetworkConfig>>.internal(
  networkConfigs,
  name: r'networkConfigsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConfigsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetworkConfigsRef = AutoDisposeProviderRef<List<NetworkConfig>>;
String _$networkConfigSyncHash() => r'69a6646a5c8caef4551ebe64d69a646a860a63f5';

/// See also [NetworkConfigSync].
@ProviderFor(NetworkConfigSync)
final networkConfigSyncProvider =
    AsyncNotifierProvider<NetworkConfigSync, List<NetworkConfig>>.internal(
  NetworkConfigSync.new,
  name: r'networkConfigSyncProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConfigSyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkConfigSync = AsyncNotifier<List<NetworkConfig>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
