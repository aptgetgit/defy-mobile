import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/bid_keypad.dart';

class ListAmountScreen extends StatefulWidget {
  final Map<String, dynamic> itemData;
  final List<Map<String, dynamic>> selectedItems;

  const ListAmountScreen({
    super.key,
    required this.itemData,
    required this.selectedItems,
  });

  @override
  State<ListAmountScreen> createState() => _ListAmountScreenState();
}

class _ListAmountScreenState extends State<ListAmountScreen> {
  String listAmount = '0';
  String listAmountInCrypto = '0';
  final String cryptoIconPath = 'assets/icons/aptos.png';
  final String floorPrice = '1.25';
  int _currentIndex = 0;
  PageController? _pageController;
  List<Map<String, dynamic>> _listings = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Initialize listings list with empty values for all selected items
    _listings = List.generate(widget.selectedItems.length, (_) => {
      'usdAmount': '0',
      'cryptoAmount': '0',
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void handleKeypadInput(String input) {
    setState(() {
      if (input == 'delete') {
        if (listAmount.length <= 1) {
          listAmount = '0';
        } else {
          listAmount = listAmount.substring(0, listAmount.length - 1);
        }
      } else if (input == '.') {
        if (!listAmount.contains('.')) {
          listAmount = '$listAmount.';
        }
      } else {
        if (listAmount == '0') {
          listAmount = input;
        } else {
          listAmount = '$listAmount$input';
        }
      }

      // Calculate crypto amount (simplified)
      if (listAmount == '0') {
        listAmountInCrypto = '0';
      } else {
        try {
          final double usd = double.parse(listAmount);
          final double eth = usd / 3000; // Assuming 1 ETH = $3000
          listAmountInCrypto = eth.toStringAsFixed(4);
        } catch (_) {
          listAmountInCrypto = '0';
        }
      }
    });
  }

  void setFloorPrice() {
    setState(() {
      final double floorPriceValue = double.parse(floorPrice);
      final double usdValue = floorPriceValue * 3000;

      listAmount = usdValue.toStringAsFixed(2);
      listAmountInCrypto = floorPriceValue.toStringAsFixed(4);
    });
  }

  void saveListingAndContinue() {
    // Save current listing
    _listings[_currentIndex] = {
      'usdAmount': listAmount,
      'cryptoAmount': listAmountInCrypto,
    };

    // Move to next NFT if available
    if (_currentIndex < widget.selectedItems.length - 1) {
      setState(() {
        _currentIndex++;
        _pageController?.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        // Reset list amount or load saved amount
        if (_listings[_currentIndex]['usdAmount'] != '0') {
          listAmount = _listings[_currentIndex]['usdAmount'] as String;
          listAmountInCrypto = _listings[_currentIndex]['cryptoAmount'] as String;
        } else {
          listAmount = '0';
          listAmountInCrypto = '0';
        }
      });
    } else {
      // All NFTs have been listed, show confirmation dialog
      _showListConfirmationDialog();
    }
  }

  void _showListConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Listings', style: TextStyle(fontSize: 18.sp)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.selectedItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    widget.selectedItems[index]['imageUrl'] as String,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(widget.selectedItems[index]['id'] as String),
                subtitle: Text('\$${_listings[index]['usdAmount']} (${_listings[index]['cryptoAmount']} ETH)'),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Edit', style: TextStyle(color: AppColors.greyLight)),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              // Add navigation to confirmation screen or home
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Your NFTs have been listed successfully')),
              );
              Navigator.pop(context); // Go back to sell screen
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.blue,
            ),
            child: Text('Confirm', style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('List NFT', style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(widget.itemData['imageUrl'] as String, width: 20.w, height: 20.h),
                    ),
                    Gap(4.w),
                    Text(widget.itemData['id'] as String,
                      style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Column(
            children: [
              Gap(8.h),
              Container(
                color: AppColors.greyVeryLight,
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gap(24.h),
            Row(
              children: <Widget>[
                Gap(8.w),
                Text('Floor Price', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp)),
                Gap(4.w),
                Text('$floorPrice ETH', style: TextStyle(color: AppColors.blue, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                Gap(8.w),
                GestureDetector(
                  onTap: setFloorPrice,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.greyVeryLight,
                    ),
                    child: Text(
                      'Use Floor',
                      style: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(90.h),

            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$$listAmount',
                    style: TextStyle(fontSize: 54.sp, fontWeight: FontWeight.w600, color: listAmount == '0' ? AppColors.greyLight : AppColors.black),
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(cryptoIconPath, width: 18.w),
                      Gap(4.w),
                      Text(
                        '$listAmountInCrypto ETH',
                        style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight, fontWeight: FontWeight.w600),
                      ),
                      Gap(4.w),
                      Icon(
                        PhosphorIconsBold.caretUpDown,
                        size: 16.sp,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                  Gap(85.h),

                  Container(
                    height: 66.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.greyLight.withOpacity(0.2),
                          blurRadius: 10.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: PageView.builder(
                      itemCount: widget.selectedItems.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = widget.selectedItems[index];
                        return Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Hero(
                                    tag: 'nft_image_${item['id']}',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(22.r),
                                      child: Image.asset(
                                        item['imageUrl'] as String,
                                        width: 44.w,
                                        height: 44.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Gap(12.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        item['id'] as String,
                                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Floor: $floorPrice ETH',
                                        style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$${_listings[index]['usdAmount']}',
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${_listings[index]['cryptoAmount']} ETH',
                                    style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: BidKeypad(
                onButtonPress: handleKeypadInput,
                onContinuePressed: listAmount == '0' ? null : saveListingAndContinue,
                isContinueEnabled: listAmount != '0',
                currentIndex: _currentIndex,
                totalItems: widget.selectedItems.length,
                continueText: _currentIndex < widget.selectedItems.length - 1 ? 'Continue' : 'Review Listings',
              ),
            ),
          ],
        ),
      ),
    );
  }
}