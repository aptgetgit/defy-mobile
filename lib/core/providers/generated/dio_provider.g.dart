// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioInitializerHash() => r'69acf4b3ee5dc88c9f404173bf6f1ad0221dd65e';

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

String _$baseDioServiceHash() => r'94b3bac838a220ddd9601e74ee4c1e2cc27938cd';

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

typedef BaseDioServiceRef = ProviderRef<Dio>;
String _$kratosDioServiceHash() => r'8c9481d41c63f8275d5eebbda1245386a85f76cb';

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

typedef KratosDioServiceRef = ProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
