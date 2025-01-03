class LendBorrowModel {
  final String name;
  final String asset;
  final String apy;
  final String value;
  final String fee;

  LendBorrowModel({
    required this.name,
    required this.asset,
    required this.apy,
    required this.value,
    required this.fee,
  });

  LendBorrowModel copyWith({
    String? name,
    String? asset,
    String? apy,
    String? value,
    String? fee,
  }) {
    return LendBorrowModel(
      name: name ?? this.name,
      asset: asset ?? this.asset,
      apy: apy ?? this.apy,
      value: value ?? this.value,
      fee: fee ?? this.fee,
    );
  }
}
