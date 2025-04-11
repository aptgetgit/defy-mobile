import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
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
              Text(
                'Price Alert',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(PhosphorIconsRegular.bellRinging, size: 24.sp),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Notify me when 🫨 ',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CurrencyChooserScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 8.h,),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F6),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Price in USD',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: showGoesOverBottomSheet, // Trigger bottom sheet
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 8.h,),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F6),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Goes Over ',
                            style: TextStyle(
                              color: AppColors.greyLight,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(2.w),
                          Icon(
                            PhosphorIconsBold.caretDown,
                            color: AppColors.greyDark,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text('Enter Value',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.greyDark),),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF4F4F6),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      r'$',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _showNumPad(context);
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _priceController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyVeryLight,
                              border: InputBorder.none,
                              hintText: 'Enter Here',
                              hintStyle: TextStyle(
                                color: AppColors.greyMedium,
                                fontSize: 16.sp,
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
              SizedBox(height: 20.h),
              Text('Notes',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.greyDark),),
              SizedBox(height: 10.h),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF4F4F6),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text('Alert History',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),),
              SizedBox(height: 10.h),
              ..._alerts.asMap().entries.map((MapEntry<int, Map<String, dynamic>> entry) {
                final int index = entry.key;
                final Map<String, dynamic> alert = entry.value;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  height: 100.h,
                  margin: EdgeInsets.only(bottom: 20.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: AppColors.greyVeryLight,
                      width: 1.w,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.greyVeryLight,
                        spreadRadius: 1.r,
                        blurRadius: 1.r,
                        offset: Offset(1.w, 1.h),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: alert['status'] == 'active' ? const Color(0xFFDEF1DA) : AppColors.red.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  PhosphorIconsRegular.bell,
                                  color: alert['status'] == 'active' ? const Color(0xff58BB47) : AppColors.red,
                                  size: 18.sp,
                                ),
                                Text(
                                  alert['status'] == 'active' ? ' Active ' : ' Disabled ',
                                  style: TextStyle(
                                    color: alert['status'] == 'active' ? const Color(0xff58BB47) : AppColors.red,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 34.w,
                            height: 34.h,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF4F4F6),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
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
                                size: 18.sp,
                                color: AppColors.greyDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: <Widget>[
                          Text(
                            'Notify me when price ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            r'goes over $500',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        alert['status'] == 'active' ? ' Created 10 mins ago ' : ' Last Triggered 10 mins ago ',
                        style: TextStyle(
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 14.sp,
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
          padding: EdgeInsets.all(30.w),
          child: GestureDetector(
            onTap: () {
              widget.onAlertCreated?.call();
              Navigator.pop(context);
            },
            child: Container(
              height: 56.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _priceController.text.isNotEmpty
                    ? Colors.black
                    : AppColors.greyMedium,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      PhosphorIconsRegular.bellRinging,
                      color: _priceController.text.isNotEmpty ? AppColors.white : AppColors.greyLight,
                      size: 18.sp,
                    ),
                    Text(
                      ' Create Alert',
                      style: TextStyle(
                        color: _priceController.text.isNotEmpty ? AppColors.white : AppColors.greyLight,
                        fontSize: 16.sp,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
      ),
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Gap(8.h),
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
