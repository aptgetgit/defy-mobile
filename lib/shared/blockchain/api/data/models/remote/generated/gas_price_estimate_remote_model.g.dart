// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../gas_price_estimate_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasPriceEstimateRemoteModel _$GasPriceEstimateRemoteModelFromJson(Map json) =>
    $checkedCreate(
      'GasPriceEstimateRemoteModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'gas_estimate',
            'deprioritized_gas_estimate',
            'prioritized_gas_estimate'
          ],
        );
        final val = GasPriceEstimateRemoteModel(
          gasEstimate:
              $checkedConvert('gas_estimate', (v) => (v as num).toInt()),
          deprioritizedGasEstimate: $checkedConvert(
              'deprioritized_gas_estimate',
              (v) =>
                  Option<int>.fromJson(v, (value) => (value as num).toInt())),
          prioritizedGasEstimate: $checkedConvert(
              'prioritized_gas_estimate',
              (v) =>
                  Option<int>.fromJson(v, (value) => (value as num).toInt())),
        );
        return val;
      },
      fieldKeyMap: const {
        'gasEstimate': 'gas_estimate',
        'deprioritizedGasEstimate': 'deprioritized_gas_estimate',
        'prioritizedGasEstimate': 'prioritized_gas_estimate'
      },
    );

const _$GasPriceEstimateRemoteModelFieldMap = <String, String>{
  'gasEstimate': 'gas_estimate',
  'deprioritizedGasEstimate': 'deprioritized_gas_estimate',
  'prioritizedGasEstimate': 'prioritized_gas_estimate',
};

abstract final class _$GasPriceEstimateRemoteModelJsonKeys {
  static const String gasEstimate = 'gas_estimate';
  static const String deprioritizedGasEstimate = 'deprioritized_gas_estimate';
  static const String prioritizedGasEstimate = 'prioritized_gas_estimate';
}

// ignore: unused_element
abstract class _$GasPriceEstimateRemoteModelPerFieldToJson {
  // ignore: unused_element
  static Object? gasEstimate(int instance) => instance;
  // ignore: unused_element
  static Object? deprioritizedGasEstimate(Option<int> instance) =>
      instance.toJson(
        (value) => value,
      );
  // ignore: unused_element
  static Object? prioritizedGasEstimate(Option<int> instance) =>
      instance.toJson(
        (value) => value,
      );
}

Map<String, dynamic> _$GasPriceEstimateRemoteModelToJson(
        GasPriceEstimateRemoteModel instance) =>
    <String, dynamic>{
      'gas_estimate': instance.gasEstimate,
      'deprioritized_gas_estimate': instance.deprioritizedGasEstimate.toJson(
        (value) => value,
      ),
      'prioritized_gas_estimate': instance.prioritizedGasEstimate.toJson(
        (value) => value,
      ),
    };

_$GasPriceEstimateRemoteModelImpl _$$GasPriceEstimateRemoteModelImplFromJson(
        Map json) =>
    $checkedCreate(
      r'_$GasPriceEstimateRemoteModelImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'gas_estimate',
            'deprioritized_gas_estimate',
            'prioritized_gas_estimate'
          ],
        );
        final val = _$GasPriceEstimateRemoteModelImpl(
          gasEstimate:
              $checkedConvert('gas_estimate', (v) => (v as num).toInt()),
          deprioritizedGasEstimate: $checkedConvert(
              'deprioritized_gas_estimate',
              (v) =>
                  Option<int>.fromJson(v, (value) => (value as num).toInt())),
          prioritizedGasEstimate: $checkedConvert(
              'prioritized_gas_estimate',
              (v) =>
                  Option<int>.fromJson(v, (value) => (value as num).toInt())),
        );
        return val;
      },
      fieldKeyMap: const {
        'gasEstimate': 'gas_estimate',
        'deprioritizedGasEstimate': 'deprioritized_gas_estimate',
        'prioritizedGasEstimate': 'prioritized_gas_estimate'
      },
    );

const _$$GasPriceEstimateRemoteModelImplFieldMap = <String, String>{
  'gasEstimate': 'gas_estimate',
  'deprioritizedGasEstimate': 'deprioritized_gas_estimate',
  'prioritizedGasEstimate': 'prioritized_gas_estimate',
};

abstract final class _$$GasPriceEstimateRemoteModelImplJsonKeys {
  static const String gasEstimate = 'gas_estimate';
  static const String deprioritizedGasEstimate = 'deprioritized_gas_estimate';
  static const String prioritizedGasEstimate = 'prioritized_gas_estimate';
}

// ignore: unused_element
abstract class _$$GasPriceEstimateRemoteModelImplPerFieldToJson {
  // ignore: unused_element
  static Object? gasEstimate(int instance) => instance;
  // ignore: unused_element
  static Object? deprioritizedGasEstimate(Option<int> instance) =>
      instance.toJson(
        (value) => value,
      );
  // ignore: unused_element
  static Object? prioritizedGasEstimate(Option<int> instance) =>
      instance.toJson(
        (value) => value,
      );
}
