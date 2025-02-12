// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../active_network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentNetworkHash() => r'9b86e5e48a22f1fc2b26c0479c9a9104e6d66609';

/// See also [currentNetwork].
@ProviderFor(currentNetwork)
final currentNetworkProvider = AutoDisposeProvider<AptosNetwork?>.internal(
  currentNetwork,
  name: r'currentNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentNetworkRef = AutoDisposeProviderRef<AptosNetwork?>;
String _$activeNetworkHash() => r'dde6ee98aac36b73b3a9a50a82c5f648f551adde';

/// See also [ActiveNetwork].
@ProviderFor(ActiveNetwork)
final activeNetworkProvider =
    AutoDisposeAsyncNotifierProvider<ActiveNetwork, AptosNetwork>.internal(
  ActiveNetwork.new,
  name: r'activeNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveNetwork = AutoDisposeAsyncNotifier<AptosNetwork>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
