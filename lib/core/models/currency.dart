import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/currency.freezed.dart';
part 'generated/currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String code,
    required String symbol,
    @Default(2) int decimals,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
