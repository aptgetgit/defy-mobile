class Token {
  Token({
    required this.imagePath,
    required this.name,
    required this.balance,
    required this.amount,
    required this.currency,
    required this.percentageChange,
  });
  final String imagePath;
  final String name;
  final double balance;
  final double amount;
  final String currency;
  final double percentageChange;
}