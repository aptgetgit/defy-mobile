
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theme/colors.dart';
import '../../../domain/models/selectable_item_model.dart';


class MultiInputCard<T extends SelectableItem> extends StatelessWidget {
  final String tokenImage;
  final String tokenName;
  final String tokenPrice;
  final String tokenBalance;
  const MultiInputCard(
      {required this.tokenName,
      required this.tokenPrice,
      required this.tokenBalance,
      required this.tokenImage,
      super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 16,
                spreadRadius: 0,
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.12),),
          ],),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(12),
            Image(
              height: 40,
              width: 40,
              image: AssetImage(tokenImage),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tokenName,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  tokenPrice,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tokenPrice,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  tokenBalance,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,),
                ),
              ],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
    ;
  }
}
