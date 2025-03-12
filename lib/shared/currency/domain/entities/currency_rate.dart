// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'generated/currency_rate.freezed.dart';
// part 'generated/currency_rate.g.dart';

// @Freezed(toJson: true, fromJson: true)
// class CurrencyRate with _$CurrencyRate {
//   const factory CurrencyRate({
//     required String id,
//     required String code,
//     required double rate,
//     required DateTime lastUpdate,
//   }) = _CurrencyRate;
//   const CurrencyRate._();

//   factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
//       _$CurrencyRateFromJson(json);

//   // Domain logic
//   double fromUsd(double amount) => amount * rate;
//   double toUsd(double amount) => amount / rate;
//   bool isStale() =>
//       DateTime.now().difference(lastUpdate) > const Duration(minutes: 5);
// }
