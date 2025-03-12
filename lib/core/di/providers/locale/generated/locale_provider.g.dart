// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLocalizationHash() => r'3cf4785a0a87da614acb1a4417caa6ba002363f3';

/// See also [appLocalization].
@ProviderFor(appLocalization)
final appLocalizationProvider = AutoDisposeProvider<AppLocalizations>.internal(
  appLocalization,
  name: r'appLocalizationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appLocalizationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppLocalizationRef = AutoDisposeProviderRef<AppLocalizations>;
String _$localeNotifierHash() => r'9eabd2ed276823b0624712f939bae89a03802a3d';

/// See also [LocaleNotifier].
@ProviderFor(LocaleNotifier)
final localeNotifierProvider =
    AsyncNotifierProvider<LocaleNotifier, Locale>.internal(
  LocaleNotifier.new,
  name: r'localeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleNotifier = AsyncNotifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
