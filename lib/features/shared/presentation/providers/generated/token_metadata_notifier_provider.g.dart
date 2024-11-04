// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token_metadata_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenMetaDataHash() => r'16062754017d6a58b63607c9f44feb226e8245fd';

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
    extends BuildlessAutoDisposeAsyncNotifier<TokenMetaDataEntity?> {
  late final String? coinId;

  FutureOr<TokenMetaDataEntity?> build(
    String? coinId,
  );
}

/// See also [TokenMetaData].
@ProviderFor(TokenMetaData)
const tokenMetaDataProvider = TokenMetaDataFamily();

/// See also [TokenMetaData].
class TokenMetaDataFamily extends Family<AsyncValue<TokenMetaDataEntity?>> {
  /// See also [TokenMetaData].
  const TokenMetaDataFamily();

  /// See also [TokenMetaData].
  TokenMetaDataProvider call(
    String? coinId,
  ) {
    return TokenMetaDataProvider(
      coinId,
    );
  }

  @override
  TokenMetaDataProvider getProviderOverride(
    covariant TokenMetaDataProvider provider,
  ) {
    return call(
      provider.coinId,
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
class TokenMetaDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TokenMetaData, TokenMetaDataEntity?> {
  /// See also [TokenMetaData].
  TokenMetaDataProvider(
    String? coinId,
  ) : this._internal(
          () => TokenMetaData()..coinId = coinId,
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
        );

  TokenMetaDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.coinId,
  }) : super.internal();

  final String? coinId;

  @override
  FutureOr<TokenMetaDataEntity?> runNotifierBuild(
    covariant TokenMetaData notifier,
  ) {
    return notifier.build(
      coinId,
    );
  }

  @override
  Override overrideWith(TokenMetaData Function() create) {
    return ProviderOverride(
      origin: this,
      override: TokenMetaDataProvider._internal(
        () => create()..coinId = coinId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        coinId: coinId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TokenMetaData, TokenMetaDataEntity?>
      createElement() {
    return _TokenMetaDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TokenMetaDataProvider && other.coinId == coinId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, coinId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TokenMetaDataRef
    on AutoDisposeAsyncNotifierProviderRef<TokenMetaDataEntity?> {
  /// The parameter `coinId` of this provider.
  String? get coinId;
}

class _TokenMetaDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TokenMetaData,
        TokenMetaDataEntity?> with TokenMetaDataRef {
  _TokenMetaDataProviderElement(super.provider);

  @override
  String? get coinId => (origin as TokenMetaDataProvider).coinId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
