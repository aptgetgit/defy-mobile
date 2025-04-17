import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = <Map<String, dynamic>>[
    // TODAY
    {'section': 'TODAY', 'items': <Map<String, Object?>>[
      <String, Object>{'icon': 'assets/icons/avatar.png', 'title': 'Received Ethereum', 'subtitle': 'from Jane Wilsonn', 'amount': '+0.0023 ETH', 'time': '2mins ago', 'isPositive': true},
      <String, Object>{'icon': 'assets/icons/avatar2.png', 'title': 'Sent Polygon to', 'subtitle': 'Jake', 'amount': '-0.0123 MATIC', 'time': '1mins ago', 'isPositive': false},
      <String, String?>{'icon': 'assets/icons/polygon.png', 'title': 'You swapped Tokens', 'subtitle': 'Polygon -> Ethereum', 'amount': 'N/A', 'time': '1 week ago', 'isPositive': null},
    ],},
    // YESTERDAY
    {'section': 'YESTERDAY', 'items': <Map<String, String?>>[
      <String, String?>{'icon': 'assets/icons/weirdos.png', 'title': 'Received Weirdos', 'subtitle': 'from Jane Wilson', 'amount': 'N/A', 'time': '17/11/2023', 'isPositive': null},
      <String, String?>{'icon': 'assets/icons/scifi.png', 'title': 'Received 🌈Sci-fi', 'subtitle': 'from Oxl8n...090', 'amount': 'N/A', 'time': '17/11/2023', 'isPositive': null},
    ],},
    // LAST WEEK
    {'section': 'LAST WEEK', 'items': <Map<String, Object?>>[
      <String, String?>{'icon': 'assets/icons/planet_nft.png', 'title': 'Approved 🪐Planets', 'subtitle': 'from OpenSea', 'amount': 'N/A', 'time': '2mins ago', 'isPositive': null},
      <String, String?>{'icon': 'assets/icons/NFT-5.png', 'title': 'Jane liked your NFT Sci-fi', 'subtitle': 'N/A', 'amount': 'N/A', 'time': '2mins ago', 'isPositive': null},
      <String, Object>{'icon': 'assets/icons/avatar2.png', 'title': 'Send Polygon to', 'subtitle': 'Jake', 'amount': '0.0023 MATIC', 'time': '1mins ago', 'isPositive': false},
      <String, String?>{'icon': 'assets/icons/roclet.png', 'title': 'Deployed BitHub Wallet', 'subtitle': 'On Ethereum', 'amount': 'N/A', 'time': '1mins ago', 'isPositive': null},
      <String, String?>{'icon': 'assets/icons/scroll.png', 'title': 'Executed BitHub Wallet', 'subtitle': 'Polygon <> Ethereum', 'amount': 'N/A', 'time': '1mins ago', 'isPositive': null},
      <String, Object>{'icon': 'assets/icons/dydx.png', 'title': 'Traded ETH/USDT', 'subtitle': 'from DYDX', 'amount': '-0.0123 MATIC', 'time': '1week ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/uniswap-dex-logo.png', 'title': 'Added ETH/USDT to', 'subtitle': 'from Uniswap', 'amount': '-0.1ETH/0.1...', 'time': '1mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/uniswap-dex-logo.png', 'title': 'Remove ETH/USDT to', 'subtitle': 'from Uniswap', 'amount': '-0.1 MATIC/0.1...', 'time': '1mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/aave.png', 'title': 'Lent Polygon', 'subtitle': 'from Aave', 'amount': '-0.0023 MATIC', 'time': '1mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/aave.png', 'title': 'Borrowed Polygon', 'subtitle': 'from Aave', 'amount': '+0.0023 MATIC', 'time': '1mins ago', 'isPositive': true},
      <String, Object>{'icon': 'assets/icons/avatar2.png', 'title': 'Cancelled Send', 'subtitle': 'to Jake', 'amount': '+0.0023 MATIC', 'time': '1mins ago', 'isPositive': true},
      <String, Object>{'icon': 'assets/icons/avatar3.png', 'title': 'Burnt Lostgirl 😩', 'subtitle': '0x00000....', 'amount': '-0.0023 ETH', 'time': '2mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/aave.png', 'title': 'Liquidated ETH/USDT', 'subtitle': 'from Aave', 'amount': '-0.0023 ETH', 'time': '2mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/NFT-5.png', 'title': 'Minted Death #2320', 'subtitle': 'from OpenSea', 'amount': '-0.0023 ETH', 'time': '2mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/rocketpool.png', 'title': 'Staked Ethereum', 'subtitle': 'to Rocketpool', 'amount': '-0.0023 ETH', 'time': '2mins ago', 'isPositive': false},
      <String, Object>{'icon': 'assets/icons/rocketpool.png', 'title': 'Unstaked Ethereum', 'subtitle': 'from Rocketpool', 'amount': '+0.0023 ETH', 'time': '2mins ago', 'isPositive': true},
      <String, Object>{'icon': 'assets/icons/aave.png', 'title': 'Withdraw Aethereum', 'subtitle': 'From Aave', 'amount': '+0.0023 ETH', 'time': '2mins ago', 'isPositive': true},
    ],},
  ];

  @override
  Widget build(BuildContext context) => ListView.builder(
      // Remove NeverScrollableScrollPhysics to allow scrolling
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      itemCount: _transactions.length,
      shrinkWrap: true, // Add this
      itemBuilder: (BuildContext context, int sectionIndex) {
        final Map<String, dynamic> section = _transactions[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                section['section'].toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            ...List.generate(section['items'].length as int, (int itemIndex) {
              final item = section['items'][itemIndex];
              return TransactionItem(
                iconPath: item['icon'].toString(),
                title: item['title'].toString(),
                subtitle: item['subtitle'].toString(),
                amount: item['amount'].toString(),
                time: item['time'].toString(),
                isPositive: item['isPositive'] as bool?,
              );
            }),
            // Add bottom padding
           
            
          ],
        );
      },
    );
}

// TransactionItem Widget
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.time,
    required this.isPositive,
    super.key,
  });
  final String iconPath;
  final String title;
  final String subtitle;
  final String amount;
  final String time;
  final bool? isPositive;

  Color _getAmountColor() {
    if (isPositive == null) {
      return AppColors.greyLight;
    }
    return isPositive! ? AppColors.green : AppColors.red;
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            iconPath,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey, // Default to grey for title
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: _isName(subtitle) ? AppColors.black : AppColors.grey, // Black for names, grey otherwise
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Column(
                  children: <Widget>[
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: _getAmountColor(),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

  bool _isName(String text) {
    final names = ['Jane Wilsonn', 'Jake', 'Jane Wilson', 'Oxl8n...090', 'OpenSea', 'DYDX', 'Uniswap', 'Aave', 'Rocketpool'];
    return names.contains(text);
  }
}