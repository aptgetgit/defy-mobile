// from_token_screen.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_check_box.dart';
import 'swap_from_screen.dart';

class FromTokenScreen extends StatefulWidget {
  const FromTokenScreen({super.key});

  @override
  _FromTokenScreenState createState() => _FromTokenScreenState();
}

class _FromTokenScreenState extends State<FromTokenScreen> {
  bool _isSelectionMode = false;
  final List<Map<String, String>> tokens = <Map<String, String>>[
    <String, String>{
      'name': 'APT',
      'icon': 'assets/icons/aptos.png',
      'usdValue': r'$22.12',
      'amount': '7 APTOS',
      'isSelected': 'false',
    },
    <String, String>{
      'name': 'Ethereum',
      'icon': 'assets/icons/ethereum.png',
      'usdValue': r'$852.02',
      'amount': '0.5 ETH',
      'isSelected': 'false',
    },
    <String, String>{
      'name': 'Polygon',
      'icon': 'assets/icons/polygon.png',
      'usdValue': r'$62.90',
      'amount': '8.01 MATIC',
      'isSelected': 'false',
    },
    <String, String>{
      'name': 'DAI',
      'icon': 'assets/icons/dai.png',
      'usdValue': '23.10',
      'amount': '00.23 DAI',
      'isSelected': 'false',
    },
    <String, String>{
      'name': 'USDC',
      'icon': 'assets/icons/usdc.png',
      'usdValue': r'$89.02',
      'amount': '90 USDC',
      'isSelected': 'false',
    },
  ];

  void _toggleSelectionMode() {
    setState(() {
      _isSelectionMode = !_isSelectionMode;
      if (!_isSelectionMode) {
        // Reset selection when exiting selection mode
        for (final Map<String, String> token in tokens) {
          token['isSelected'] = 'false';
        }
      }
    });
  }

  void _toggleTokenSelection(int index) {
    setState(() {
      final bool currentValue = tokens[index]['isSelected'] == 'true';
      tokens[index]['isSelected'] = (!currentValue).toString();
    });
  }

  int getSelectedCount() => tokens.where((Map<String, String> token) => token['isSelected'] == 'true').length;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Swap',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(PhosphorIconsRegular.arrowsClockwise),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'From Token',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      PhosphorIconsBold.magnifyingGlass,
                      color: AppColors.greyLight,
                      size: 24,
                    ),
                    const Gap(16),
                    GestureDetector(
                      onTap: _toggleSelectionMode,
                      child: _isSelectionMode
                          ? Container(
                            width: 65,
                            height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.red.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(24),
                              ),
                            child: const Center(
                              child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.red,
                                  ),
                                ),
                            ),
                          )
                          : const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromARGB(255, 244, 244, 246),
                              child: Icon(
                                PhosphorIconsBold.dotsThreeVertical,
                                color: AppColors.greyLight,
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: tokens.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, String> token = tokens[index];
                  final bool isSelected = token['isSelected'] == 'true';
                  // Inside the ListView.builder itemBuilder
                  return GestureDetector(
                    onTap: _isSelectionMode
                        ? () => _toggleTokenSelection(index)
                        : () {
                            // Handle token selection
                            Navigator.pop(context, token);
                          },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Left side - Token icon and information
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
                          
                          // Right side - Price information and checkbox (if in selection mode)
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    token['usdValue']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[900],
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
                              // Show checkbox on the right side when in selection mode
                              if (_isSelectionMode)
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: CustomCheckbox(
                                    isChecked: isSelected,
                                    isRound: true,
                                    onTap: () => _toggleTokenSelection(index),
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
            if (_isSelectionMode)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Collect all selected tokens
                      final List<Map<String, String>> selectedTokens = tokens
                          .where((Map<String, String> token) => token['isSelected'] == 'true')
                          .toList();
                      
                      if (selectedTokens.isNotEmpty) {
                        // Return all selected tokens to the previous screen
                        Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) => SwapFromScreen(selectedTokens: selectedTokens))
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: AppColors.blue,
                            radius: 12,
                            child: Text(
                              '${getSelectedCount()}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Continue',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Gap(21),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
}
