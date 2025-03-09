
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';

class ExploreMarketScreen extends StatefulWidget {
  const ExploreMarketScreen({super.key});

  @override
  State<ExploreMarketScreen> createState() => _ExploreMarketScreenState();
}

class _ExploreMarketScreenState extends State<ExploreMarketScreen> with SingleTickerProviderStateMixin{
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800), // Total animation duration
      vsync: this,
    );
    // Define a combined slide + bounce animation
    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, 1), // Start off-screen
          end: Offset.zero, // Slide into position
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 80, // Slide takes up 80% of the duration
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero, // From resting position
          end: const Offset(0, -0.01), // Slight bounce up
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 10, // Bounce up takes 10%
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.01), // From bounce peak
          end: Offset.zero, // Settle back to resting
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 10, // Settle back takes 10%
      ),
    ]).animate(_animationController);
    
    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(PhosphorIconsBold.caretLeft),
        ),
        centerTitle: true,
        title: const Text(
          'Market Explore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xfff4f4f6),
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
                          controller: _searchController,
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
              ),
              const Gap(12),

              //banners scroll
              _buildTopBanner(context),

              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: <Widget>[
                    _buildCategoryHeader('Vaults', () {}),
                    _buildVaultTile(context),
                    _buildCategoryHeader('Yield Strategies', () {}),
                    _buildYieldStrategies(context),
                    _buildCategoryHeader('Leverage Trade', () {}),
                    _buildYLeverageTrade(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  Widget _buildCategoryHeader(String title, VoidCallback onTap) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue, size: 16),
              ],
            ),
          ),
        ],
      ),
    );

Widget _buildTopBanner(BuildContext context) {
  final double width = context.screenWidth;
  return SizedBox(
    height: width * .6,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext ctx, int index) => Container(
          margin: const EdgeInsets.only(left: 18),
          width: width * .55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              image: AssetImage('assets/images/market-phone.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              // Gradient overlay (bottom to top, black)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[Colors.black.withValues(alpha: 0.6), Colors.transparent],
                    ),
                  ),
                ),
              ),

              // Top left container
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.white.withValues(alpha: .2),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        PhosphorIcons.usersThree(),
                        color: AppColors.white,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '562',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
              const Positioned(
                bottom: 12,
                left: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text "Basket of Fun"
                    Text(
                      'Basket of Fun',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 4), // Space between text and icon
                    Row(
                      children: <Widget>[
                        Icon(
                          PhosphorIconsFill.caretUp,
                          color: AppColors.green,
                          size: 14,
                        ),
                        SizedBox(width: 4), // Space between icon and text
                        Text(
                          '22.71%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.green,
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
    ),
  );
}




  Widget _buildVaultTile(BuildContext context) {
    final double width = context.screenWidth;
    final List<String> coinsLogos = <String>[
      'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
      'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
      'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
      'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext ctx, int index) => Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight2,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Basket of memes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(4),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: width * .06,
                    width: width * .055 * 4,
                    child: Stack(
                      children: <Widget>[
                        for (int i = 0; i < 4; i++)
                          Positioned(
                            left: i * width * .045,
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
                  ),
                ],
              ),
              const Gap(14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Investors',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                  Text(
                    'All time Returns',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              const Row(
                children: <Widget>[
                  Text(
                    '562',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(PhosphorIconsFill.caretUp, color: AppColors.green),
                  Text(
                    '22.71%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildYieldStrategies(BuildContext context) {
    final double width = context.screenWidth;
    final List<String> coinsLogos = <String>[
      'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
      'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
      'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
      'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    ];
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: coinsLogos.length,
        itemBuilder: (BuildContext ctx, int index) => ListTile(
            horizontalTitleGap: 12,
            leading: Image.network(
              coinsLogos[index],
              width: width * .1,
            ),
            title: const Text(
              'APTOS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              r'$76.56M TVL',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,),
            ),
            trailing: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '56% APR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Variable',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,),
                ),
              ],
            ),
          ),);
  }

  Widget _buildYLeverageTrade(BuildContext context) {
  final double width = context.screenWidth;
  final List<String> coinsLogos = <String>[
    'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
    'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
    'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
    'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
  ];

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: coinsLogos.length,
    itemBuilder: (BuildContext ctx, int index) => ListTile(
        horizontalTitleGap: 12,
        leading: SizedBox(
          width: width * .08 * 1.5,  // Set width to allow enough space for overlapping logos
          child: Stack(
            clipBehavior: Clip.none, // Prevent clipping when positioning items outside bounds
            children: <Widget>[
              Align(
                child: Image.network(
                  coinsLogos[0],
                  width: width * .08,  // Adjust coin logo size
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.network(
                  coinsLogos[1],
                  width: width * .08,  // Adjust coin logo size
                ),
              ),
            ],
          ),
        ),
        title: const Text(
          'APT/USDC',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: RichText(
          text: const TextSpan(
            text: 'VOL ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.greyLight,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: r'$89M',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ),
        trailing: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              r'$14,900.84',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '+0.023%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
  );
}

}
