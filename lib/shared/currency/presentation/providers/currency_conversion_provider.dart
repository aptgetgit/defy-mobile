import 'package:defy/core/di/providers/currency/preferred_currency_provider.dart';
import 'package:defy/shared/currency/presentation/providers/currency_rate_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/currency_conversion_provider.g.dart';

@riverpod
double convertToPreferredCurrency(
  Ref ref,
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
