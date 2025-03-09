// swap_token_header.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../config/theme/colors.dart';

class SwapFromHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Map<String, String> token;
  final String amount;

  const SwapFromHeader({
    required this.minHeight,
    required this.maxHeight,
    required this.token,
    required this.amount,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 345,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(token['icon']!, width: 40),
                  const Gap(8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        token['name']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      Text(
                        token['usdValue']!,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.greyDark),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      amount.isEmpty ? '' : '\$$amount',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: amount == '0.00' ? Colors.grey : Colors.black,
                      ),
                    ),
                    Text(
                      '0.00 ${token['name']}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.greyDark),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  @override
  bool shouldRebuild(covariant SwapFromHeader oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      token != oldDelegate.token ||
      amount != oldDelegate.amount;
}
