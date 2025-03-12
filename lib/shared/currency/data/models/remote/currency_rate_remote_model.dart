// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../domain/entities/currency_rate.dart';

// part 'generated/currency_rate_remote_model.freezed.dart';
// part 'generated/currency_rate_remote_model.g.dart';

// @Freezed(toJson: true, fromJson: true)
// class CurrencyRateRemoteModel with _$CurrencyRateRemoteModel {
//   const factory CurrencyRateRemoteModel({
//     @JsonKey(name: 'date') required String date,
//     @JsonKey(name: 'usd') required Map<String, double> rates,
//   }) = _CurrencyRateRemoteModel;
//   const CurrencyRateRemoteModel._();

//   factory CurrencyRateRemoteModel.fromJson(Map<String, dynamic> json) =>
//       _$CurrencyRateRemoteModelFromJson(json);

//   List<CurrencyRate> toDomain() {
//     final DateTime dateTime = DateTime.parse(date);

//     return rates.entries
//         .map(
//           (MapEntry<String, double> entry) => CurrencyRate(
//             id: entry.key, // Using currency code as ID
//             code: entry.key.toUpperCase(),
//             rate: entry.value,
//             lastUpdate: dateTime,
//           ),
//         )
//         .toList();
//   }

//   static CurrencyRateRemoteModel fromDomain(List<CurrencyRate> rates) {
//     final DateTime now = DateTime.now();
//     return CurrencyRateRemoteModel(
//       date: now.toIso8601String(),
//       rates: <String, double>{
//         for (final CurrencyRate rate in rates)
//           rate.code.toLowerCase(): rate.rate,
//       },
//     );
//   }
// }
