import 'package:flutter/material.dart';

class TokenSelectionSheet extends StatelessWidget {

  const TokenSelectionSheet({required this.onTokenSelected, super.key});
  final Function(Map<String, String>) onTokenSelected;

  @override
  Widget build(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const Text('Select a Token'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              onTokenSelected(<String, String>{'name': 'USDC', 'icon': 'assets/icons/usdc.png', 'amount': '0.00'});
              Navigator.pop(context);
            },
            child: const Text('Select USDC'),
          ),
        ],
      ),
    );
}
