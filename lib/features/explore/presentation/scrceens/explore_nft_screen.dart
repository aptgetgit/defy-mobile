import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';

class ExploreNFTScreen extends StatefulWidget {
  const ExploreNFTScreen({super.key});

  @override
  State<ExploreNFTScreen> createState() => _ExploreNFTScreenState();
}

class _ExploreNFTScreenState extends State<ExploreNFTScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchConroller = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _slideAnimation2 = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, 0.03),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 0.03),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);

    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.03),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.03),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xfff4f4f6),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NFT Explore',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(58.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Gap(16.w),
                      Icon(
                        PhosphorIconsBold.magnifyingGlass,
                        color: AppColors.greyMedium,
                        size: 18.sp,
                      ),
                      Gap(8.w),
                      Expanded(
                        child: TextField(
                          controller: _searchConroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search or paste URL',
                            hintStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        PhosphorIconsBold.cards,
                        color: AppColors.greyMedium,
                        size: 18.sp,
                      ),
                      Gap(16.w),
                    ],
                  ),
                ),
                Gap(16.h),

                Text(
                  'Minting now',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation2,
                  child: _buildMintingBanner(context),
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: <Widget>[
                      _buildCategoryHeader('Top NFTs', (){}),
                      Gap(4.h),
                      _buildNFTSGrid(context),
                    ],
                  ),
                ),
                
                Gap(8.h),
                _buildCategoryHeader('Top Volume', (){}),
                Gap(4.h),
                _buildNFTSGrid(context),

                Gap(8.h),
                _buildCategoryHeader('Highest gainers', (){}),
                Gap(4.h),
                _buildNFTSGrid(context),
              ],
            ),
          ),
        ),
      ),
    );

  Widget _buildMintingBanner(BuildContext context) {
    final double height = context.screenHeight;
    final double width = context.screenWidth;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      height: height * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.grey,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 16.w,
            top: 22.h,
            child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.white.withValues(alpha: .2),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(PhosphorIconsFill.sparkle, color: AppColors.green, size: 18.sp),
                    Gap(2.w),
                    Text(
                      'Minting',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),),
          ),
          Positioned(
            bottom: 22.h,
            left: 22.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width * .11,
                  height: width * .11,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: AppColors.white),
                ),
                Gap(4.h),
                Text('Get Minecrafts', style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),),
                Gap(6.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('By Jerrold', style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    ),
                    Gap(3.w),
                    Icon(PhosphorIconsFill.sealCheck, color: AppColors.white, size: 24.sp),
                  ],
                ), 
                Text('Open edition 0.22APT', style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),),
            
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 22.h,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.black,
                ),
                child: Text(
                      'View Drop',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title, VoidCallback onTap) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue, size: 18.sp),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildNFTSGrid(BuildContext context) {
    final List<String> nftImages = <String>[
      'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
    ];
    final double width = context.screenWidth;
    final double height = context.screenHeight;
    return SizedBox(
      height: height * .285 * 2,
      child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.h,
                crossAxisSpacing: 4.w,
                mainAxisExtent: height * .285,
              ),
              itemCount: nftImages.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _getNftAsset(
                          context: context,
                          imageUrl: nftImages[index],
                          ),
                      Gap(6.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width / 3),
                        child: Text(
                          'Cyberpunk kid #6823',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyDark,),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gap(3.h),
                      Text('0.0APT',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                ),
            ),
    );
  }
  
  Widget _getNftAsset(
      {required BuildContext context,
      required String? imageUrl,}) {
    final double width = context.screenWidth;
    if (imageUrl == null) {
      return CircleAvatar(radius: 22.r, backgroundColor: Colors.amber);
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width * .5,
          height: width * .45,
          imageUrl: imageUrl,
          errorWidget: (BuildContext ctx, String str, Object obj) => Container(color: Colors.amber),
          progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
              CircularProgressIndicator(strokeWidth: 2.w),
        ),
      );
    }
  }
}
