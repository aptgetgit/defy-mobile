// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../send_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendScreenProviderHash() =>
    r'a2e8b6ab592e4d6ff3971383bc5c5a9ab08a8497';

/// See also [SendScreenProvider].
@ProviderFor(SendScreenProvider)
final sendScreenProviderProvider =
    NotifierProvider<SendScreenProvider, SendScreenState>.internal(
  SendScreenProvider.new,
  name: r'sendScreenProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendScreenProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendScreenProvider = Notifier<SendScreenState>;
String _$sendAssetSelectionScreenHash() =>
    r'c81a3ce9f1b160af5978c9e0d4d4e6ecc79e8e40';

/// See also [SendAssetSelectionScreen].
@ProviderFor(SendAssetSelectionScreen)
final sendAssetSelectionScreenProvider = NotifierProvider<
    SendAssetSelectionScreen, SendAssetSelectionScreenState>.internal(
  SendAssetSelectionScreen.new,
  name: r'sendAssetSelectionScreenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendAssetSelectionScreenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendAssetSelectionScreen = Notifier<SendAssetSelectionScreenState>;
String _$sendToFriendHash() => r'bd911e1c97ff91019b34d6cf38cb7c3713dd859b';

/// See also [SendToFriend].
@ProviderFor(SendToFriend)
final sendToFriendProvider =
    NotifierProvider<SendToFriend, SendToState<Friend>>.internal(
  SendToFriend.new,
  name: r'sendToFriendProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sendToFriendHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendToFriend = Notifier<SendToState<Friend>>;
String _$sendToWalletHash() => r'1ca0af04cdfd3adfce3560d4ac9252f0498ea6ac';

/// See also [SendToWallet].
@ProviderFor(SendToWallet)
final sendToWalletProvider =
    NotifierProvider<SendToWallet, SendToState<Wallet>>.internal(
  SendToWallet.new,
  name: r'sendToWalletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sendToWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendToWallet = Notifier<SendToState<Wallet>>;
String _$sendToContactHash() => r'caa2af2ff329a7d4497670f395704f835d59add1';

/// See also [SendToContact].
@ProviderFor(SendToContact)
final sendToContactProvider =
    NotifierProvider<SendToContact, SendToState<Contact>>.internal(
  SendToContact.new,
  name: r'sendToContactProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendToContactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendToContact = Notifier<SendToState<Contact>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
