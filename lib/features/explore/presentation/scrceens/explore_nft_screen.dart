import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
        title: Text(
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
              children: [
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
                    children: [
                      const Gap(16),
                      Icon(
                        PhosphorIconsBold.magnifyingGlass,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(8),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          controller: _searchConroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search or paste URL",
                            hintStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        PhosphorIconsBold.cards,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                const Gap(16),

                //minting now banner
                Text(
                  'Minting now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation2,
                  child: _buildMintingBanner(context)
                ),
                SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
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
    final height = context.screenHeight;
    final width = context.screenWidth;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: height * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 16,
            top: 22,
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white.withOpacity(.2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(PhosphorIconsFill.sparkle, color: AppColors.green,size: 18),
                    const Gap(2),
                    Text(
                      'Minting',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            bottom : 22,
            left: 22,
            child : Column(
              mainAxisSize : MainAxisSize.min,
              crossAxisAlignment : CrossAxisAlignment.start,
              children : [
                Container(
                  width : width * .11,
                  height : width * .11,
                  decoration : BoxDecoration(borderRadius : BorderRadius.circular(12),color : AppColors.white),
                ),
                const Gap(4),
                Text('Get Minecrafts',style: TextStyle(
                  fontSize : 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                )),
                const Gap(6),
                Row(
                  mainAxisSize : MainAxisSize.min,
                  children: [
                    Text('By Jerrold',style: TextStyle(
                      fontSize : 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    ),
                    const Gap(3),
                    Icon(PhosphorIconsFill.sealCheck,color : AppColors.white, size: 24),
                  ],
                ), 
                Text('Open edition 0.22APT',style: TextStyle(
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
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.black,
                ),
                child: Text(
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

  Widget _buildCategoryHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
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
          )
        ],
      ),
    );
  }

  Widget _buildNFTSGrid(BuildContext context) {
    final nftImages = [
      "https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000",
    ];
    final width = context.screenWidth;
    final height = context.screenHeight;
    return SizedBox(
      height: height *.285 * 2,
      child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                mainAxisExtent: height* .285,
              ),
              itemCount: nftImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical:4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getNftAsset(
                          context: context,
                          imageUrl: nftImages[index],
                          ),
                      const Gap(6),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width / 3),
                        child: Text(
                          'Cyberpunk kid #6823',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyDark),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Gap(3),
                     Text('0.0APT',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                );
              },
            ),
    );
  }
  
  Widget _getNftAsset(
      {required BuildContext context,
      required String? imageUrl,}) {
    final width = context.screenWidth;
    if (imageUrl == null) {
      return const CircleAvatar(radius: 22, backgroundColor: Colors.amber);
    } else {
      //two cases - ipfs and url to call
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width * .5,
          height: width * .45,
          imageUrl: imageUrl,
          errorWidget: (ctx, str, obg) => Container(color: Colors.amber),
          progressIndicatorBuilder: (ctx, str, download) =>
              const CircularProgressIndicator(),
        ),
      );
    }
  }
}