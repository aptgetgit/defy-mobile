import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class StakeAmountScreen extends StatefulWidget {
  const StakeAmountScreen({super.key});

  @override
  _StakeAmountScreenState createState() => _StakeAmountScreenState();
}

class _StakeAmountScreenState extends State<StakeAmountScreen> {
  String _amount = '0'; // Track the entered amount

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Stake', style: TextStyle(fontSize: 18, color: AppColors.black),),
          const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/unkown.png', width: 20),
              const Gap(4),
              const Text('Everstake', style: TextStyle(fontSize: 14,color: AppColors.greyLight),),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.green.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(30),
            ), 
            child: const Text('100% APY', style: TextStyle(color: AppColors.green),),
          ),
        ),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Gap(24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Your estimated daily yields is', style: TextStyle(color: AppColors.greyLight, fontSize: 14),),
                Gap(4),
                Text(r'$1.321', style: TextStyle(color: AppColors.green, fontSize: 14, fontWeight: FontWeight.w600),),
                Gap(4),
                Text('at the current APY.', style: TextStyle(color: AppColors.greyLight, fontSize: 14),),
              ],
            ),
            const Gap(90),

            // Amount Display
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$$_amount', // Display the dynamic amount
                    style: TextStyle(fontSize: 54, fontWeight: FontWeight.w600, color: _amount == '0' ? AppColors.greyLight : AppColors.black),
                  ),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icons/aptos.png', width: 18),
                      const Gap(4),
                      const Text(
                        '0 APT',
                        style: TextStyle(fontSize: 14, color: AppColors.greyLight, fontWeight: FontWeight.w600),
                      ),
                      const Gap(4),
                      const Icon(
                        PhosphorIconsBold.caretUpDown,
                        size: 16,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                  const Gap(85),

                  // Asset Selection
                  Container(
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.greyLight.withValues(alpha:0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
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
                                    '100.21 APT',
                                    style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(8),
                          FilledButton(
                            onPressed: () {
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              fixedSize: const Size(80, 36),
                              backgroundColor: AppColors.transparent,
                              foregroundColor: AppColors.blue,
                              side: const BorderSide(
                                color: AppColors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Max',
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
            const Gap(24),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                fixedSize: const Size(double.maxFinite, 56),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ), 
              child: const Text('Continue'),
            ),
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
