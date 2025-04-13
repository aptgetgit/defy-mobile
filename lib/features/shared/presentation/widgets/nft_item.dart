import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../nft_info/models/nft_selection_provider.dart';
import '../../../wallet/data/models/nft_model.dart';
import 'custom_check_box.dart';

class NFTItem extends ConsumerWidget {
  const NFTItem({
    required this.nft,
    required this.isSelected,
    required this.showCheckbox,
    required this.onCheckboxChanged,
    this.isHiding = false,
    super.key,
  });

  final NFT nft;
  final bool isSelected;
  final bool showCheckbox;
  final ValueChanged<bool>? onCheckboxChanged;
  final bool isHiding;

  @override
  Widget build(BuildContext context, WidgetRef ref) => GestureDetector(
    onTap: () {
      if (nft.onTap != null) {
        nft.onTap!();
      } else {
        // Save selected NFT to provider before navigation
        ref.read(selectedNftNotifierProvider.notifier).selectNFT(nft);
        
        // Default navigation based on NFT type
        _navigateToNFTInfo(context);
      }
    },
    child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // NFT Image with Hero animation and opacity based on selection and hiding mode
            Hero(
              tag: 'nft-image-${nft.id}',
              child: Opacity(
                // Only apply opacity when both selected AND in hiding mode
                opacity: isSelected && isHiding ? 0.5 : 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.asset(
                    nft.imageUrl,
                    width: 168.h,
                    height: 168.h,
                    fit: BoxFit.fill,
                  ),
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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nft.id,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected && isHiding ? Colors.grey : AppColors.black,
                ),
              ),
              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Floor Price',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyLight,
                    ),
                  ),
                  Gap(6.w),
                  Text(
                    nft.price,
                    style: TextStyle(
                      fontSize: 14.sp,
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