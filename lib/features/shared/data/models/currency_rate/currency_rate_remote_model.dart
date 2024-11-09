import 'package:defy/features/shared/domain/entities/currency_rate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/currency_rate_remote_model.freezed.dart';
part 'generated/currency_rate_remote_model.g.dart';

@freezed
class CurrencyRateRemoteModel with _$CurrencyRateRemoteModel {
  const CurrencyRateRemoteModel._();
  
  const factory CurrencyRateRemoteModel({
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'usd') required Map<String, double> rates,
  }) = _CurrencyRateRemoteModel;

  factory CurrencyRateRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateRemoteModelFromJson(json);

  List<CurrencyRate> toDomain() {
    final dateTime = DateTime.parse(date);
    
    return rates.entries.map((entry) => CurrencyRate(
      id: entry.key,  // Using currency code as ID
      code: entry.key.toUpperCase(),
      rate: entry.value,
      lastUpdate: dateTime,
    )).toList();
  }

  static CurrencyRateRemoteModel fromDomain(List<CurrencyRate> rates) {
    final now = DateTime.now();
    return CurrencyRateRemoteModel(
      date: now.toIso8601String(),
      rates: {
        for (final rate in rates)
          rate.code.toLowerCase(): rate.rate
      },
    );
  }
}
