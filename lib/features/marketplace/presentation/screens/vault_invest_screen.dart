
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/black_button.dart';


class VaultInvestScreen extends StatefulWidget {
  const VaultInvestScreen({super.key});

  @override
  State<VaultInvestScreen> createState() => _VaultInvestScreenState();
}

class _VaultInvestScreenState extends State<VaultInvestScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController toAddressController = TextEditingController();
  String amount = "\$0";
  String _amount = "\$0";

  int paymentTime = 0;

  void changeType(int type) {
    setState(() {
      paymentTime = type;
    });
  }

  String addCommas(String input) {
    final buffer = StringBuffer();
    int count = 0;

    for (int i = input.length - 1; i >= 0; i--) {
      buffer.write(input[i]);
      count++;
      if (count == 3 && i != 0) {
        buffer.write(',');
        count = 0;
      }
    }

    return buffer.toString().split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        PhosphorIconsBold.caretLeft,
                        color: AppColors.greyDark,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invest in",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyDark),
                      ),
                      const Gap(2),
                      Text(
                        "Basket of Memes Assets ...",
                        style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(80)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6),
                        child: Row(
                          children: [
                            const Image(
                              height: 24,
                              image: AssetImage("assets/images/USDC.png"),
                            ),
                            const Gap(4),
                            Text("USDC",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                            const Gap(2),
                            const Icon(
                              PhosphorIconsRegular.caretDown,
                              size: 20,
                              color: AppColors.greyDark,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Balance USDC",
                          style: TextStyle(
                              color: AppColors.greyLight, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$207.10",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'You Send',
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyDark,
                      fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.6,
                                height: 100,
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                        children: List.generate(8, (index) {
                                      final char = index < _amount.length
                                          ? _amount[index]
                                          : "";
                                      bool isNotVisible =
                                          (_amount.length > amount.length
                                              ? index >= amount.length
                                              : index >= _amount.length);
                                      return AnimatedSlide(
                                        duration:
                                            const Duration(milliseconds: 150),
                                        offset: (!isNotVisible)
                                            ? Offset(0, 0)
                                            : Offset(0, 0.5),
                                        child: AnimatedOpacity(
                                          opacity: (!isNotVisible) ? 1 : 0,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          child: AnimatedDefaultTextStyle(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize:
                                                    80 - (_amount.length * 3)),
                                            child: Text(
                                              char,
                                            ),
                                          ),
                                        ),
                                      );
                                    }))),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                height: 22,
                                image: AssetImage("assets/images/USDC.png"),
                              ),
                              Gap(5),
                              Text(
                                '0.00452 APT',
                                style: TextStyle(
                                  color: const Color(0xff646d80),
                                  fontSize: 14),
                              ),
                              Gap(12),
                              const Icon(
                                PhosphorIconsBold.arrowsDownUp,
                                size: 18,
                              )
                            ],
                          )
                        ]),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.greyVeryLight,
                                  borderRadius: BorderRadius.circular(80)),
                              child: Container(
                                child: Stack(
                                  children: [
                                    AnimatedPositioned(
                                        top: 8,
                                        left: paymentTime == 0 ? 10 : 100,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Container(
                                          width: 90,
                                          height: 34,
                                          decoration: BoxDecoration(
                                              color: AppColors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(80)),
                                        )),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            changeType(0);
                                          },
                                          child: Container(
                                            width: 100,
                                            child: Center(
                                              child: Text(
                                                "  One Time",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: paymentTime == 0
                                                        ? AppColors.white
                                                        : AppColors.greyDark),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            changeType(1);
                                          },
                                          child: Center(
                                            child: Text(
                                              "   Recurring",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: paymentTime == 1
                                                      ? AppColors.white
                                                      : AppColors.greyDark),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(12),
                    _buildRowButtons(['1', '2', '3']),
                    _buildRowButtons(['4', '5', '6']),
                    _buildRowButtons(['7', '8', '9']),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildButton('.', null),
                            _buildButton('0', null),
                            _buildButton('cancel', PhosphorIconsBold.backspace),
                          ]),
                    ),
                    BlackButtonXL(
                        title: "Pay with other token", onClick: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowButtons(List<String> rows) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rows.map((e) => _buildButton(e, null)).toList(),
      ),
    );
  }

  Widget _buildButton(String label, IconData? icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(label);
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: icon == null ? 16 : 8,
                vertical: icon == null ? 16 : 16),
            // padding: const EdgeInsets.symmetric(vertical: 8),
            child: icon == null
                ? Center(
                    child: Text(
                      label,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  )
                : Icon(icon)),
      ),
    );
  }

  void onTap(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      setState(() {
        if (amount.length > 2 && amount != "\$0") {
          amount = amount.substring(0, amount.length - 1);
        } else {
          amount = "\$0";
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount.length > 2 && _amount != "\$0") {
            _amount = _amount.substring(0, _amount.length - 1);
          } else {
            _amount = "\$0";
          }
        });
      });
    } else {
      if (_amount.length >= 12) return;

      setState(() {
        if (amount == "\$0") {
          amount = "\$";
          amount += label;
        } else {
          amount += label;

          // final val = addCommas(amount.substring(1) + label);
          // print(val);
          // amount = "\$" + val;
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount == "\$0") {
            _amount = "\$" + label;
          } else {
            _amount += label;

            //   final val = addCommas(_amount.substring(1) + label);
            // _amount =  "\$" + val;
          }
        });
      });
    }
  }
}
