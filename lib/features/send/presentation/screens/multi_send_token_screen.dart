import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:defy/features/send/domain/models/selectable_item_model.dart';
import 'package:defy/features/send/domain/models/token_model.dart';
import 'package:defy/features/send/domain/models/user_model.dart';
import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/widgets/send/multi_send_token_animated_tile.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../../domain/models/selectable_item_model.dart';

class MultiSendTokenScreen<T extends SelectableItem> extends StatefulWidget {
  final List<T> selectedAssetItems;
  final List<T> selectedToItems;
  const MultiSendTokenScreen(
      {super.key,
      required this.selectedAssetItems,
      required this.selectedToItems});

  @override
  State<MultiSendTokenScreen> createState() => _SendTokenState();
}

class _SendTokenState extends State<MultiSendTokenScreen> {
  var amountController = TextEditingController();
  var toAddressController = TextEditingController();

  bool isSwapped = false;

  String amount = "\$0";
  String _amount = "\$0";

  String amount2 = "0";
  String _amount2 = "0";

  int sendType = 0;

  int paymentTime = 0;

  void swap() {
    setState(() {
      isSwapped = !isSwapped;
    });
  }

  void changeType(int type) {
    setState(() {
      paymentTime = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = context.screenSize;
    final double width = screenSize.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  Text(
                    "Send",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Icon(
                    PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
                    color: Colors.black,
                    size: 21,
                  ),
                ],
              ),
              Visibility(visible: sendType == 0, child: const Gap(20)),
              Visibility(
                visible: sendType == 0,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(60)),
                  child: Center(
                    child: Row(
                      children: [
                        const Gap(16),
                        Text(
                          "To",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Gap(20),
                        RowSuper(
                          innerDistance: -24,
                          children: [
                            ...widget.selectedToItems
                                .asMap()
                                .entries
                                .map((entry) {
                              final SelectableItem selectableToItem = entry.value;

                              if (selectableToItem is Wallet) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.asset),
                                );
                              } else if (selectableToItem is Contact) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.avatar!),
                                );
                              } else if (selectableToItem is Token) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image:
                                      AssetImage(selectableToItem.tokenImage!),
                                );
                              } else if (selectableToItem is Friend) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.avatar!),
                                );
                              } else if (selectableToItem is UserModel) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.asset),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                          ],
                        ),
                        const Gap(4),
                        Text(
                          _buildSelectedText(
                            widget.selectedToItems.first,
                          )!,
                          style: TextStyle(fontSize: 16, color: AppColors.greyLight),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(24)),
                            child: Center(
                              child: Icon(
                                PhosphorIcons.plus(PhosphorIconsStyle.bold),
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You Send',
                          style: TextTheme.of(context)
                              .bodyLarge
                              ?.copyWith(color: AppColors.greyDark),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              sendType = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: sendType == 0
                                    ? AppColors.blueLight
                                    : AppColors.greyVeryLight,
                                   
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.equals(
                                        PhosphorIconsStyle.bold),
                                    color:
                                        sendType == 0 ? AppColors.blue : AppColors.greyLight,
                                    size: 16,
                                  ),
                                  const Gap(6),
                                  Text(
                                    "Split Equally",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: sendType == 0
                                            ? AppColors.blue : AppColors.greyLight),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(12),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              sendType = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: sendType == 1
                                    ? AppColors.blueLight
                                    : AppColors.greyVeryLight,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.slidersHorizontal(
                                        PhosphorIconsStyle.bold),
                                    color:
                                        sendType == 1 ? AppColors.blue : AppColors.greyLight,
                                    size: 16,
                                  ),
                                  const Gap(6),
                                  Text(
                                    "Custom",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: sendType == 1
                                            ? AppColors.blue : AppColors.greyLight),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(32),
                  Visibility(
                    visible: sendType == 0,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: Stack(children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                          bottom: isSwapped ? 0 : 55,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.6,
                                height: 100,
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                        children: List.generate(8, (index) {
                                      final String char = index < _amount.length
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
                                                fontWeight: isSwapped
                                                    ? FontWeight.w500
                                                    : FontWeight.w700,
                                                color: isSwapped
                                                    ? Color(0xff646d80)
                                                    : Colors.black,
                                                fontSize: isSwapped
                                                    ? 14
                                                    : 80 -
                                                        (_amount.length * 3)),
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
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                          bottom: !isSwapped ? 0 : 55,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.6,
                                height: 100,
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                        children: List.generate(8, (index) {
                                      final String char = index < _amount2.length
                                          ? _amount2[index]
                                          : "";
                                      bool isNotVisible =
                                          (_amount2.length > amount2.length
                                              ? index >= amount2.length
                                              : index >= _amount2.length);
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
                                                fontWeight: !isSwapped
                                                    ? FontWeight.w500
                                                    : FontWeight.w700,
                                                color: !isSwapped
                                                    ? Color(0xff646d80)
                                                    : Colors.black,
                                                fontSize: !isSwapped
                                                    ? 14
                                                    : 80 -
                                                        (_amount2.length * 3)),
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
                        ),
                        Positioned(
                            bottom: 40,
                            left: 100,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                swap();
                              },
                              child: AnimatedRotation(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceInOut,
                                turns: isSwapped ? 0.5 : 0,
                                child: Icon(
                                  PhosphorIconsBold.arrowsDownUp,
                                  size: 18,
                                ),
                              ),
                            ))
                      ]),
                    ),
                  ),
                  Visibility(
                    visible: sendType == 1,
                    child: MultiSendTokenAnimatedTile(
                      selectedAssetItems: widget.selectedAssetItems,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: sendType == 0,
                                      child: RowSuper(
                                          innerDistance: -26,
                                          children: [
                                            ...widget.selectedAssetItems
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              final SelectableItem token = entry.value;
                                              if (token is Token) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      token.tokenImage!),
                                                );
                                              } else {
                                                return const SizedBox.shrink();
                                              }
                                            }),
                                          ]),
                                    ),
                                    Visibility(
                                      visible: sendType == 1,
                                      child: RowSuper(
                                          innerDistance: -26,
                                          children: [
                                            ...widget.selectedToItems
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              final SelectableItem selectableToItem =
                                                  entry.value;
                                              if (selectableToItem is Wallet) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      selectableToItem.asset),
                                                );
                                              } else if (selectableToItem
                                                  is Contact) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      selectableToItem.avatar!),
                                                );
                                              } else if (selectableToItem
                                                  is Token) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      selectableToItem
                                                          .tokenImage!),
                                                );
                                              } else if (selectableToItem
                                                  is Friend) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      selectableToItem.avatar!),
                                                );
                                              } else if (selectableToItem
                                                  is UserModel) {
                                                return Image(
                                                  height: 32,
                                                  width: 32,
                                                  image: AssetImage(
                                                      selectableToItem.asset),
                                                );
                                              } else {
                                                return const SizedBox.shrink();
                                              }
                                            }),
                                          ]),
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Visibility(
                                          visible: sendType == 0,
                                          child: Text(
                                            _buildSelectedText(widget
                                                .selectedAssetItems.first)!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sendType == 1,
                                          child: Text(
                                            _buildSelectedText(
                                                widget.selectedToItems.first)!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sendType == 0,
                                          child: Text(
                                            "\$650.09",
                                            style: TextStyle(
                                                fontSize: 14, color: AppColors
                                                .greyLight),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sendType == 1,
                                          child: Text(
                                            "user_22",
                                            style: TextStyle(
                                                fontSize: 14, color: AppColors.greyLight),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Gap(8)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 38,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text("Max"),
                            ),
                          )
                        ],
                      ),
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
                      title: "Continue",
                      onClick: () {
                        // SendConfirmationRoute().push(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _buildSelectedText(SelectableItem firstItemArg) {
    final SelectableItem firstItem = firstItemArg;

    if (firstItem is UserModel) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.userName} +${widget.selectedToItems.length - 1} others"
          : firstItem.userName;
    } else if (firstItem is Friend) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.friendName} +${widget.selectedToItems.length - 1} others"
          : firstItem.friendName;
    } else if (firstItem is Contact) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.contactName} +${widget.selectedToItems.length - 1} others"
          : firstItem.contactName;
    } else if (firstItem is Wallet) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.walletName} +${widget.selectedToItems.length - 1} others"
          : firstItem.walletName;
    } else if (firstItem is Token) {
      return widget.selectedAssetItems.length > 1
          ? "${firstItem.tokenName} +${widget.selectedAssetItems.length - 1}"
          : firstItem.tokenName;
    } else {
      return "";
    }
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
          if (!isSwapped)
            _onTapOne(label);
          else
            _onTapTwo(label);
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
                      style: TextTheme.of(context)
                          .bodyLarge
                          ?.copyWith(fontSize: 22),
                    ),
                  )
                : Icon(icon)),
      ),
    );
  }

  void _onTapOne(String label) {
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
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount == "\$0") {
            _amount = "\$" + label;
          } else {
            _amount += label;
          }
        });
      });
    }
  }

  void _onTapTwo(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      setState(() {
        if (amount2.length > 2 && amount2 != "0") {
          amount2 = amount2.substring(0, amount2.length - 1);
        } else {
          amount2 = "0";
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount2.length > 2 && _amount2 != "\$0") {
            _amount2 = _amount2.substring(0, _amount2.length - 1);
          } else {
            _amount2 = "\$0";
          }
        });
      });
    } else {
      if (_amount2.length >= 12) return;

      setState(() {
        if (amount2 == "0") {
          amount2 = "";
          amount2 += label;
        } else {
          amount2 += label;
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount2 == "0") {
            _amount2 = label;
          } else {
            _amount2 += label;
          }
        });
      });
    }
  }
}
