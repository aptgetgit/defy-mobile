import '../../../domain/entities/currency.dart';

class SupportedCurrencies {
  const SupportedCurrencies._();

  static const Currency btc = Currency(
    code: 'btc',
    symbol: '₿',
    decimals: 8,
  );

  static const Currency apt = Currency(
    code: 'apt',
    symbol: 'APT',
    decimals: 8,
  );

  static const Currency usd = Currency(
    code: 'usd',
    symbol: r'$',
  );

  static const Currency eur = Currency(
    code: 'eur',
    symbol: '€',
  );

  static const Currency inr = Currency(
    code: 'inr',
    symbol: '₹',
  );

  static const Currency jpy = Currency(
    code: 'jpy',
    symbol: '¥',
    decimals: 0,
  );

  static const List<Currency> all = <Currency>[
    btc,
    apt,
    usd,
    eur,
    inr,
    jpy,
  ];

  static bool isSupported(String? code) {
    if (code == null) {
      return false;
    }
    return all.any((Currency currency) => currency.code == code.toLowerCase());
  }

  static Currency? fromCode(String? code) {
    if (code == null) {
      return null;
    }
    return all.firstWhere(
      (Currency currency) => currency.code.toUpperCase() == code.toUpperCase(),
      orElse: () => throw ArgumentError('Unsupported currency code: $code'),
    );
  }
}
