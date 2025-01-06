// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioInitializerHash() => r'd5fef7e73fb89119b61097e6de73f7aa406add2d';

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

/// See also [dioInitializer].
@ProviderFor(dioInitializer)
const dioInitializerProvider = DioInitializerFamily();

/// See also [dioInitializer].
class DioInitializerFamily extends Family<Dio> {
  /// See also [dioInitializer].
  const DioInitializerFamily();

  /// See also [dioInitializer].
  DioInitializerProvider call(
    String baseUrl,
  ) {
    return DioInitializerProvider(
      baseUrl,
    );
  }

  @override
  DioInitializerProvider getProviderOverride(
    covariant DioInitializerProvider provider,
  ) {
    return call(
      provider.baseUrl,
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
  String? get name => r'dioInitializerProvider';
}

/// See also [dioInitializer].
class DioInitializerProvider extends Provider<Dio> {
  /// See also [dioInitializer].
  DioInitializerProvider(
    String baseUrl,
  ) : this._internal(
          (ref) => dioInitializer(
            ref as DioInitializerRef,
            baseUrl,
          ),
          from: dioInitializerProvider,
          name: r'dioInitializerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dioInitializerHash,
          dependencies: DioInitializerFamily._dependencies,
          allTransitiveDependencies:
              DioInitializerFamily._allTransitiveDependencies,
          baseUrl: baseUrl,
        );

  DioInitializerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.baseUrl,
  }) : super.internal();

  final String baseUrl;

  @override
  Override overrideWith(
    Dio Function(DioInitializerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DioInitializerProvider._internal(
        (ref) => create(ref as DioInitializerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  ProviderElement<Dio> createElement() {
    return _DioInitializerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DioInitializerProvider && other.baseUrl == baseUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, baseUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DioInitializerRef on ProviderRef<Dio> {
  /// The parameter `baseUrl` of this provider.
  String get baseUrl;
}

class _DioInitializerProviderElement extends ProviderElement<Dio>
    with DioInitializerRef {
  _DioInitializerProviderElement(super.provider);

  @override
  String get baseUrl => (origin as DioInitializerProvider).baseUrl;
}

String _$sessionTokenInterceptorHash() =>
    r'03441f20b0eab46cc22b55bf50c54771455b2148';

/// See also [sessionTokenInterceptor].
@ProviderFor(sessionTokenInterceptor)
final sessionTokenInterceptorProvider =
    Provider<SessionTokenInterceptor>.internal(
  sessionTokenInterceptor,
  name: r'sessionTokenInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionTokenInterceptorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SessionTokenInterceptorRef = ProviderRef<SessionTokenInterceptor>;
String _$baseDioServiceHash() => r'919ace0a7339d40152e8b0d33f78420453c458d3';

/// See also [baseDioService].
@ProviderFor(baseDioService)
final baseDioServiceProvider = Provider<Dio>.internal(
  baseDioService,
  name: r'baseDioServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$baseDioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BaseDioServiceRef = ProviderRef<Dio>;
String _$kratosDioServiceHash() => r'567f1d16e62e65f557deb85cfbd608be706eb1c6';

/// See also [kratosDioService].
@ProviderFor(kratosDioService)
final kratosDioServiceProvider = Provider<Dio>.internal(
  kratosDioService,
  name: r'kratosDioServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kratosDioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef KratosDioServiceRef = ProviderRef<Dio>;
String _$yieldAggregatorDioServiceHash() =>
    r'fd961382a9d8b7302cd67d9b4d9ee4e8a70891ac';

/// See also [yieldAggregatorDioService].
@ProviderFor(yieldAggregatorDioService)
final yieldAggregatorDioServiceProvider = Provider<Dio>.internal(
  yieldAggregatorDioService,
  name: r'yieldAggregatorDioServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$yieldAggregatorDioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YieldAggregatorDioServiceRef = ProviderRef<Dio>;
String _$stakingDioServiceHash() => r'08eff29f0a5d525c85e737e4c5166323db89127b';

/// See also [stakingDioService].
@ProviderFor(stakingDioService)
final stakingDioServiceProvider = Provider<Dio>.internal(
  stakingDioService,
  name: r'stakingDioServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stakingDioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StakingDioServiceRef = ProviderRef<Dio>;
String _$lendBorrowDioServiceHash() =>
    r'66e80181fbf5a9b718a13bfffa1180362817a0d5';

/// See also [lendBorrowDioService].
@ProviderFor(lendBorrowDioService)
final lendBorrowDioServiceProvider = Provider<Dio>.internal(
  lendBorrowDioService,
  name: r'lendBorrowDioServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lendBorrowDioServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LendBorrowDioServiceRef = ProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
