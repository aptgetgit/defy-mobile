// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../swap_tokens_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$swapFromHash() => r'd1e4a504d47a7bb1d51c3fe9e666ea9ad1bd733b';

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
String _$swapToHash() => r'34e657a1f33620a7bef7170811be0f684a99a9ed';

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
String _$swapHash() => r'3cb1f9d72e7b2bd884b30d707c20f829178f6ba1';

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
