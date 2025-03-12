// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../../../domain/entities/gas_price_estimate.dart';

// part 'generated/gas_price_estimate_remote_model.freezed.dart';

// @Freezed(fromJson: true)
// class GasPriceEstimateRemoteModel with _$GasPriceEstimateRemoteModel {
//   const factory GasPriceEstimateRemoteModel({
//     required int gasEstimate,
//     int? deprioritizedGasEstimate,
//     int? prioritizedGasEstimate,
//   }) = _GasPriceEstimateRemoteModel;

//   factory GasPriceEstimateRemoteModel.fromDomain(GasPriceEstimate estimate) =>
//       GasPriceEstimateRemoteModel(
//         gasEstimate: estimate.gasEstimate.toInt(),
//         deprioritizedGasEstimate: estimate.deprioritizedGasEstimate?.toInt(),
//         prioritizedGasEstimate: estimate.prioritizedGasEstimate?.toInt(),
//       );

//   factory GasPriceEstimateRemoteModel.fromJson(Map<String, dynamic> json) =>
//       _$GasPriceEstimateRemoteModelFromJson(json);

//   const GasPriceEstimateRemoteModel._();

//   GasPriceEstimate toDomain() => GasPriceEstimate(
//         gasEstimate: BigInt.from(gasEstimate),
//         deprioritizedGasEstimate: deprioritizedGasEstimate != null
//             ? BigInt.from(deprioritizedGasEstimate!)
//             : null,
//         prioritizedGasEstimate: prioritizedGasEstimate != null
//             ? BigInt.from(prioritizedGasEstimate!)
//             : null,
//       );
// }
