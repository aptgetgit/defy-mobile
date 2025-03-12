// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../active_account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentAccountHash() => r'01aedaeaf4909548ba6ffe827dc40d6ff948814c';

/// See also [currentAccount].
@ProviderFor(currentAccount)
final currentAccountProvider =
    AutoDisposeProvider<AptosAccountWithMetadata?>.internal(
  currentAccount,
  name: r'currentAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentAccountRef = AutoDisposeProviderRef<AptosAccountWithMetadata?>;
String _$activeAccountHash() => r'061cc0301070d29a1ccf1256f7287682ac03c7d2';

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
