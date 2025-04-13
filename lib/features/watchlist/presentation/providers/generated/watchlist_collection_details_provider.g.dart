// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../watchlist_collection_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchlistCollectionDetailsHash() =>
    r'a5e24162b996ec5933c5eadba5137648a3181875';

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

abstract class _$WatchlistCollectionDetails
    extends BuildlessAutoDisposeNotifier<CollectionDetailsState> {
  late final String collectionId;

  CollectionDetailsState build(
    String collectionId,
  );
}

/// See also [WatchlistCollectionDetails].
@ProviderFor(WatchlistCollectionDetails)
const watchlistCollectionDetailsProvider = WatchlistCollectionDetailsFamily();

/// See also [WatchlistCollectionDetails].
class WatchlistCollectionDetailsFamily extends Family<CollectionDetailsState> {
  /// See also [WatchlistCollectionDetails].
  const WatchlistCollectionDetailsFamily();

  /// See also [WatchlistCollectionDetails].
  WatchlistCollectionDetailsProvider call(
    String collectionId,
  ) {
    return WatchlistCollectionDetailsProvider(
      collectionId,
    );
  }

  @override
  WatchlistCollectionDetailsProvider getProviderOverride(
    covariant WatchlistCollectionDetailsProvider provider,
  ) {
    return call(
      provider.collectionId,
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
  String? get name => r'watchlistCollectionDetailsProvider';
}

/// See also [WatchlistCollectionDetails].
class WatchlistCollectionDetailsProvider
    extends AutoDisposeNotifierProviderImpl<WatchlistCollectionDetails,
        CollectionDetailsState> {
  /// See also [WatchlistCollectionDetails].
  WatchlistCollectionDetailsProvider(
    String collectionId,
  ) : this._internal(
          () => WatchlistCollectionDetails()..collectionId = collectionId,
          from: watchlistCollectionDetailsProvider,
          name: r'watchlistCollectionDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchlistCollectionDetailsHash,
          dependencies: WatchlistCollectionDetailsFamily._dependencies,
          allTransitiveDependencies:
              WatchlistCollectionDetailsFamily._allTransitiveDependencies,
          collectionId: collectionId,
        );

  WatchlistCollectionDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final String collectionId;

  @override
  CollectionDetailsState runNotifierBuild(
    covariant WatchlistCollectionDetails notifier,
  ) {
    return notifier.build(
      collectionId,
    );
  }

  @override
  Override overrideWith(WatchlistCollectionDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: WatchlistCollectionDetailsProvider._internal(
        () => create()..collectionId = collectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<WatchlistCollectionDetails,
      CollectionDetailsState> createElement() {
    return _WatchlistCollectionDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchlistCollectionDetailsProvider &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchlistCollectionDetailsRef
    on AutoDisposeNotifierProviderRef<CollectionDetailsState> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _WatchlistCollectionDetailsProviderElement
    extends AutoDisposeNotifierProviderElement<WatchlistCollectionDetails,
        CollectionDetailsState> with WatchlistCollectionDetailsRef {
  _WatchlistCollectionDetailsProviderElement(super.provider);

  @override
  String get collectionId =>
      (origin as WatchlistCollectionDetailsProvider).collectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
