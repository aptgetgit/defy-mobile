import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/bid_keypad.dart';


class BidAmountScreen extends StatefulWidget {
  final Map<String, String> itemData;
  final List<Map<String, String>> selectedItems;

  const BidAmountScreen({
    super.key,
    required this.itemData,
    required this.selectedItems,
  });

  @override
  State<BidAmountScreen> createState() => _BidAmountScreenState();
}

class _BidAmountScreenState extends State<BidAmountScreen> {
  String bidAmount = '0';
  String bidAmountInCrypto = '0';
  final String cryptoIconPath = 'assets/icons/aptos.png';
  final String highestBid = '1.25';
  int _currentIndex = 0;
  PageController? _pageController;
  List<Map<String, dynamic>> _bids = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Initialize bids list with empty values for all selected items
    _bids = List.generate(widget.selectedItems.length, (_) => {
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
        if (bidAmount.length <= 1) {
          bidAmount = '0';
        } else {
          bidAmount = bidAmount.substring(0, bidAmount.length - 1);
        }
      } else if (input == '.') {
        if (!bidAmount.contains('.')) {
          bidAmount = '$bidAmount.';
        }
      } else {
        if (bidAmount == '0') {
          bidAmount = input;
        } else {
          bidAmount = '$bidAmount$input';
        }
      }

      // Calculate crypto amount (simplified)
      if (bidAmount == '0') {
        bidAmountInCrypto = '0';
      } else {
        try {
          final double usd = double.parse(bidAmount);
          final double eth = usd / 3000; // Assuming 1 ETH = $3000
          bidAmountInCrypto = eth.toStringAsFixed(4);
        } catch (_) {
          bidAmountInCrypto = '0';
        }
      }
    });
  }

  void setMinBid() {
    setState(() {
      final double highestBidValue = double.parse(highestBid);
      final double minBidValue = highestBidValue + 0.01;
      final double usdValue = minBidValue * 3000;

      bidAmount = usdValue.toStringAsFixed(2);
      bidAmountInCrypto = minBidValue.toStringAsFixed(4);
    });
  }

  void saveBidAndContinue() {
    // Save current bid
    _bids[_currentIndex] = {
      'usdAmount': bidAmount,
      'cryptoAmount': bidAmountInCrypto,
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

        // Reset bid amount or load saved amount
        if (_bids[_currentIndex]['usdAmount'] != '0') {
          bidAmount = _bids[_currentIndex]['usdAmount'] as String;
          bidAmountInCrypto = _bids[_currentIndex]['cryptoAmount'] as String;
        } else {
          bidAmount = '0';
          bidAmountInCrypto = '0';
        }
      });
    } else {
      // All NFTs have been bid on, show confirmation dialog or navigate to confirmation screen
      _showBidConfirmationDialog();
    }
  }

  void _showBidConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Bids', style: TextStyle(fontSize: 18.sp)),
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
                  child: Image.network(
                    widget.selectedItems[index]['imageUrl']!,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(widget.selectedItems[index]['name']!),
                subtitle: Text('\$${_bids[index]['usdAmount']} (${_bids[index]['cryptoAmount']} ETH)'),
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
              Navigator.pop(context); // Go back to cart screen
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
                Text('Bid NFT', style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
                Gap(4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.network(widget.itemData['imageUrl']!, width: 20.w, height: 20.h),
                    ),
                    Gap(4.w),
                    Text(widget.itemData['name']!,
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
                Text('Current Highest Bid', style: TextStyle(color: AppColors.greyLight, fontSize: 14.sp)),
                Gap(4.w),
                Text('$highestBid ETH', style: TextStyle(color: AppColors.green, fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ],
            ),
            Gap(90.h),

            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '\$$bidAmount',
                    style: TextStyle(fontSize: 54.sp, fontWeight: FontWeight.w600, color: bidAmount == '0' ? AppColors.greyLight : AppColors.black),
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(cryptoIconPath, width: 18.w),
                      Gap(4.w),
                      Text(
                        '$bidAmountInCrypto ETH',
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
                                    tag: 'nft_image_${item['name']}',
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(22.r),
                                      child: Image.network(
                                        item['imageUrl']!,
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
                                        item['name']!,
                                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Floor: ${item['price']}',
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
                                    '\$${_bids[index]['usdAmount']}',
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${_bids[index]['cryptoAmount']} ETH',
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
                onContinuePressed: bidAmount == '0' ? null : saveBidAndContinue,
                isContinueEnabled: bidAmount != '0',
                currentIndex: _currentIndex,
                totalItems: widget.selectedItems.length,
              ),
            ),
            
           
          ],
        ),
      ),
    );
  }
}