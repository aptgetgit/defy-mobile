// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentBrightnessHash() => r'072622a54b3b732383b750763d2f36a3b982a1d3';

/// See also [currentBrightness].
@ProviderFor(currentBrightness)
final currentBrightnessProvider = AutoDisposeProvider<Brightness>.internal(
  currentBrightness,
  name: r'currentBrightnessProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentBrightnessHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentBrightnessRef = AutoDisposeProviderRef<Brightness>;
String _$themeNotifierHash() => r'912105f88ba78d1b8ccd2af0989aec1bd27d6414';

/// See also [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AsyncNotifierProvider<ThemeNotifier, ThemeMode>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = AsyncNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
