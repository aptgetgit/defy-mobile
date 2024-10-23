// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyHash() => r'b27603255de5590ddb05b34175d15f7429c6b0cc';

/// See also [currency].
@ProviderFor(currency)
final currencyProvider = AutoDisposeProvider<Currency>.internal(
  currency,
  name: r'currencyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrencyRef = AutoDisposeProviderRef<Currency>;
String _$currencyNotifierHash() => r'1d56124199e94e13aa1f37d81d61e457a6311ebc';

/// See also [CurrencyNotifier].
@ProviderFor(CurrencyNotifier)
final currencyNotifierProvider =
    AutoDisposeNotifierProvider<CurrencyNotifier, Currency>.internal(
  CurrencyNotifier.new,
  name: r'currencyNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencyNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrencyNotifier = AutoDisposeNotifier<Currency>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
