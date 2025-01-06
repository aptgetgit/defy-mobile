// pool_response_model.dart

import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class PoolResponseModel {
  final String? id;
  final bool? isEnabled;
  final List<String>? protocols;
  final String? apr;
  final String? nameId;
  final String? description;
  final List<String>? stakeToken;
  final String? totalValueLocked;
  final String? tvlToken;
  final String? withdrawalSlippage;
  final String? name;
  final String? displayName;
  final String? strategyType;
  final List<String>? rewardToken;
  final String? positionToken;
  final List<String>? feeToken;
  final String? depositFee;
  final String? risk;
  final String? withdrawalFee;
  final String? depositSwapFee;
  final String? withdrawalSwapFee;
  final String? stakers;
  final String? liquidityType;
  final List<String>? weight;
  final String? aprAvg;
  final String? volume24h;
  final String? fee24h;

  const PoolResponseModel({
    this.id,
    this.isEnabled,
    this.protocols,
    this.apr,
    this.nameId,
    this.description,
    this.stakeToken,
    this.totalValueLocked,
    this.tvlToken,
    this.withdrawalSlippage,
    this.name,
    this.displayName,
    this.strategyType,
    this.rewardToken,
    this.positionToken,
    this.feeToken,
    this.depositFee,
    this.risk,
    this.withdrawalFee,
    this.depositSwapFee,
    this.withdrawalSwapFee,
    this.stakers,
    this.liquidityType,
    this.weight,
    this.aprAvg,
    this.volume24h,
    this.fee24h,
  });

  factory PoolResponseModel.fromJson(Map<String, dynamic> json) {
    return PoolResponseModel(
      id: json['id'] as String?,
      isEnabled: json['isEnabled'] as bool?,
      protocols: (json['protocols'] as List<dynamic>?)?.cast<String>(),
      apr: json['apr']?.toString(),
      nameId: json['nameId'] as String?,
      description: json['description'] as String?,
      stakeToken: (json['stakeToken'] as List<dynamic>?)?.cast<String>(),
      totalValueLocked: json['totalValueLocked']?.toString(),
      tvlToken: json['tvlToken']?.toString(),
      withdrawalSlippage: json['withdrawalSlippage']?.toString(),
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      strategyType: json['strategyType'] as String?,
      rewardToken: _parseRewardToken(json['rewardToken']),
      positionToken: json['positionToken'] as String?,
      feeToken: _parseFeeToken(json['feeToken']),
      depositFee: json['depositFee']?.toString(),
      risk: json['risk'] as String?,
      withdrawalFee: json['withdrawalFee']?.toString(),
      depositSwapFee: json['depositSwapFee']?.toString(),
      withdrawalSwapFee: json['withdrawalSwapFee']?.toString(),
      stakers: json['stakers']?.toString(),
      liquidityType: json['liquidityType'] as String?,
      weight: (json['weight'] as List<dynamic>?)?.cast<String>(),
      aprAvg: json['aprAvg']?.toString(),
      volume24h: json['volume24h']?.toString(),
      fee24h: json['fee24h']?.toString(),
    );
  }

  static List<String>? _parseFeeToken(dynamic value) {
    if (value == null || value == '') {
      return [];
    }
    if (value is String) {
      return [value];
    }
    if (value is List) {
      return value.map((e) => e.toString()).toList();
    }
    return [];
  }

  static List<String> _parseRewardToken(dynamic value) {
    if (value == null) return [];
    if (value is String) {
      return value.isEmpty ? [] : [value];
    } else if (value is List) {
      return List<String>.from(value.map((e) => e?.toString() ?? ''));
    } else {
      return [];
    }
  }

  PoolResponseEntity toEntity() {
    return PoolResponseEntity(
      id: id,
      isEnabled: isEnabled,
      protocols: protocols,
      apr: apr,
      nameId: nameId,
      description: description,
      stakeToken: stakeToken,
      totalValueLocked: totalValueLocked,
      tvlToken: tvlToken,
      withdrawalSlippage: withdrawalSlippage,
      name: name,
      displayName: displayName,
      strategyType: strategyType,
      rewardToken: rewardToken,
      positionToken: positionToken,
      feeToken: feeToken,
      depositFee: depositFee,
      risk: risk,
      withdrawalFee: withdrawalFee,
      depositSwapFee: depositSwapFee,
      withdrawalSwapFee: withdrawalSwapFee,
      stakers: stakers,
      liquidityType: liquidityType,
      weight: weight,
      aprAvg: aprAvg,
      volume24h: volume24h,
      fee24h: fee24h,
    );
  }

  factory PoolResponseModel.fromEntity(PoolResponseEntity entity) {
    return PoolResponseModel(
      id: entity.id,
      isEnabled: entity.isEnabled,
      protocols: entity.protocols,
      apr: entity.apr,
      nameId: entity.nameId,
      description: entity.description,
      stakeToken: entity.stakeToken,
      totalValueLocked: entity.totalValueLocked,
      tvlToken: entity.tvlToken,
      withdrawalSlippage: entity.withdrawalSlippage,
      name: entity.name,
      displayName: entity.displayName,
      strategyType: entity.strategyType,
      rewardToken: entity.rewardToken,
      positionToken: entity.positionToken,
      feeToken: entity.feeToken,
      depositFee: entity.depositFee,
      risk: entity.risk,
      withdrawalFee: entity.withdrawalFee,
      depositSwapFee: entity.depositSwapFee,
      withdrawalSwapFee: entity.withdrawalSwapFee,
      stakers: entity.stakers,
      liquidityType: entity.liquidityType,
      weight: entity.weight,
      aprAvg: entity.aprAvg,
      volume24h: entity.volume24h,
      fee24h: entity.fee24h,
    );
  }
}
