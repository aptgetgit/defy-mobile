import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

import '../data/models/explore_token.dart';
import '../screens/explore_token_info_screen.dart';


class TokenListWidget extends StatelessWidget {
  final List<ExploreToken> tokens;

  const TokenListWidget({
    Key? key,
    required this.tokens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a random generator for emoji background colors
    final Random random = Random();
    final List<Color> emojiBackgrounds = [
      Colors.blue[100]!,
      Colors.green[100]!,
      Colors.orange[100]!,
      Colors.purple[100]!,
      Colors.pink[100]!,
      Colors.teal[100]!,
      Colors.amber[100]!,
      Colors.cyan[100]!,
    ];

    return ListView.builder(
      padding: EdgeInsets.all(10.w),
      itemCount: tokens.length,
      itemBuilder: (context, index) {
        final token = tokens[index];
        
        // Get random background color for emoji tiles
        final Color emojiBackgroundColor = token.tileType == 'emoji'
            ? emojiBackgrounds[random.nextInt(emojiBackgrounds.length)]
            : Colors.grey[200]!;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: token.tileType == 'emoji' ? emojiBackgroundColor : null,
            backgroundImage: token.tileType == 'image' && token.logo != null
                ? AssetImage(token.logo!)
                : null, // Don't use missing asset
            radius: 22.r,
            child: token.tileType == 'emoji' && token.emoji != null
                ? Text(
                    token.emoji!,
                    style: TextStyle(fontSize: 24.sp),
                  )
                : token.tileType == 'image' 
                    ? null // No child for image tiles (using backgroundImage)
                    : Icon(PhosphorIconsBold.currencyCircleDollar, 
                        color: Colors.grey[600], 
                        size: 24.sp),
          ),
          title: token.tileType == 'emoji'
              ? Text(
                  token.emoji ?? '', // Show emoji as title for emoji tiles
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                )
              : Text(
                  token.name,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
          subtitle: Text(
            token.symbol,
            style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '\$${token.priceUsd.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${token.changePercentage > 0 ? '+' : ''}${token.changePercentage}%',
                    style: TextStyle(
                      color: token.changePercentage > 0 ? Colors.green : Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ExploreTokenInfoScreen(
                  name: token.name,
                  logoPath: token.tileType == 'emoji'
                      ? '' // Don't pass logo path for emoji tokens
                      : (token.logo ?? ''), // Handle missing logo
                  percentage: '${token.changePercentage}%',
                  investors: token.investors.toString(),
                  returnPeriod: token.returnPeriod,
                  emoji: token.tileType == 'emoji' ? token.emoji : null, // Pass emoji to detail screen
                ),
              ),
            );
          },
        );
      },
    );
  }
}