// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../new_wallet_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showBalanceHash() => r'ec08b862db1d4cd56db9ee1b84a43435cbb00724';

/// See also [ShowBalance].
@ProviderFor(ShowBalance)
final showBalanceProvider = NotifierProvider<ShowBalance, bool>.internal(
  ShowBalance.new,
  name: r'showBalanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowBalance = Notifier<bool>;
String _$cardEmojiHash() => r'be1e18129abe12970d05c979d18b63bc65800d3b';

/// See also [CardEmoji].
@ProviderFor(CardEmoji)
final cardEmojiProvider =
    AutoDisposeNotifierProvider<CardEmoji, Widget>.internal(
  CardEmoji.new,
  name: r'cardEmojiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cardEmojiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CardEmoji = AutoDisposeNotifier<Widget>;
String _$walletCreationStageHash() =>
    r'e6009be1dc65fe508a2a2ab30db3748db42786ef';

/// See also [WalletCreationStage].
@ProviderFor(WalletCreationStage)
final walletCreationStageProvider = AutoDisposeNotifierProvider<
    WalletCreationStage, CreationStageController>.internal(
  WalletCreationStage.new,
  name: r'walletCreationStageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletCreationStageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WalletCreationStage = AutoDisposeNotifier<CreationStageController>;
String _$newWalletDataStateHash() =>
    r'8e74bb6067442056274bdce2a1e9ee877f291772';

/// See also [NewWalletDataState].
@ProviderFor(NewWalletDataState)
final newWalletDataStateProvider =
    NotifierProvider<NewWalletDataState, NewWalletData>.internal(
  NewWalletDataState.new,
  name: r'newWalletDataStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newWalletDataStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewWalletDataState = Notifier<NewWalletData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
