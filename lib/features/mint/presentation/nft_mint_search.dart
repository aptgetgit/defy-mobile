import 'package:defy/features/shared/presentation/widgets/custom_search_bar.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NFTMintSearch extends ConsumerStatefulWidget {
  const NFTMintSearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NFTMintSearchState();
}

class _NFTMintSearchState extends ConsumerState<NFTMintSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFT Mint Search'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomSearchBar(),
                  SizedBox(height: 20.h),
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
                mainAxisSpacing: 20.h,
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
                childCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
