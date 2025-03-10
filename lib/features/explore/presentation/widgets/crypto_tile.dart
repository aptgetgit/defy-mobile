import 'package:flutter/material.dart';

class CryptoTile extends StatelessWidget {

  const CryptoTile({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentageChange,
    this.icon,
    required this.imageUrl,
    required this.priceChangeColor,
  });
  final String name;
  final String symbol;
  final String price;
  final String percentageChange;
  final IconData? icon;
  final String imageUrl;
  final Color priceChangeColor;

  @override
  Widget build(BuildContext context) => ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(symbol, style: const TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            percentageChange,
            style: TextStyle(color: priceChangeColor),
          ),
        ],
      ),
    );
}
