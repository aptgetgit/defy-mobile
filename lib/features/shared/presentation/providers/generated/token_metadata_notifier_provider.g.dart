// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_metadata_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenMetaDataHash() => r'e20bb83dcc4d42057feb5ffc73c362991dce1e39';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TokenMetaData
    extends BuildlessAutoDisposeAsyncNotifier<double?> {
  late final String coinId;
  late final double amount;

  FutureOr<double?> build(
    String coinId,
    double amount,
  );
}

/// See also [TokenMetaData].
@ProviderFor(TokenMetaData)
const tokenMetaDataProvider = TokenMetaDataFamily();

/// See also [TokenMetaData].
class TokenMetaDataFamily extends Family<AsyncValue<double?>> {
  /// See also [TokenMetaData].
  const TokenMetaDataFamily();

  /// See also [TokenMetaData].
  TokenMetaDataProvider call(
    String coinId,
    double amount,
  ) {
    return TokenMetaDataProvider(
      coinId,
      amount,
    );
  }

  @override
  TokenMetaDataProvider getProviderOverride(
    covariant TokenMetaDataProvider provider,
  ) {
    return call(
      provider.coinId,
      provider.amount,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tokenMetaDataProvider';
}

/// See also [TokenMetaData].
class TokenMetaDataProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TokenMetaData, double?> {
  /// See also [TokenMetaData].
  TokenMetaDataProvider(
    String coinId,
    double amount,
  ) : this._internal(
          () => TokenMetaData()
            ..coinId = coinId
            ..amount = amount,
          from: tokenMetaDataProvider,
          name: r'tokenMetaDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tokenMetaDataHash,
          dependencies: TokenMetaDataFamily._dependencies,
          allTransitiveDependencies:
              TokenMetaDataFamily._allTransitiveDependencies,
          coinId: coinId,
          amount: amount,
        );

  TokenMetaDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.coinId,
    required this.amount,
  }) : super.internal();

  final String coinId;
  final double amount;

  @override
  FutureOr<double?> runNotifierBuild(
    covariant TokenMetaData notifier,
  ) {
    return notifier.build(
      coinId,
      amount,
    );
  }

  @override
  Override overrideWith(TokenMetaData Function() create) {
    return ProviderOverride(
      origin: this,
      override: TokenMetaDataProvider._internal(
        () => create()
          ..coinId = coinId
          ..amount = amount,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        coinId: coinId,
        amount: amount,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TokenMetaData, double?>
      createElement() {
    return _TokenMetaDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TokenMetaDataProvider &&
        other.coinId == coinId &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, coinId.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TokenMetaDataRef on AutoDisposeAsyncNotifierProviderRef<double?> {
  /// The parameter `coinId` of this provider.
  String get coinId;

  /// The parameter `amount` of this provider.
  double get amount;
}

class _TokenMetaDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TokenMetaData, double?>
    with TokenMetaDataRef {
  _TokenMetaDataProviderElement(super.provider);

  @override
  String get coinId => (origin as TokenMetaDataProvider).coinId;
  @override
  double get amount => (origin as TokenMetaDataProvider).amount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
