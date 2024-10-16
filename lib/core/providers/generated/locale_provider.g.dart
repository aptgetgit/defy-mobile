// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$l10nHash() => r'0f735f99a8449662534091d67599af46a8ee9089';

/// See also [l10n].
@ProviderFor(l10n)
final l10nProvider = AutoDisposeProvider<AppLocalizations>.internal(
  l10n,
  name: r'l10nProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$l10nHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef L10nRef = AutoDisposeProviderRef<AppLocalizations>;
String _$localeNotifierHash() => r'01749cade07eab6f1f7ffa7b2201043d24a323c5';

/// See also [LocaleNotifier].
@ProviderFor(LocaleNotifier)
final localeNotifierProvider =
    AutoDisposeNotifierProvider<LocaleNotifier, Locale>.internal(
  LocaleNotifier.new,
  name: r'localeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocaleNotifier = AutoDisposeNotifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
