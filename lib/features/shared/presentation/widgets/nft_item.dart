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
    required this.nft,
    required this.isSelected,
    required this.showCheckbox,
    required this.onCheckboxChanged,
    this.isHiding = false, // Add isHiding parameter
    super.key,
  });

  final NFT nft;
  final bool isSelected;
  final bool showCheckbox;
  final ValueChanged<bool>? onCheckboxChanged;
  final bool isHiding; // New parameter to track if we're in hiding mode

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      if (nft.onTap != null) {
        nft.onTap!();
      } else {
        // Default navigation based on NFT type
        _navigateToNFTInfo(context);
      }
    },
    child: Container(
     

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              // NFT Image with opacity based on selection and hiding mode
              Opacity(
                // Only apply opacity when both selected AND in hiding mode
                opacity: isSelected && isHiding ? 0.5 : 1.0,
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
          
              
              // Checkbox - only show when in selection mode
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
            padding:  EdgeInsets.all(10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nft.id,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    // Only apply grey color when both selected AND in hiding mode
                    color: isSelected && isHiding ? Colors.grey : AppColors.greyLight,
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
                        // Only apply grey color when both selected AND in hiding mode
                        color: isSelected && isHiding ? Colors.grey : AppColors.black,
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