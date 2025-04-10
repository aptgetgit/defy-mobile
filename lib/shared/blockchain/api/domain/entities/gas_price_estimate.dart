import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/gas_price_estimate.freezed.dart';

@freezed
class GasPriceEstimate with _$GasPriceEstimate {
  const factory GasPriceEstimate({
    required BigInt gasEstimate,
    required Option<BigInt> deprioritizedGasEstimate,
    required Option<BigInt> prioritizedGasEstimate,
  }) = _GasPriceEstimate;
}
