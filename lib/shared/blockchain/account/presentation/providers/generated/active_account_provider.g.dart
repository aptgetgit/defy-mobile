// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../active_account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeAccountHash() => r'd05356fbedd0923ec9be33cca96af879933d9a0d';

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
