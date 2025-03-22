import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../wallet/data/models/nft_model.dart';
import 'custom_check_box.dart';

class NFTItem extends StatelessWidget {
  const NFTItem({
    super.key,
    required this.nft,
    this.isSelected = false,
    this.showCheckbox = false,
    this.onCheckboxChanged,
    this.onTap,
  });

  final NFT nft;
  final bool isSelected;
  final bool showCheckbox;
  final Function(bool)? onCheckboxChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Opacity(
                opacity: isSelected ? 0.5 : 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.asset(
                    nft.imageUrl,
                    width: double.infinity,
                    height: 185.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (showCheckbox)
                Positioned(
                  right: 8.w,
                  top: 8.h,
                  child: CustomCheckbox(
                    isChecked: isSelected,
                    isRound: true,
                    onTap: () {
                      onCheckboxChanged?.call(!isSelected);
                    },
                  ).animate().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: 1,
                    end: 0,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nft.id,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.grey : AppColors.greyLight,
                  ),
                ),
                Gap(4.h),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/aptos.png',
                      width: 16.w,
                    ),
                    Gap(6.w),
                    Text(
                      nft.price,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: isSelected ? Colors.grey : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  void _navigateToNFTInfo(BuildContext context) {
    switch (nft.type) {
      case NFTType.audio:
        const NftInfoAudioRoute().push(context);
      case NFTType.video:
        const NftInfoVideoRoute().push(context);
      case NFTType.image:
        const NftInfoRoute().push(context);
    }
  }
}
