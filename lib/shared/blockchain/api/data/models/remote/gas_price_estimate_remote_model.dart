import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/gas_price_estimate.dart';

part 'generated/gas_price_estimate_remote_model.freezed.dart';
part 'generated/gas_price_estimate_remote_model.g.dart';

@Freezed(fromJson: true)
@JsonSerializable(fieldRename: FieldRename.snake)
class GasPriceEstimateRemoteModel with _$GasPriceEstimateRemoteModel {
  const factory GasPriceEstimateRemoteModel({
    required int gasEstimate,
    required Option<int> deprioritizedGasEstimate,
    required Option<int> prioritizedGasEstimate,
  }) = _GasPriceEstimateRemoteModel;

  factory GasPriceEstimateRemoteModel.fromDomain(GasPriceEstimate estimate) =>
      GasPriceEstimateRemoteModel(
        gasEstimate: estimate.gasEstimate.toInt(),
        deprioritizedGasEstimate: estimate.deprioritizedGasEstimate.map(
          (BigInt e) => e.toInt(),
        ),
        prioritizedGasEstimate: estimate.prioritizedGasEstimate.map(
          (BigInt e) => e.toInt(),
        ),
      );

  factory GasPriceEstimateRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$GasPriceEstimateRemoteModelFromJson(json);

  const GasPriceEstimateRemoteModel._();

  GasPriceEstimate toDomain() => GasPriceEstimate(
    gasEstimate: BigInt.from(gasEstimate),
    deprioritizedGasEstimate: deprioritizedGasEstimate.map(BigInt.from),
    prioritizedGasEstimate: prioritizedGasEstimate.map(BigInt.from),
  );
}
