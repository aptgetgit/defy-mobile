import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../shared/presentation/widgets/custom_button.dart';

class ExploreDappsScreen extends StatefulWidget {
  const ExploreDappsScreen({super.key});

  @override
  State<ExploreDappsScreen> createState() => _ExploreDappsScreenState();
}

class _ExploreDappsScreenState extends State<ExploreDappsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600), // Total animation duration
      vsync: this,
    );
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

  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dapps',
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
                    color: const Color(0xfff4f4f6),
                    borderRadius: BorderRadius.circular(58),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(16),
                      const Icon(
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
                            hintText: 'Search or paste URL',
                            hintStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
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
                const Gap(8),

                SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Top Dapps',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      _buildDappTile(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  Widget _buildDappTile(BuildContext context) {
  final double width = context.screenWidth;
  final List<AssetGenImage> dapps = [
    Assets.icons.uniswapDappLogo,
    Assets.icons.uniswapDappLogo,
    Assets.icons.uniswapDappLogo,
  ];
  final List<String> dappNames = [
    'Uniswap',
    'Petra Wallet',
    'Rainbow',
  ];
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: dapps.length,
    itemBuilder: (ctx, index) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: _buildDappModalSheet,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              dapps[index].image(width: width * .12),
              const SizedBox(width: 12), // Add space between image and text
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        dappNames[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(12),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'DeFi',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Staking',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width - width * .3),
                    child: const Text(
                      'Uniswap allows direct crypto swapping without middlemen, using automated...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
  );
}


  Widget _buildDappModalSheet(BuildContext context) {
    final List<String> coinsLogos = <String>[
      'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
      'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
      'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
      'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    ];
    final double width = context.screenWidth;
    final double height = context.screenHeight;
    return Container(
       padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Assets.icons.uniswapDexLogo.image(width: width * .16),
                const Gap(3),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Uniswap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'DeFi',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Staking',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    PhosphorIconsBold.x,
                    size: 26,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),

            //description
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Swap cryptocurrencies directly without intermediaries on Uniswap's automated platform.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyLight,
                ),
                maxLines: 2, // Maximum lines before wrapping
                overflow: TextOverflow.ellipsis, // Truncate if the text is too long
                softWrap: false, // Disable wrapping
              ),
              
            ),
            const Gap(26),

            //network
            Row(
              children: [
                const Icon(
                  PhosphorIconsBold.shareNetwork,
                  color: AppColors.greyLight,
                  size: 20,
                ),
                const Gap(12),
                const Text(
                  'Network',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      height: width * .06,
                      width: width * .05 * 4,
                      child: Stack(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Positioned(
                              left: i * width * .04,
                              child: Image.network(
                                coinsLogos[i],
                                width: width * .06,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Text(
                      '+2',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    )
                  ],
                ),
              ],
            ),

            const Gap(12),

            //socials
            Row(
              children: [
                const Icon(
                  PhosphorIconsBold.cellSignalHigh,
                  color: AppColors.greyLight,
                  size: 20,
                ),
                const Gap(12),
                const Text(
                  'Socials',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(PhosphorIconsBold.globe,size: 18,color: AppColors.greyLight,),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(PhosphorIconsBold.twitterLogo,size: 18,color: AppColors.greyLight,),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(PhosphorIconsBold.discordLogo,size: 18,color: AppColors.greyLight,),
                    ),
                  ],
                ),
              ],
            ),

            const Gap(28),

            //skip page descrition
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: false, 
                    onChanged: (v){},
            side: const BorderSide(
              color: AppColors.greyMedium,
              width: 1,
            ),
                    ),),
                    const Gap(4),
                const Flexible(
                  child: Text(
                    'Skip this page next time and go directly to Uniswap',
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                    ),
                      maxLines: 2, // Maximum lines before wrapping
                      overflow: TextOverflow.ellipsis, // Truncate if the text is too long
                      softWrap: false, // Disable wrapping
                    ),
                ),
              ],
            ),
            const Gap(12),

            //launch button
            ActiveButton(
              label: 'Launch App',
              fontSize: 16,
              
              height: 48,
              width: 361,
              onTap: (){},
              isDarkMode: false,
              
            ),
          ],
        ),
        );
  }
}