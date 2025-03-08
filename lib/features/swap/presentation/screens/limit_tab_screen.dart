import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class LimitTab extends StatefulWidget {
  const LimitTab({super.key});

  @override
  _LimitTabState createState() => _LimitTabState();
}

class _LimitTabState extends State<LimitTab> {
  String _amount = '0.00'; // Track the entered amount
  String _fromToken = 'APT'; // Default from token
  String _toToken = 'USDC'; // Default to token

  // Handle button press
  void _handleButtonPress(String label) {
    setState(() {
      if (label == 'cancel') {
        // Clear the amount
        _amount = '0.00';
      } else if (label == '.') {
        // Add a decimal point if it doesn't already exist
        if (!_amount.contains('.') && _amount != '0.00') {
          _amount += label;
        }
      } else {
        // Append the digit to the amount
        if (_amount == '0.00') {
          _amount = label; // Replace '0.00' with the first digit
        } else {
          _amount += label;
        }
      }
    });
  }

  // Swap tokens
  void _swapTokens() {
    setState(() {
      final temp = _fromToken;
      _fromToken = _toToken;
      _toToken = temp;
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  // First container's Row layout
                  Container(
                    width: 361,
                    height: 118,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _amount,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: _amount == '0.00' ? Colors.grey : Colors.black,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              _amount != '0.00' ? '160.92' : '0.00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/aptos.png',
                                width: 32,
                              ),
                              const Gap(11),
                              Text(
                                _fromToken,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(19),
                              const Icon(
                                PhosphorIconsBold.caretRight,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(4),
                  Container(
                    width: 361,
                    height: 118,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _amount != '0.00' ? '329' : '--',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              _amount != '0.00' ? '179.45' : '--',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/usdc.png',
                                width: 32,
                              ),
                              const Gap(11),
                              Text(
                                _toToken,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(9),
                              const Icon(
                                PhosphorIconsBold.caretRight,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 97,
                child: GestureDetector(
                  onTap: _swapTokens,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const Icon(
                      PhosphorIconsBold.arrowsDownUp,
                      size: 23,
                      color: Color.fromARGB(255, 100, 109, 128),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_amount != '0.00') ...[
            const Gap(34),
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
                              children: [
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
          ] else ...[
            const Gap(100),
          ],
          Expanded(
            child: Column(
              children: [
                _buildRowButtons(<String>['1', '2', '3']),
                _buildRowButtons(<String>['4', '5', '6']),
                _buildRowButtons(<String>['7', '8', '9']),
                _buildRowButtons(<String>['.', '0', 'cancel']),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: SizedBox(
              width: double.infinity,
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
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const Gap(16),
        ],
      ),
    );

  // Helper function to build a row of buttons
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
                    _amount = '0.00';
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