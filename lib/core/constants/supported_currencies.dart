import 'package:defy/core/models/currency.dart';

class SupportedCurrencies {
  static const btc = Currency(
    code: 'btc',
    symbol: '₿',
    decimals: 8,
  );

  static const apt = Currency(
    code: 'apt',
    symbol: 'APT',
    decimals: 8,
  );

  static const usd = Currency(
    code: 'usd',
    symbol: '\$',
    decimals: 2,
  );

  static const eur = Currency(
    code: 'eur',
    symbol: '€',
    decimals: 2,
  );

  static const inr = Currency(
    code: 'inr',
    symbol: '₹',
    decimals: 2,
  );

  static const jpy = Currency(
    code: 'jpy',
    symbol: '¥',
    decimals: 0,
  );

  static const all = [
    btc,
    apt,
    usd,
    eur,
    inr,
    jpy,
  ];

  static bool isSupported(String? code) {
    if (code == null) return false;
    return all.any((currency) => currency.code == code.toLowerCase());
  }

  static Currency? fromCode(String? code) {
    if (code == null) return null;
    return all.firstWhere(
      (currency) => currency.code.toUpperCase() == code.toUpperCase(),
      orElse: () => throw ArgumentError('Unsupported currency code: $code'),
    );
  }
}
