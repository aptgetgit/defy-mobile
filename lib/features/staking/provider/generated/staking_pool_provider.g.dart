// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../staking_pool_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stakingPoolRepositoryHash() =>
    r'2403e3541119638bee5a67506e9f2446b9e96855';

/// See also [stakingPoolRepository].
@ProviderFor(stakingPoolRepository)
final stakingPoolRepositoryProvider =
    AutoDisposeProvider<StakingPoolRepository>.internal(
  stakingPoolRepository,
  name: r'stakingPoolRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stakingPoolRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StakingPoolRepositoryRef
    = AutoDisposeProviderRef<StakingPoolRepository>;
String _$stakingPoolsUseCaseHash() =>
    r'50fc53152acbb9dbda72658251cf19c08cc9f9ec';

/// See also [stakingPoolsUseCase].
@ProviderFor(stakingPoolsUseCase)
final stakingPoolsUseCaseProvider =
    AutoDisposeProvider<StakingPoolsUseCase>.internal(
  stakingPoolsUseCase,
  name: r'stakingPoolsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stakingPoolsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StakingPoolsUseCaseRef = AutoDisposeProviderRef<StakingPoolsUseCase>;
String _$getStakingPoolsHash() => r'dec86fd7d8426a40105ced87d957ea2c35e4f32d';

/// See also [getStakingPools].
@ProviderFor(getStakingPools)
final getStakingPoolsProvider = AutoDisposeFutureProvider<
    Either<DioException, List<StakingPoolEntity>>>.internal(
  getStakingPools,
  name: r'getStakingPoolsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getStakingPoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetStakingPoolsRef = AutoDisposeFutureProviderRef<
    Either<DioException, List<StakingPoolEntity>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
