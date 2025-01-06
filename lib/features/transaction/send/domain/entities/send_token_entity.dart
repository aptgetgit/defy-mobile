class SendTokenEntity {
  final String? name;
  final String? symbol;
  final int? decimal;
  final int? amount;
  final String? assetType;
  bool isSelected;
  SendTokenEntity({
    required this.name,
    required this.symbol,
    required this.decimal,
    required this.amount,
    required this.assetType,
    this.isSelected = false,
  });

  SendTokenEntity copyWith({
    String? name,
    String? symbol,
    int? decimal,
    int? amount,
    String? assetType,
    bool isSelected = false,
  }) {
    return SendTokenEntity(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        decimal: decimal ?? this.decimal,
        amount: amount ?? this.amount,
        assetType: assetType ?? this.assetType,
        isSelected: isSelected,
        );
  }
}
