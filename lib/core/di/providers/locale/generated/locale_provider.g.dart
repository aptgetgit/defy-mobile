// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$l10nHash() => r'acf5de48e42c61c9af1ea35c00c9a1f5538e2e01';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef L10nRef = AutoDisposeProviderRef<AppLocalizations>;
String _$localeNotifierHash() => r'ff680ca77df0d7889b165046c61c700f1cd8d5d7';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
