import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';

class CurrencyChooserScreen extends StatefulWidget {
  @override
  _CurrencyChooserScreenState createState() => _CurrencyChooserScreenState();
}

class _CurrencyChooserScreenState extends State<CurrencyChooserScreen> {
  List<String> currencies = ['Pound', 'INR', 'Dollar']; // Sample currency list
  String searchText = '';
  String? selectedCurrency;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White AppBar
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, color: Colors.black, size: 24,), // Black back arrow
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
        title: Text(
          'Choose Currency',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600), // Black title text
        ),
        actions: [
          IconButton(
            icon: Icon(PhosphorIconsBold.gear, color: Colors.black, size: 24,), // Black settings icon
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF4F4F6),
              ),
              child: Row(
                children: [
                  Icon(PhosphorIconsBold.magnifyingGlass, color: Colors.grey[500], size: 24), // Grey search icon
                  const Gap(8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search currency type',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  if (currency.toLowerCase().contains(searchText.toLowerCase())) {
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        getCurrencySymbol(currency), // Get symbol based on currency
                        style: TextStyle(fontSize: 24, color: AppColors.greyLight),
                      ),
                      title: Text(currency, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      onTap: () {
                        // Handle currency selection
                        print('Selected: $currency');
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
                        }
                      ),
                    );
                  } else {
                    return SizedBox.shrink(); // Hide if not matching search
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle apply button press
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 54),
                  backgroundColor: Colors.black, // Black button
                  foregroundColor: Colors.white, // White text
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(56),
                  ),
                ),
                child: Center(child: Text('Apply')),
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
        return '€'; // Or '£' if you intend to use British Pound
      case 'INR':
        return '₹';
      case 'Dollar':
        return '\$';
      default:
        return '';
    }
  }
}