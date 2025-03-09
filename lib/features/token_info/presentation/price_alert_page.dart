import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/keypad.dart';
import 'alert_bottom_sheet.dart';
import 'alert_currency_screen.dart';

class PriceAlertPage extends StatefulWidget {
  const PriceAlertPage({super.key, this.onAlertCreated});

  final VoidCallback? onAlertCreated;

  @override
  State<PriceAlertPage> createState() => _PriceAlertPageState();
}

class _PriceAlertPageState extends State<PriceAlertPage> {
  String _amount = '0';
  final TextEditingController _priceController = TextEditingController();

  final List<Map<String, dynamic>> _alerts = <Map<String, dynamic>>[
    <String, String>{
      'status': 'active',
      'price': r'$500',
    },
    <String, String>{
      'status': 'disabled',
      'price': r'$500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    void showGoesOverBottomSheet() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (BuildContext context) => const AlertBottomSheet(),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              const Spacer(),
              const Text(
                'Price Alert',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(PhosphorIconsRegular.bellRinging),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Notify me when 🫨 ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CurrencyChooserScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8,),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Price in USD',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: showGoesOverBottomSheet, // Trigger bottom sheet
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8,),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: <Widget>[
                          Text(
                            'Goes Over ',
                            style: TextStyle(
                              color: AppColors.greyLight,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(2),
                          Icon(
                            PhosphorIconsBold.caretDown,
                            color: AppColors.greyDark,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Enter Value',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.greyDark),),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF4F4F6),
                ),
                child: Row(
                  children: <Widget>[
                    const Text(
                      r'$',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _showNumPad(context);
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _priceController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyVeryLight,
                              border: InputBorder.none,
                              hintText: 'Enter Here',
                              hintStyle: TextStyle(
                                color: AppColors.greyMedium,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Notes',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.greyDark),),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF4F4F6),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greyVeryLight,
                    border: InputBorder.none,
                    hintText: 'Add a note to your alert (Optional)',
                    hintStyle: TextStyle(
                      color: AppColors.greyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Alert History',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
              const SizedBox(height: 10),
              ..._alerts.asMap().entries.map((MapEntry<int, Map<String, dynamic>> entry) {
                final int index = entry.key;
                final Map<String, dynamic> alert = entry.value;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: MediaQuery.of(context).size.height * 0.13,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.greyVeryLight,
                    ),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: AppColors.greyVeryLight,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              color: alert['status'] == 'active' ? const Color(0xFFDEF1DA) : AppColors.red.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  PhosphorIconsRegular.bell,
                                  color: alert['status'] == 'active' ? const Color(0xff58BB47) : AppColors.red,
                                  size: 18,
                                ),
                                Text(
                                  alert['status'] == 'active' ? ' Active ' : ' Disabled ',
                                  style: TextStyle(
                                    color: alert['status'] == 'active' ? const Color(0xff58BB47) : AppColors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 34,
                            height: 34,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF4F4F6),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (alert['status'] == 'active') {
                                    _alerts.removeAt(index);
                                  } else {
                                    alert['status'] = 'active';
                                  }
                                });
                              },
                              icon: Icon(
                                alert['status'] == 'active' ? PhosphorIconsBold.trashSimple : PhosphorIconsBold.arrowsClockwise,
                                size: 18,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: <Widget>[
                          Text(
                            'Notify me when price ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            r'goes over $500',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        alert['status'] == 'active' ? ' Created 10 mins ago ' : ' Last Triggered 10 mins ago ',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30),
          child: GestureDetector(
            onTap: () {
              widget.onAlertCreated?.call();
              Navigator.pop(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _priceController.text.isNotEmpty
                    ? Colors.black
                    : AppColors.greyMedium,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      PhosphorIconsRegular.bellRinging,
                      color: _priceController.text.isNotEmpty ? AppColors.white : AppColors.greyLight,
                      size: 18,
                    ),
                    Text(
                      ' Create Alert',
                      style: TextStyle(
                        color: _priceController.text.isNotEmpty ? AppColors.white : AppColors.greyLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showNumPad(BuildContext context) {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Gap(8),
          Keypad(
            onButtonPress: (String label) {
              if (label == 'cancelLongPress') {
                setState(() {
                  _amount = '0';
                  _priceController.text = _amount;
                });
                return;
              }
              
              _handleSinglePress(label);
            },
          ),
        ],
      ),
    );
  }

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
      _priceController.text = _amount;
    });
  }
}
