// swap_from_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../widgets/token_selection_sheet.dart';

class SwapFromScreen extends StatefulWidget {

  const SwapFromScreen({super.key, required this.selectedTokens});
  final List<Map<String, String>> selectedTokens;

  @override
  _SwapFromScreenState createState() => _SwapFromScreenState();
}

class _SwapFromScreenState extends State<SwapFromScreen> with SingleTickerProviderStateMixin {
  // Add TabController
  late TabController _tabController;
  String _amount = ''; // Track the entered amount
  String _fromToken = 'APT'; // Default from token
  String _toToken = 'USDC'; // Default to token
  String _fromTokenIcon = 'assets/icons/aptos.png';
  String _toTokenIcon = 'assets/icons/usdc.png'; // Default to token icon
  String _toTokenAmount = '0.00'; // Default to token amount

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        // Trigger rebuild when tab changes to update actions
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleButtonPress(String label) {
    setState(() {
      if (label == 'cancel') {
        // Clear the amount
        _amount = '';
      } else if (label == '.') {
        // Add a decimal point if it doesn't already exist
        if (!_amount.contains('.') && _amount.isNotEmpty) {
          _amount += label;
        }
      } else {
        // Append the digit to the amount
        if (_amount == '' || _amount == '0.00') {
          _amount = label; // Replace '' or '0.00' with the first digit
        } else {
          _amount += label;
        }
      }
    });
  }

  Future<void> _showTokenSelectionSheet() async {
    final Map<String, String>? selectedToken = await showModalBottomSheet<Map<String, String>>(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => TokenSelectionSheet(
        onTokenSelected: (Map<String, String> token) {
          // Callback to handle token selection
        },
      ),
    );

    // Update the to token if a selection was made
    if (selectedToken != null) {
      setState(() {
        _toToken = selectedToken['name'] ?? _toToken;
        _toTokenIcon = selectedToken['icon'] ?? _toTokenIcon;
        _toTokenAmount = selectedToken['amount']?.replaceAll(RegExp(r'[^\d.]'), '') ?? '0.00'; // Extract numeric value
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
  appBar: AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 24),
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
          icon: const Icon(PhosphorIconsRegular.arrowsClockwise, size: 24),
          onPressed: () {},
        ),
      ),
    ],
    centerTitle: true,
  ),
  body: Column(
    children: <Widget>[
      // Header section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Gap(18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Swap from', style: TextStyle(fontSize: 16, color: AppColors.greyDark)),
                  GestureDetector(
                    onTap: () {
                      // Handle reset
                    },
                    child: const Text('Reset', style: TextStyle(fontSize: 16, color: AppColors.blue))
                  ),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
      
      // Scrollable container section
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: <Widget>[
                // Token Container
                ...widget.selectedTokens.map((Map<String, String> token) => Padding(
                  padding: const EdgeInsets.only(bottom: 12, top:8),
                  child: Container(
                    // Your existing container code
                    width: 345,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              token['icon']!,
                              width: 40,
                            ),
                            const Gap(8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  token['name']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  token['usdValue']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyDark,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _amount == '' ? '' : '\$$_amount',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: _amount == '0.00' ? Colors.grey : Colors.black,
                                ),
                              ),
                              Text(
                                '0.00 ${token['name']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
                
                // Add space at the bottom to ensure scrolling works properly
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
      
      // Bottom fixed section
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          children: <Widget>[
            // Swap to section
            GestureDetector(
              onTap: _showTokenSelectionSheet,
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.greyVeryLight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Swap to',
                            style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                          ),
                          Text(
                            '--',
                            style: TextStyle(fontSize: 16, color: AppColors.black),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.only(left: 4, right: 16),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              _toTokenIcon,
                              width: 32,
                            ),
                            const Gap(11),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _toToken,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  _toTokenAmount.isNotEmpty ? '$_toTokenAmount $_toToken' : '--',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.greyDark,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(4),
            Container(
              height: 66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/Cellana.png',
                          width: 36.25,
                          height: 34,
                        ),
                        const Gap(12),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Via',
                                  style: TextStyle(fontSize: 16, color: AppColors.greyDark),
                                ),
                                Gap(4),
                                Text(
                                  'Cellana, Cetus',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              '2.5% Cheaper',
                              style: TextStyle(fontSize: 14, color: AppColors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(8),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        fixedSize: const Size(103, 35),
                        backgroundColor: AppColors.blue.withValues(alpha: 0.2),
                        foregroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Change',
                        style: TextStyle(color: AppColors.blue, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Keypad and button
            Container(
              height: 320, // Fixed height for keypad section
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildRowButtons(<String>['1', '2', '3']),
                        _buildRowButtons(<String>['4', '5', '6']),
                        _buildRowButtons(<String>['7', '8', '9']),
                        _buildRowButtons(<String>['.', '0', 'cancel']),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8, top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _amount != '0.00' ? Colors.black : AppColors.greyMedium,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

  Widget _buildRowButtons(List<String> items) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((String item) => _buildButton(item,
            item == 'cancel' ? PhosphorIconsBold.backspace : null)).toList(),
      );

  // Helper function to build a single button
  Widget _buildButton(String label, [IconData? icon]) => Expanded(
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            _handleButtonPress(label);
          },
          onLongPress: label == 'cancel'
              ? () {
                  // Handle long press for cancel button
                  setState(() {
                    _amount = '';
                  });
                }
              : null,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 16 : 8,
              vertical: icon == null ? 12 : 10,
            ),
            child: icon == null
                ? Center(
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Center(child: Icon(icon)),
          ),
        ),
      );
}