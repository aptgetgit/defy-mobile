// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lend_pool_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lendPoolRepositoryHash() =>
    r'101d27fdc36c310e412844a0832d0a4282625fcf';

/// See also [lendPoolRepository].
@ProviderFor(lendPoolRepository)
final lendPoolRepositoryProvider =
    AutoDisposeProvider<LendPoolRepository>.internal(
  lendPoolRepository,
  name: r'lendPoolRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lendPoolRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LendPoolRepositoryRef = AutoDisposeProviderRef<LendPoolRepository>;
String _$getLendPoolsUseCaseHash() =>
    r'e641764ae68d64f641f5526601d8e83ffdc3543d';

/// See also [getLendPoolsUseCase].
@ProviderFor(getLendPoolsUseCase)
final getLendPoolsUseCaseProvider =
    AutoDisposeProvider<GetLendPoolsUseCase>.internal(
  getLendPoolsUseCase,
  name: r'getLendPoolsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getLendPoolsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLendPoolsUseCaseRef = AutoDisposeProviderRef<GetLendPoolsUseCase>;
String _$getLendPoolsHash() => r'd2c847df6d86b42933fd2f10e23eba7cf483e3d6';

/// See also [getLendPools].
@ProviderFor(getLendPools)
final getLendPoolsProvider = AutoDisposeFutureProvider<
    Either<DioException, Map<String, LendPoolEntity>>>.internal(
  getLendPools,
  name: r'getLendPoolsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLendPoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLendPoolsRef = AutoDisposeFutureProviderRef<
    Either<DioException, Map<String, LendPoolEntity>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
