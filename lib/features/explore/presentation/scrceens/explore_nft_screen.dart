import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      duration: const Duration(milliseconds: 600), // Total animation duration
      vsync: this,
    );
    // Define a combined slide + bounce animation
    _slideAnimation2 = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -1), // Start off-screen
          end: Offset.zero, // Slide into position
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60, // Slide takes up 80% of the duration
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero, // From resting position
          end: const Offset(0, 0.03), // Slight bounce up
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20, // Bounce up takes 10%
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 0.03), // From bounce peak
          end: Offset.zero, // Settle back to resting
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20, // Settle back takes 10%
      ),
    ]).animate(_animationController);

    // Define a combined slide + bounce animation
    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 1), // Start off-screen
          end: Offset.zero, // Slide into position
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60, // Slide takes up 80% of the duration
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero, // From resting position
          end: const Offset(0, -0.03), // Slight bounce up
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20, // Bounce up takes 10%
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.03), // From bounce peak
          end: Offset.zero, // Settle back to resting
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20, // Settle back takes 10%
      ),
    ]).animate(_animationController);
    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xfff4f4f6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'NFT Explore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //search bar
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(58),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Gap(16),
                      const Icon(
                        PhosphorIconsBold.magnifyingGlass,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(8),
                      Expanded(
                        child: TextField(
                          controller: _searchConroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search or paste URL',
                            hintStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        PhosphorIconsBold.cards,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                const Gap(16),

                //minting now banner
                const Text(
                  'Minting now',
                  style: TextStyle(
                    fontSize: 18,
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
                      //top nfts
                      _buildCategoryHeader('Top NFTs', (){}),
                      const Gap(4),
                      _buildNFTSGrid(context),
                    ],
                  ),
                ),
                
                //top volume
                const Gap(8),
                _buildCategoryHeader('Top Volume', (){}),
                const Gap(4),
                _buildNFTSGrid(context),

                //highest gainers
                const Gap(8),
                _buildCategoryHeader('Highest gainers', (){}),
                const Gap(4),
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
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: height * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 16,
            top: 22,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white.withValues(alpha: .2),
                ),
                child: const Row(
                  children: <Widget>[
                    Icon(PhosphorIconsFill.sparkle, color: AppColors.green,size: 18),
                    Gap(2),
                    Text(
                      'Minting',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),),
          ),
          Positioned(
            bottom : 22,
            left: 22,
            child : Column(
              mainAxisSize : MainAxisSize.min,
              crossAxisAlignment : CrossAxisAlignment.start,
              children : <Widget>[
                Container(
                  width : width * .11,
                  height : width * .11,
                  decoration : BoxDecoration(borderRadius : BorderRadius.circular(12),color : AppColors.white),
                ),
                const Gap(4),
                const Text('Get Minecrafts',style: TextStyle(
                  fontSize : 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),),
                const Gap(6),
                const Row(
                  mainAxisSize : MainAxisSize.min,
                  children: <Widget>[
                    Text('By Jerrold',style: TextStyle(
                      fontSize : 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    ),
                    Gap(3),
                    Icon(PhosphorIconsFill.sealCheck,color : AppColors.white, size: 24),
                  ],
                ), 
                const Text('Open edition 0.22APT',style: TextStyle(
                      fontSize : 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),),
            
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 22,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.black,
                ),
                child: const Text(
                      'View Drop',
                      style: TextStyle(
                        fontSize: 16,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue, size: 18),
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
      height: height *.285 * 2,
      child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                mainAxisExtent: height* .285,
              ),
              itemCount: nftImages.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical:4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _getNftAsset(
                          context: context,
                          imageUrl: nftImages[index],
                          ),
                      const Gap(6),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width / 3),
                        child: const Text(
                          'Cyberpunk kid #6823',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyDark,),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(3),
                     const Text('0.0APT',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500,),),
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
      return const CircleAvatar(radius: 22, backgroundColor: Colors.amber);
    } else {
      //two cases - ipfs and url to call
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width * .5,
          height: width * .45,
          imageUrl: imageUrl,
          errorWidget: (BuildContext ctx, String str, Object obg) => Container(color: Colors.amber),
          progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
              const CircularProgressIndicator(),
        ),
      );
    }
  }
}
