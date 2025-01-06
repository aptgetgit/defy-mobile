// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_metadata_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinMetadataServiceHash() =>
    r'c357202a4ec0f316595d1fba12efd63ad0989ce9';

/// See also [coinMetadataService].
@ProviderFor(coinMetadataService)
final coinMetadataServiceProvider =
    AutoDisposeProvider<CoinMetadataService>.internal(
  coinMetadataService,
  name: r'coinMetadataServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinMetadataServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CoinMetadataServiceRef = AutoDisposeProviderRef<CoinMetadataService>;
String _$coinsMetaDataHash() => r'c0d937ad60fd965fbc1c50edc98a786e95d277ed';

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

/// See also [coinsMetaData].
@ProviderFor(coinsMetaData)
const coinsMetaDataProvider = CoinsMetaDataFamily();

/// See also [coinsMetaData].
class CoinsMetaDataFamily extends Family<AsyncValue<Map<String, dynamic>?>> {
  /// See also [coinsMetaData].
  const CoinsMetaDataFamily();

  /// See also [coinsMetaData].
  CoinsMetaDataProvider call(
    List<String> coinIdList,
  ) {
    return CoinsMetaDataProvider(
      coinIdList,
    );
  }

  @override
  CoinsMetaDataProvider getProviderOverride(
    covariant CoinsMetaDataProvider provider,
  ) {
    return call(
      provider.coinIdList,
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
  String? get name => r'coinsMetaDataProvider';
}

/// See also [coinsMetaData].
class CoinsMetaDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>?> {
  /// See also [coinsMetaData].
  CoinsMetaDataProvider(
    List<String> coinIdList,
  ) : this._internal(
          (ref) => coinsMetaData(
            ref as CoinsMetaDataRef,
            coinIdList,
          ),
          from: coinsMetaDataProvider,
          name: r'coinsMetaDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$coinsMetaDataHash,
          dependencies: CoinsMetaDataFamily._dependencies,
          allTransitiveDependencies:
              CoinsMetaDataFamily._allTransitiveDependencies,
          coinIdList: coinIdList,
        );

  CoinsMetaDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.coinIdList,
  }) : super.internal();

  final List<String> coinIdList;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>?> Function(CoinsMetaDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoinsMetaDataProvider._internal(
        (ref) => create(ref as CoinsMetaDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        coinIdList: coinIdList,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>?> createElement() {
    return _CoinsMetaDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinsMetaDataProvider && other.coinIdList == coinIdList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, coinIdList.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoinsMetaDataRef on AutoDisposeFutureProviderRef<Map<String, dynamic>?> {
  /// The parameter `coinIdList` of this provider.
  List<String> get coinIdList;
}

class _CoinsMetaDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>?>
    with CoinsMetaDataRef {
  _CoinsMetaDataProviderElement(super.provider);

  @override
  List<String> get coinIdList => (origin as CoinsMetaDataProvider).coinIdList;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
