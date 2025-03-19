// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../active_account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeAccountHash() => r'ae229452f78474218da7868212eb0b4346ba830e';

/// See also [ActiveAccount].
@ProviderFor(ActiveAccount)
final activeAccountProvider = AutoDisposeAsyncNotifierProvider<ActiveAccount,
    Option<AptosAccountWithMetadata>>.internal(
  ActiveAccount.new,
  name: r'activeAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveAccount
    = AutoDisposeAsyncNotifier<Option<AptosAccountWithMetadata>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
