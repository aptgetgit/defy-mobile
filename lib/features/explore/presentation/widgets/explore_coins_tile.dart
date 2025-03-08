import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String percentageChange;
  final IconData? icon;
  final String imageUrl;
  final Color priceChangeColor;

  const CryptoTile({
    Key? key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentageChange,
    this.icon,
    required this.imageUrl,
    required this.priceChangeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(symbol, style: TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            percentageChange,
            style: TextStyle(color: priceChangeColor),
          ),
        ],
      ),
    );
  }
}
