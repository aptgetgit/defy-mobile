// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency_conversion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$convertToPreferredCurrencyHash() =>
    r'fda6a0ccd12c49f8a653305481e4223cda25e226';

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

/// See also [convertToPreferredCurrency].
@ProviderFor(convertToPreferredCurrency)
const convertToPreferredCurrencyProvider = ConvertToPreferredCurrencyFamily();

/// See also [convertToPreferredCurrency].
class ConvertToPreferredCurrencyFamily extends Family<double> {
  /// See also [convertToPreferredCurrency].
  const ConvertToPreferredCurrencyFamily();

  /// See also [convertToPreferredCurrency].
  ConvertToPreferredCurrencyProvider call(
    double amount,
    String fromCurrency,
  ) {
    return ConvertToPreferredCurrencyProvider(
      amount,
      fromCurrency,
    );
  }

  @override
  ConvertToPreferredCurrencyProvider getProviderOverride(
    covariant ConvertToPreferredCurrencyProvider provider,
  ) {
    return call(
      provider.amount,
      provider.fromCurrency,
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
  String? get name => r'convertToPreferredCurrencyProvider';
}

/// See also [convertToPreferredCurrency].
class ConvertToPreferredCurrencyProvider extends AutoDisposeProvider<double> {
  /// See also [convertToPreferredCurrency].
  ConvertToPreferredCurrencyProvider(
    double amount,
    String fromCurrency,
  ) : this._internal(
          (ref) => convertToPreferredCurrency(
            ref as ConvertToPreferredCurrencyRef,
            amount,
            fromCurrency,
          ),
          from: convertToPreferredCurrencyProvider,
          name: r'convertToPreferredCurrencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$convertToPreferredCurrencyHash,
          dependencies: ConvertToPreferredCurrencyFamily._dependencies,
          allTransitiveDependencies:
              ConvertToPreferredCurrencyFamily._allTransitiveDependencies,
          amount: amount,
          fromCurrency: fromCurrency,
        );

  ConvertToPreferredCurrencyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.amount,
    required this.fromCurrency,
  }) : super.internal();

  final double amount;
  final String fromCurrency;

  @override
  Override overrideWith(
    double Function(ConvertToPreferredCurrencyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConvertToPreferredCurrencyProvider._internal(
        (ref) => create(ref as ConvertToPreferredCurrencyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        amount: amount,
        fromCurrency: fromCurrency,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<double> createElement() {
    return _ConvertToPreferredCurrencyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConvertToPreferredCurrencyProvider &&
        other.amount == amount &&
        other.fromCurrency == fromCurrency;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, fromCurrency.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConvertToPreferredCurrencyRef on AutoDisposeProviderRef<double> {
  /// The parameter `amount` of this provider.
  double get amount;

  /// The parameter `fromCurrency` of this provider.
  String get fromCurrency;
}

class _ConvertToPreferredCurrencyProviderElement
    extends AutoDisposeProviderElement<double>
    with ConvertToPreferredCurrencyRef {
  _ConvertToPreferredCurrencyProviderElement(super.provider);

  @override
  double get amount => (origin as ConvertToPreferredCurrencyProvider).amount;
  @override
  String get fromCurrency =>
      (origin as ConvertToPreferredCurrencyProvider).fromCurrency;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
