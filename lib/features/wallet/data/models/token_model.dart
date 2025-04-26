class Token {
  // final String id;       // Add this field
  final String name;
  final String currency;
  final String imagePath;
  final double amount;
  final String price;
  final double balance;
  final double percentageChange;
  final String change;

  Token({
    // required this.id,    // Add this to the constructor
    required this.name,
    required this.currency,
    required this.imagePath,
    required this.amount,
    required this.price,
    required this.balance,
    required this.percentageChange,
    required this.change,
  });
}