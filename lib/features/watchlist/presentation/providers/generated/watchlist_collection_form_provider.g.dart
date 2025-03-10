// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../watchlist_collection_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$collectionFormHash() => r'2e7975f04b5f9b9f63aca31a4ec624ef0625c3c9';

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

abstract class _$CollectionForm
    extends BuildlessAutoDisposeNotifier<CollectionFormState> {
  late final String? existingName;

  CollectionFormState build({
    String? existingName,
  });
}

/// See also [CollectionForm].
@ProviderFor(CollectionForm)
const collectionFormProvider = CollectionFormFamily();

/// See also [CollectionForm].
class CollectionFormFamily extends Family<CollectionFormState> {
  /// See also [CollectionForm].
  const CollectionFormFamily();

  /// See also [CollectionForm].
  CollectionFormProvider call({
    String? existingName,
  }) {
    return CollectionFormProvider(
      existingName: existingName,
    );
  }

  @override
  CollectionFormProvider getProviderOverride(
    covariant CollectionFormProvider provider,
  ) {
    return call(
      existingName: provider.existingName,
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
  String? get name => r'collectionFormProvider';
}

/// See also [CollectionForm].
class CollectionFormProvider extends AutoDisposeNotifierProviderImpl<
    CollectionForm, CollectionFormState> {
  /// See also [CollectionForm].
  CollectionFormProvider({
    String? existingName,
  }) : this._internal(
          () => CollectionForm()..existingName = existingName,
          from: collectionFormProvider,
          name: r'collectionFormProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionFormHash,
          dependencies: CollectionFormFamily._dependencies,
          allTransitiveDependencies:
              CollectionFormFamily._allTransitiveDependencies,
          existingName: existingName,
        );

  CollectionFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.existingName,
  }) : super.internal();

  final String? existingName;

  @override
  CollectionFormState runNotifierBuild(
    covariant CollectionForm notifier,
  ) {
    return notifier.build(
      existingName: existingName,
    );
  }

  @override
  Override overrideWith(CollectionForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionFormProvider._internal(
        () => create()..existingName = existingName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        existingName: existingName,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CollectionForm, CollectionFormState>
      createElement() {
    return _CollectionFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionFormProvider &&
        other.existingName == existingName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, existingName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CollectionFormRef on AutoDisposeNotifierProviderRef<CollectionFormState> {
  /// The parameter `existingName` of this provider.
  String? get existingName;
}

class _CollectionFormProviderElement extends AutoDisposeNotifierProviderElement<
    CollectionForm, CollectionFormState> with CollectionFormRef {
  _CollectionFormProviderElement(super.provider);

  @override
  String? get existingName => (origin as CollectionFormProvider).existingName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
