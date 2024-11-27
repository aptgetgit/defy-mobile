import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/currency_rate.freezed.dart';
part 'generated/currency_rate.g.dart';

@freezed
class CurrencyRate with _$CurrencyRate {
  const CurrencyRate._();

  const factory CurrencyRate({
    required String id,
    required String code,
    required double rate,
    required DateTime lastUpdate,
  }) = _CurrencyRate;

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);

  // Domain logic
  double fromUsd(double amount) => amount * rate;
  double toUsd(double amount) => amount / rate;
  bool isStale() =>
      DateTime.now().difference(lastUpdate) > const Duration(minutes: 5);
}
