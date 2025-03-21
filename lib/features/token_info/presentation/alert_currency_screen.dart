import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';

class CurrencyChooserScreen extends StatefulWidget {
  const CurrencyChooserScreen({super.key});
  
  @override
  State<CurrencyChooserScreen> createState() => _CurrencyChooserScreenState();
}

class _CurrencyChooserScreenState extends State<CurrencyChooserScreen> {
  List<String> currencies = <String>['Pound', 'INR', 'Dollar', 'Euro', 'Yen', 'Australian Dollar', 'Canadian Dollar', 'Swiss Franc']; // Extended sample currency list
  String searchText = '';
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White AppBar
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, color: Colors.black, size: 24.sp), // Black back arrow with responsive size
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
        title: Text(
          'Choose Currency',
          style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600), // Responsive title text
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(PhosphorIconsBold.gear, color: Colors.black, size: 24.sp), // Black settings icon with responsive size
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              height: 48.h, // Fixed height instead of using MediaQuery
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color(0xFFF4F4F6),
              ),
              child: Row(
                children: <Widget>[
                  Icon(PhosphorIconsBold.magnifyingGlass, color: Colors.grey[500], size: 24.sp), // Grey search icon with responsive size
                  Gap(8.w),
                  Expanded(
                    child: TextField(
                      onChanged: (String value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      style: TextStyle(fontSize: 16.sp),
                      decoration: InputDecoration(
                        hintText: 'Search currency type',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (BuildContext context, int index) {
                  final String currency = currencies[index];
                  if (currency.toLowerCase().contains(searchText.toLowerCase())) {
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                      leading: Text(
                        getCurrencySymbol(currency), // Get symbol based on currency
                        style: TextStyle(fontSize: 24.sp, color: AppColors.greyLight),
                      ),
                      title: Text(
                        currency, 
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        setState(() {
                          if (selectedCurrency == currency) {
                            selectedCurrency = null;
                          } else {
                            selectedCurrency = currency;
                          }
                        });
                      },
                      trailing: CustomCheckbox(
                        isRound: true,
                        isChecked: selectedCurrency == currency,
                        onTap: () {
                         setState(() {
                            if (selectedCurrency == currency) {
                              selectedCurrency = null;
                            } else {
                              selectedCurrency = currency;
                            }
                          }); 
                        },
                      ),
                    );
                  } else {
                    return const SizedBox.shrink(); // Hide if not matching search
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h, top: 8.h),
              child: ElevatedButton(
                onPressed: selectedCurrency != null 
                  ? () {
                    // Return the selected currency to the previous screen
                    Navigator.pop(context, selectedCurrency);
                  }
                  : null, // Disable if no currency is selected
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 54.h),
                  backgroundColor: selectedCurrency != null ? Colors.black : Colors.grey, // Black button or grey if disabled
                  foregroundColor: Colors.white, // White text
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  textStyle: TextStyle(fontSize: 16.sp),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(56.r),
                  ),
                ),
                child: const Center(child: Text('Apply')),
              ),
            ),
          ],
        ),
      ),
    );

  // Helper function to get currency symbol
  String getCurrencySymbol(String currency) {
    switch (currency) {
      case 'Pound':
        return '£';
      case 'INR':
        return '₹';
      case 'Dollar':
        return r'$';
      case 'Euro':
        return '€';
      case 'Yen':
        return '¥';
      case 'Australian Dollar':
        return r'A$';
      case 'Canadian Dollar':
        return r'C$';
      case 'Swiss Franc':
        return 'Fr';
      default:
        return '';
    }
  }
}
