import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Keypad extends StatelessWidget {

  const Keypad({required this.onButtonPress, this.buttonText, super.key});
  final Function(String) onButtonPress;
  final String? buttonText;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 320.h,
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
            padding: EdgeInsets.only(bottom: 24.h, left: 25.w, right: 25.w, top: 10.h),
            child: SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Simplified, can add logic if needed
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                child: Text(buttonText ?? 'Next' , style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildRowButtons(List<String> items) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((String item) => _buildButton(item, item == 'cancel' ? PhosphorIconsBold.backspace : null)).toList(),
      );

  Widget _buildButton(String label, [IconData? icon]) => Expanded(
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onButtonPress(label);
          },
          onLongPress: label == 'cancel'
              ? () => onButtonPress('cancelLongPress')
              : null,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: icon == null ? 16.w : 8.w, vertical: icon == null ? 12.h : 10.h),
            child: icon == null
                ? Center(child: Text(label, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600)))
                : Center(child: Icon(icon)),
          ),
        ),
      );
}