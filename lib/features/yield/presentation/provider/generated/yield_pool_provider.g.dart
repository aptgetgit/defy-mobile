// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../yield_pool_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$poolRepositoryHash() => r'b02f1d87a84f76a472e459a994a35fdd0b0ec28b';

/// See also [poolRepository].
@ProviderFor(poolRepository)
final poolRepositoryProvider = AutoDisposeProvider<PoolRepository>.internal(
  poolRepository,
  name: r'poolRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$poolRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PoolRepositoryRef = AutoDisposeProviderRef<PoolRepository>;
String _$getAllPoolsUseCaseHash() =>
    r'21fd2ef60f9a0e0a0bc3dde3c6bacc72de07ac3c';

/// See also [getAllPoolsUseCase].
@ProviderFor(getAllPoolsUseCase)
final getAllPoolsUseCaseProvider =
    AutoDisposeProvider<GetAllPoolsUseCase>.internal(
  getAllPoolsUseCase,
  name: r'getAllPoolsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllPoolsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllPoolsUseCaseRef = AutoDisposeProviderRef<GetAllPoolsUseCase>;
String _$getPoolUseCaseHash() => r'bdfa9fe21f0644b130b1061b0fa8f592bbbdf8a9';

/// See also [getPoolUseCase].
@ProviderFor(getPoolUseCase)
final getPoolUseCaseProvider = AutoDisposeProvider<GetPoolUseCase>.internal(
  getPoolUseCase,
  name: r'getPoolUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPoolUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPoolUseCaseRef = AutoDisposeProviderRef<GetPoolUseCase>;
String _$getPoolHash() => r'5199928a9737a95a6921edb0bdc7db1e9be9bd91';

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

/// See also [getPool].
@ProviderFor(getPool)
const getPoolProvider = GetPoolFamily();

/// See also [getPool].
class GetPoolFamily
    extends Family<AsyncValue<Either<DioException, PoolDataEntity>>> {
  /// See also [getPool].
  const GetPoolFamily();

  /// See also [getPool].
  GetPoolProvider call(
    String poolId,
    String poolName,
  ) {
    return GetPoolProvider(
      poolId,
      poolName,
    );
  }

  @override
  GetPoolProvider getProviderOverride(
    covariant GetPoolProvider provider,
  ) {
    return call(
      provider.poolId,
      provider.poolName,
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
  String? get name => r'getPoolProvider';
}

/// See also [getPool].
class GetPoolProvider
    extends AutoDisposeFutureProvider<Either<DioException, PoolDataEntity>> {
  /// See also [getPool].
  GetPoolProvider(
    String poolId,
    String poolName,
  ) : this._internal(
          (ref) => getPool(
            ref as GetPoolRef,
            poolId,
            poolName,
          ),
          from: getPoolProvider,
          name: r'getPoolProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPoolHash,
          dependencies: GetPoolFamily._dependencies,
          allTransitiveDependencies: GetPoolFamily._allTransitiveDependencies,
          poolId: poolId,
          poolName: poolName,
        );

  GetPoolProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.poolId,
    required this.poolName,
  }) : super.internal();

  final String poolId;
  final String poolName;

  @override
  Override overrideWith(
    FutureOr<Either<DioException, PoolDataEntity>> Function(GetPoolRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPoolProvider._internal(
        (ref) => create(ref as GetPoolRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        poolId: poolId,
        poolName: poolName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<DioException, PoolDataEntity>>
      createElement() {
    return _GetPoolProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPoolProvider &&
        other.poolId == poolId &&
        other.poolName == poolName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, poolId.hashCode);
    hash = _SystemHash.combine(hash, poolName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPoolRef
    on AutoDisposeFutureProviderRef<Either<DioException, PoolDataEntity>> {
  /// The parameter `poolId` of this provider.
  String get poolId;

  /// The parameter `poolName` of this provider.
  String get poolName;
}

class _GetPoolProviderElement extends AutoDisposeFutureProviderElement<
    Either<DioException, PoolDataEntity>> with GetPoolRef {
  _GetPoolProviderElement(super.provider);

  @override
  String get poolId => (origin as GetPoolProvider).poolId;
  @override
  String get poolName => (origin as GetPoolProvider).poolName;
}

String _$getAllPoolsHash() => r'860dbf04d4055ab959b35f3b5ecd50362d46aa00';

/// See also [getAllPools].
@ProviderFor(getAllPools)
final getAllPoolsProvider = AutoDisposeFutureProvider<
    Either<DioException, List<PoolResponseEntity>>>.internal(
  getAllPools,
  name: r'getAllPoolsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllPoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllPoolsRef = AutoDisposeFutureProviderRef<
    Either<DioException, List<PoolResponseEntity>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
