class Token {

  Token({
    required this.name,
    required this.symbol,
    required this.icon,
    required this.amount,
    required this.usdValue,
  });
  final String name;
  final String symbol;
  final String icon;
  final double amount;
  final double usdValue;
}
