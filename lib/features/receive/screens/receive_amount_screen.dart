import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class ReceiveAmountScreen extends StatefulWidget {
  const ReceiveAmountScreen({super.key});

  @override
  _ReceiveAmountScreenState createState() => _ReceiveAmountScreenState();
}

class _ReceiveAmountScreenState extends State<ReceiveAmountScreen> {
  String _amount = '0'; // Track the entered amount

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Gap(24),

            // Amount Display
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$$_amount', // Display the dynamic amount
                    style: const TextStyle(fontSize: 54, fontWeight: FontWeight.w600),
                  ),
                  const Gap(8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '7.06 APT',
                        style: TextStyle(fontSize: 14, color: AppColors.greyLight, fontWeight: FontWeight.w600),
                      ),
                      Gap(4),
                      Icon(
                        PhosphorIconsBold.arrowsDownUp,
                        size: 16,
                      ),
                    ],
                  ),
                  const Gap(85),

                  // Asset Selection
                  Container(
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.greyVeryLight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage('assets/icons/aptos.png'),
                                radius: 22,
                              ),
                              Gap(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Aptos',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'APT',
                                    style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(8),
                          TextButton(
                            onPressed: () {
                              // Handle asset change
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Change',
                              style: TextStyle(color: AppColors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),

                  // Number Pad
                  Column(
                    children: <Widget>[
                      _buildRowButtons(<String>['1', '2', '3']),
                      _buildRowButtons(<String>['4', '5', '6']),
                      _buildRowButtons(<String>['7', '8', '9']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _buildButton('.'),
                          _buildButton('0'),
                          _buildButton('cancel', PhosphorIconsBold.backspace),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );

  // Helper function to build a row of buttons
  Widget _buildRowButtons(List<String> items) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map(_buildButton).toList(),
    );

  // Helper function to build a single button
  Widget _buildButton(String label, [IconData? icon]) => Expanded(
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          _handleSinglePress(label);
        },
        onLongPress: label == 'cancel'
            ? () {
                // Handle long press for cancel button
                setState(() {
                  _amount = '0';
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
              : Icon(icon),
        ),
      ),
    );
  // Handle button press
  void _handleSinglePress(String label) {
    setState(() {
      if (label == 'cancel') {
        // Clear the amount
        _amount = '0';
      } else if (label == '.') {
        // Add a decimal point if it doesn't already exist
        if (!_amount.contains('.')) {
          _amount += '.';
        }
      } else {
        // Append the digit to the amount
        if (_amount == '0') {
          _amount = label; // Replace '0' with the first digit
        } else {
          _amount += label;
        }
      }
    });
  }
}
