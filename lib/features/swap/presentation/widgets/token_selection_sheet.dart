// token_selection_sheet.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class TokenSelectionSheet extends StatelessWidget {

  const TokenSelectionSheet({super.key, required this.onTokenSelected});
  final Function(Map<String, String>) onTokenSelected;

  @override
  Widget build(BuildContext context) {
    // Sample token data
    final List<Map<String, String>> tokens = <Map<String, String>>[
      <String, String>{
        'name': 'Ethereum',
        'icon': 'assets/icons/ethereum.png',
        'usdValue': r'$852.02',
        'amount': '0.5 ETH',
      },
      <String, String>{
        'name': 'Polygon',
        'icon': 'assets/icons/polygon.png',
        'usdValue': r'$62.90',
        'amount': '8.01 MATIC',
      },
      <String, String>{
        'name': 'DAI',
        'icon': 'assets/icons/dai.png',
        'usdValue': '23.10',
        'amount': '00.23 DAI',
      },
      <String, String>{
        'name': 'USDC',
        'icon': 'assets/icons/usdc.png',
        'usdValue': r'$89.02',
        'amount': '90 USDC',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Choose Token',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Gap(16),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(PhosphorIconsBold.magnifyingGlass, color: AppColors.greyDark),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Token',
                      hintStyle: TextStyle(color: AppColors.greyLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(24),
          Expanded(
            child: ListView.builder(
              itemCount: tokens.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> token = tokens[index];
                return GestureDetector(
                  onTap: () {
                    onTokenSelected(token);
                    Navigator.pop(context, token);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              token['icon']!,
                              width: 40,
                              height: 40,
                            ),
                            const Gap(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  token['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              token['usdValue']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              token['amount']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
