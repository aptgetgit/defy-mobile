class Token {
  Token({
    required this.imagePath,
    required this.name,
    required this.balance,
    required this.amount,
    required this.currency,
    required this.percentageChange,
    required this.price,
    required this.change,
  });
  
  final String imagePath;
  final String name;
  final dynamic balance; // Allow both double and String
  final double amount;
  final String currency;
  final double percentageChange;
  final String price;    // Price as formatted string (e.g., "$123.45")
  final String change;   // Change as formatted string (e.g., "+4.5%")
}