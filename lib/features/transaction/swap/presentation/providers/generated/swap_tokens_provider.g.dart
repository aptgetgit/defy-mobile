// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../swap_tokens_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$swapFromHash() => r'c117346d67f4a68ac55801bd07c918810612d0c3';

/// See also [SwapFrom].
@ProviderFor(SwapFrom)
final swapFromProvider =
    AsyncNotifierProvider<SwapFrom, List<SwapTokenEntity>>.internal(
  SwapFrom.new,
  name: r'swapFromProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$swapFromHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SwapFrom = AsyncNotifier<List<SwapTokenEntity>>;
String _$swapToHash() => r'24b567fcc05eadaded1e7322ac31d48ec3fe22c1';

/// See also [SwapTo].
@ProviderFor(SwapTo)
final swapToProvider =
    AsyncNotifierProvider<SwapTo, List<SwapTokenEntity>>.internal(
  SwapTo.new,
  name: r'swapToProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$swapToHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SwapTo = AsyncNotifier<List<SwapTokenEntity>>;
String _$swapHash() => r'0bb8f5997847b410413297b712c4532b4b17149b';

/// See also [Swap].
@ProviderFor(Swap)
final swapProvider = AsyncNotifierProvider<Swap, SwapAssets>.internal(
  Swap.new,
  name: r'swapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$swapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Swap = AsyncNotifier<SwapAssets>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
