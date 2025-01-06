// ignore_for_file: public_member_api_docs, sort_constructors_first
class SwapTokenEntity {
  final String? tokenAddress;
  final String? name;
  final String? symbol;
  final String? logoUrl;
  final int? decimal;
  final int? amount;
  final bool? isSelected;
  SwapTokenEntity({
    required this.tokenAddress,
    required this.name,
    required this.symbol,
    required this.logoUrl,
    required this.decimal,
    required this.amount,
    this.isSelected = false,
  });

  SwapTokenEntity copyWith({
   String? tokenAddress,
   String? name,
   String? symbol,
   String? logoUrl,
   int? decimal,
   int? amount,
  bool? isSelected,
  }) {
    return SwapTokenEntity(
      tokenAddress : tokenAddress ?? this.tokenAddress,
      name : name ?? this.name,
      symbol : symbol ?? this.symbol,
      logoUrl : logoUrl ?? this.logoUrl,
      decimal : decimal ?? this.decimal,
      amount : amount ?? this.amount,
      isSelected : isSelected ?? this.isSelected,
    );
  }
}