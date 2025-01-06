class StakingModel {
  final String name;
  final String asset;
  final String fee;
  final String apy;
  final String lockupPeriod;

  StakingModel({
    required this.name,
    required this.asset,
    required this.fee,
    required this.apy,
    required this.lockupPeriod,
  });

  StakingModel copyWith({
    String? name,
    String? asset,
    String? fee,
    String? apy,
    String? lockupPeriod,
  }) {
    return StakingModel(
      name: name ?? this.name,
      asset: asset ?? this.asset,
      fee: fee ?? this.fee,
      apy: apy ?? this.apy,
      lockupPeriod: lockupPeriod ?? this.lockupPeriod,
    );
  }
}
