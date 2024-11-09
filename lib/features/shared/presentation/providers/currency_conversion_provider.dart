import 'package:defy/core/providers/preferred_currency_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import './currency_rate_notifier_provider.dart';

part 'generated/currency_conversion_provider.g.dart';

@riverpod
double convertToPreferredCurrency(
  ConvertToPreferredCurrencyRef ref,
  double amount,
  String fromCurrency,
) {
  final notifier = ref.watch(currencyRateNotifierProvider.notifier);
  final preferredCurrency = ref.watch(preferredCurrencyNotifierProvider);
  
  return notifier.convertCurrency(
    amount: amount,
    from: fromCurrency,
    to: preferredCurrency.code,
  );
}