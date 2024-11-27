// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../blockchain_account_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockchainAccountNotifierHash() =>
    r'068d94b227fc176264c6f38040dbd4811fbb8828';

/// See also [BlockchainAccountNotifier].
@ProviderFor(BlockchainAccountNotifier)
final blockchainAccountNotifierProvider = AutoDisposeAsyncNotifierProvider<
    BlockchainAccountNotifier, List<BlockchainAccount>>.internal(
  BlockchainAccountNotifier.new,
  name: r'blockchainAccountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$blockchainAccountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BlockchainAccountNotifier
    = AutoDisposeAsyncNotifier<List<BlockchainAccount>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
