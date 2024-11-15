// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../swap_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$swapDataRepositoryHash() =>
    r'09ae691856b73fc84cb23fc5b9156fbe2ae46785';

/// See also [swapDataRepository].
@ProviderFor(swapDataRepository)
final swapDataRepositoryProvider =
    AutoDisposeProvider<SwapDataRepository>.internal(
  swapDataRepository,
  name: r'swapDataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$swapDataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SwapDataRepositoryRef = AutoDisposeProviderRef<SwapDataRepository>;
String _$swapDataUsecaseHash() => r'07c576cfc0b71ad63e7b4fd3ac1a779dd5141047';

/// See also [swapDataUsecase].
@ProviderFor(swapDataUsecase)
final swapDataUsecaseProvider = AutoDisposeProvider<SwapDataUsecase>.internal(
  swapDataUsecase,
  name: r'swapDataUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$swapDataUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SwapDataUsecaseRef = AutoDisposeProviderRef<SwapDataUsecase>;
String _$swapDataHash() => r'57529c10e4741907d60e53683d140d5bcc507299';

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

abstract class _$SwapData
    extends BuildlessAutoDisposeAsyncNotifier<SwapEntity?> {
  late final String fromToken;
  late final String toToken;
  late final int amount;

  FutureOr<SwapEntity?> build({
    required String fromToken,
    required String toToken,
    required int amount,
  });
}

/// See also [SwapData].
@ProviderFor(SwapData)
const swapDataProvider = SwapDataFamily();

/// See also [SwapData].
class SwapDataFamily extends Family<AsyncValue<SwapEntity?>> {
  /// See also [SwapData].
  const SwapDataFamily();

  /// See also [SwapData].
  SwapDataProvider call({
    required String fromToken,
    required String toToken,
    required int amount,
  }) {
    return SwapDataProvider(
      fromToken: fromToken,
      toToken: toToken,
      amount: amount,
    );
  }

  @override
  SwapDataProvider getProviderOverride(
    covariant SwapDataProvider provider,
  ) {
    return call(
      fromToken: provider.fromToken,
      toToken: provider.toToken,
      amount: provider.amount,
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
  String? get name => r'swapDataProvider';
}

/// See also [SwapData].
class SwapDataProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SwapData, SwapEntity?> {
  /// See also [SwapData].
  SwapDataProvider({
    required String fromToken,
    required String toToken,
    required int amount,
  }) : this._internal(
          () => SwapData()
            ..fromToken = fromToken
            ..toToken = toToken
            ..amount = amount,
          from: swapDataProvider,
          name: r'swapDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$swapDataHash,
          dependencies: SwapDataFamily._dependencies,
          allTransitiveDependencies: SwapDataFamily._allTransitiveDependencies,
          fromToken: fromToken,
          toToken: toToken,
          amount: amount,
        );

  SwapDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromToken,
    required this.toToken,
    required this.amount,
  }) : super.internal();

  final String fromToken;
  final String toToken;
  final int amount;

  @override
  FutureOr<SwapEntity?> runNotifierBuild(
    covariant SwapData notifier,
  ) {
    return notifier.build(
      fromToken: fromToken,
      toToken: toToken,
      amount: amount,
    );
  }

  @override
  Override overrideWith(SwapData Function() create) {
    return ProviderOverride(
      origin: this,
      override: SwapDataProvider._internal(
        () => create()
          ..fromToken = fromToken
          ..toToken = toToken
          ..amount = amount,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromToken: fromToken,
        toToken: toToken,
        amount: amount,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SwapData, SwapEntity?>
      createElement() {
    return _SwapDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SwapDataProvider &&
        other.fromToken == fromToken &&
        other.toToken == toToken &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromToken.hashCode);
    hash = _SystemHash.combine(hash, toToken.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SwapDataRef on AutoDisposeAsyncNotifierProviderRef<SwapEntity?> {
  /// The parameter `fromToken` of this provider.
  String get fromToken;

  /// The parameter `toToken` of this provider.
  String get toToken;

  /// The parameter `amount` of this provider.
  int get amount;
}

class _SwapDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SwapData, SwapEntity?>
    with SwapDataRef {
  _SwapDataProviderElement(super.provider);

  @override
  String get fromToken => (origin as SwapDataProvider).fromToken;
  @override
  String get toToken => (origin as SwapDataProvider).toToken;
  @override
  int get amount => (origin as SwapDataProvider).amount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
