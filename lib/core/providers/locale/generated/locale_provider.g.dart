// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLocalizationHash() => r'35061746a15c8a693862cfd81292faa33077e6eb';

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
String _$localeNotifierHash() => r'1bbb81609af5406da1da4f1ed32d97be5a590af3';

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
