// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../wallet_inventory_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletInventoryRemoteHash() =>
    r'60e76bda8195f6bb0113daceb6097fbbe5011f61';

/// See also [walletInventoryRemote].
@ProviderFor(walletInventoryRemote)
final walletInventoryRemoteProvider =
    AutoDisposeProvider<WalletInventoryRemote>.internal(
  walletInventoryRemote,
  name: r'walletInventoryRemoteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletInventoryRemoteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletInventoryRemoteRef
    = AutoDisposeProviderRef<WalletInventoryRemote>;
String _$walletInventoryRepositoryHash() =>
    r'e795918e2dedcdffe92e44d754ae6d1b35314156';

/// See also [walletInventoryRepository].
@ProviderFor(walletInventoryRepository)
final walletInventoryRepositoryProvider =
    AutoDisposeProvider<WalletInventoryRepository>.internal(
  walletInventoryRepository,
  name: r'walletInventoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletInventoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletInventoryRepositoryRef
    = AutoDisposeProviderRef<WalletInventoryRepository>;
String _$walletInventoryUseCaseHash() =>
    r'940db1fb7a28841e40ec8ae955ebc65ad46d90e5';

/// See also [walletInventoryUseCase].
@ProviderFor(walletInventoryUseCase)
final walletInventoryUseCaseProvider =
    AutoDisposeProvider<WalletInventoryUseCase>.internal(
  walletInventoryUseCase,
  name: r'walletInventoryUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletInventoryUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletInventoryUseCaseRef
    = AutoDisposeProviderRef<WalletInventoryUseCase>;
String _$walletInventoryDataHash() =>
    r'8324614b8dcf68c1a243708d48e0066816405203';

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

/// See also [walletInventoryData].
@ProviderFor(walletInventoryData)
const walletInventoryDataProvider = WalletInventoryDataFamily();

/// See also [walletInventoryData].
class WalletInventoryDataFamily
    extends Family<AsyncValue<WalletInventoryEntity?>> {
  /// See also [walletInventoryData].
  const WalletInventoryDataFamily();

  /// See also [walletInventoryData].
  WalletInventoryDataProvider call(
    String owner,
  ) {
    return WalletInventoryDataProvider(
      owner,
    );
  }

  @override
  WalletInventoryDataProvider getProviderOverride(
    covariant WalletInventoryDataProvider provider,
  ) {
    return call(
      provider.owner,
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
  String? get name => r'walletInventoryDataProvider';
}

/// See also [walletInventoryData].
class WalletInventoryDataProvider
    extends AutoDisposeFutureProvider<WalletInventoryEntity?> {
  /// See also [walletInventoryData].
  WalletInventoryDataProvider(
    String owner,
  ) : this._internal(
          (ref) => walletInventoryData(
            ref as WalletInventoryDataRef,
            owner,
          ),
          from: walletInventoryDataProvider,
          name: r'walletInventoryDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$walletInventoryDataHash,
          dependencies: WalletInventoryDataFamily._dependencies,
          allTransitiveDependencies:
              WalletInventoryDataFamily._allTransitiveDependencies,
          owner: owner,
        );

  WalletInventoryDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.owner,
  }) : super.internal();

  final String owner;

  @override
  Override overrideWith(
    FutureOr<WalletInventoryEntity?> Function(WalletInventoryDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WalletInventoryDataProvider._internal(
        (ref) => create(ref as WalletInventoryDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        owner: owner,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WalletInventoryEntity?> createElement() {
    return _WalletInventoryDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletInventoryDataProvider && other.owner == owner;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, owner.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WalletInventoryDataRef
    on AutoDisposeFutureProviderRef<WalletInventoryEntity?> {
  /// The parameter `owner` of this provider.
  String get owner;
}

class _WalletInventoryDataProviderElement
    extends AutoDisposeFutureProviderElement<WalletInventoryEntity?>
    with WalletInventoryDataRef {
  _WalletInventoryDataProviderElement(super.provider);

  @override
  String get owner => (origin as WalletInventoryDataProvider).owner;
}

String _$walletInventoryHash() => r'88fa97df025fa35152037ff52d2a206170fa2dbd';

/// See also [WalletInventory].
@ProviderFor(WalletInventory)
final walletInventoryProvider =
    AutoDisposeNotifierProvider<WalletInventory, void>.internal(
  WalletInventory.new,
  name: r'walletInventoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletInventoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WalletInventory = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
