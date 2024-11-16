// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../send_tokens_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendTokensHash() => r'b65daf03a37c0b6e9f17e5faf8f5efca8c1007db';

/// See also [SendTokens].
@ProviderFor(SendTokens)
final sendTokensProvider =
    AsyncNotifierProvider<SendTokens, List<SendTokenEntity>>.internal(
  SendTokens.new,
  name: r'sendTokensProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sendTokensHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendTokens = AsyncNotifier<List<SendTokenEntity>>;
String _$selectedSendTokensHash() =>
    r'9d1f9b4cdd6f73ad21305501d4beaca417d5aa48';

/// See also [SelectedSendTokens].
@ProviderFor(SelectedSendTokens)
final selectedSendTokensProvider =
    NotifierProvider<SelectedSendTokens, SendAssets>.internal(
  SelectedSendTokens.new,
  name: r'selectedSendTokensProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSendTokensHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedSendTokens = Notifier<SendAssets>;
String _$sendRecentProfilesHash() =>
    r'11b98b05a92c53a16fc9bdcee4aad22fe9ee2483';

/// See also [SendRecentProfiles].
@ProviderFor(SendRecentProfiles)
final sendRecentProfilesProvider =
    NotifierProvider<SendRecentProfiles, List<SendProfileEntity>>.internal(
  SendRecentProfiles.new,
  name: r'sendRecentProfilesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendRecentProfilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SendRecentProfiles = Notifier<List<SendProfileEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
