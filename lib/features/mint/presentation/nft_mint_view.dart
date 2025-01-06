import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/mint/presentation/nft_mint_details_view.dart';
import 'package:defy/features/mint/presentation/nft_mint_search.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTMintView extends ConsumerStatefulWidget {
  const NFTMintView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NFTMintViewState();
}

class _NFTMintViewState extends ConsumerState<NFTMintView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          PhosphorIconsBold.caretLeft,
          size: 20,
        ),
        centerTitle: true,
        title: Text(
          'NFT Mint',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/mint_header.png',
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildCategoryItem('Active ', isSelected: true),
                              SizedBox(width: 10.w),
                              _buildCategoryItem('Upcoming 🌝'),
                              SizedBox(width: 10.w),
                              _buildCategoryItem('Past 🌚'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NFTMintSearch(),
                            ),
                          );
                        },
                        child: Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: AppColors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Auctions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return NFTCard(
                    imageUrl: '',
                    description: '',
                    discordUrl: '',
                    twitterUrl: '',
                    websiteUrl: '',
                    nftName: 'Cyborg',
                    collectionName: 'Defy',
                    price: 0,
                    showCartButton: false,
                    isMint: true,
                  );
                },
                childCount: 4,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Additions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return NFTCard(
                    imageUrl: '',
                    description: '',
                    discordUrl: '',
                    twitterUrl: '',
                    websiteUrl: '',
                    nftName: 'Cyborg',
                    collectionName: 'Defy',
                    price: 0,
                    showCartButton: false,
                    isMint: true,
                  );
                },
                childCount: 4,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return NFTCard(
                    imageUrl: '',
                    description: '',
                    discordUrl: '',
                    twitterUrl: '',
                    websiteUrl: '',
                    nftName: 'Cyborg',
                    collectionName: 'Defy',
                    price: 0,
                    showCartButton: false,
                    isMint: true,
                  );
                },
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String text, {bool isSelected = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : AppColors.greyVeryLight,
        border: Border.all(
          color: isSelected ? AppColors.blue : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.blue : AppColors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
