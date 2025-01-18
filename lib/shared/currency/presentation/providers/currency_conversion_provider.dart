import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/currency.dart';
import 'currency_rate_notifier_provider.dart';
import 'preferred_currency_provider.dart';

part 'generated/currency_conversion_provider.g.dart';

@riverpod
double convertToPreferredCurrency(
  Ref ref,
  double amount,
  String fromCurrency,
) {
  final CurrencyRateNotifier notifier =
      ref.watch(currencyRateNotifierProvider.notifier);
  final Currency preferredCurrency =
      ref.watch(preferredCurrencyNotifierProvider);

  return notifier.convertCurrency(
    amount: amount,
    from: fromCurrency,
    to: preferredCurrency.code,
  );
}
