import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/navigation/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../nft_info/models/nft_selection_provider.dart';

import '../../../nft_info/presentation/nft_info_video_screen.dart';
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
                  child: Material(
                    type: MaterialType.transparency,
                    borderRadius: BorderRadius.circular(16.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.85, end: 1.0),
                        duration: const Duration(milliseconds: 400),
                        builder: (context, opacity, child) {
                          return Opacity(
                            opacity: isSelected && isHiding ? 0.5 : opacity,
                            child: Material(
                              color: Colors.transparent,
                              child: _buildNftImage(ref),
                            ),
                          );
                        },
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
                      color: isSelected && isHiding
                          ? Colors.grey
                          : AppColors.black,
                    ),
                  ),
                  Gap(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Floor',
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

  Widget _buildNftImage(WidgetRef ref) {
    if (nft.type == NFTType.video) {
      // For video NFTs, try to get the thumbnail from the video provider
      // Use a constant path for the demo video - in production this would come from nft.videoUrl
      const String videoPath = 'assets/videos/nft_video.mp4';

      // Check if the provider has been initialized and has a thumbnail
      try {
        final videoProvider = ref.watch(videoPlayerProvider(videoPath));

        if (videoProvider.isInitialized == true &&
            videoProvider.thumbnailImage != null) {
          return Container(
            width: 168.h,
            height: 168.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: videoProvider.thumbnailImage! as ImageProvider<Object>,
                fit: BoxFit.cover,
              ),
            ),
            // Add a play button overlay to indicate this is a video
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32.r,
                ),
              ),
            ),
          );
        }
      } catch (e) {
        // If provider isn't ready yet, fall back to the default image
        print('Video thumbnail not available yet: $e');
      }
    }

    // Default image for non-video NFTs or when thumbnail isn't available
    return Image.asset(
      nft.imageUrl,
      width: 168.h,
      height: 168.h,
      fit: BoxFit.contain, // Use contain for consistent aspect ratio
    );
  }

  void _navigateToNFTInfo(BuildContext context) {
    switch (nft.type) {
      case NFTType.audio:
        const NftInfoAudioRoute().push(context);
      case NFTType.video:
        // Initialize the video provider before navigating to ensure thumbnail is ready
        // const videoPath = 'assets/videos/nft_video.mp4';
        NftInfoVideoRoute().push(context);
      case NFTType.image:
        const NftInfoRoute().push(context);
    }
  }
}
