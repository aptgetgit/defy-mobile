import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
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
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
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
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        'Dapps',
        style: TextStyle(
          fontSize: 20.sp, // Updated to use screenutil
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // Updated to use screenutil
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Search bar
              Container(
                width: double.infinity,
                height: 48.h, // Updated to use screenutil
                decoration: BoxDecoration(
                  color: const Color(0xfff4f4f6),
                  borderRadius: BorderRadius.circular(58.r), // Updated to use screenutil
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Gap(16.w), // Updated to use screenutil
                    Icon(
                      PhosphorIconsBold.magnifyingGlass,
                      color: AppColors.greyMedium,
                      size: 18.sp, // Updated to use screenutil
                    ),
                    Gap(8.w), // Updated to use screenutil
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search or paste URL',
                          hintStyle: TextStyle(
                            color: AppColors.greyMedium,
                            fontSize: 16.sp, // Updated to use screenutil
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      PhosphorIconsBold.cards,
                      color: AppColors.greyMedium,
                      size: 18.sp, // Updated to use screenutil
                    ),
                    Gap(16.w), // Updated to use screenutil
                  ],
                ),
              ),
              Gap(8.h), // Updated to use screenutil

              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h), // Updated to use screenutil
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Top Dapps',
                          style: TextStyle(
                            fontSize: 18.sp, // Updated to use screenutil
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
    final List<AssetGenImage> dapps = <AssetGenImage>[
      Assets.icons.uniswapDappLogo,
      Assets.icons.uniswapDappLogo,
      Assets.icons.uniswapDappLogo,
    ];
    final List<String> dappNames = <String>[
      'Uniswap',
      'Petra Wallet',
      'Rainbow',
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dapps.length,
      itemBuilder: (BuildContext ctx, int index) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: _buildDappModalSheet,
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.h), // Updated to use screenutil
          child: Row(
            children: <Widget>[
              dapps[index].image(width: 0.12.sw), // Updated to use screenutil
              SizedBox(width: 12.w), // Updated to use screenutil
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        dappNames[index],
                        style: TextStyle(
                          fontSize: 16.sp, // Updated to use screenutil
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(12.w), // Updated to use screenutil
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w), // Updated to use screenutil
                        margin: EdgeInsets.symmetric(horizontal: 3.w), // Updated to use screenutil
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30.r), // Updated to use screenutil
                        ),
                        child: Text(
                          'DeFi',
                          style: TextStyle(
                            fontSize: 14.sp, // Updated to use screenutil
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w), // Updated to use screenutil
                        margin: EdgeInsets.symmetric(horizontal: 3.w), // Updated to use screenutil
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight2,
                          borderRadius: BorderRadius.circular(30.r), // Updated to use screenutil
                        ),
                        child: Text(
                          'Staking',
                          style: TextStyle(
                            fontSize: 14.sp, // Updated to use screenutil
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 0.7.sw), // Updated to use screenutil
                    child: Text(
                      'Uniswap allows direct crypto swapping without middlemen, using automated...',
                      style: TextStyle(
                        fontSize: 14.sp, // Updated to use screenutil
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
    // final List<String> coinsLogos = <String>[
    //   'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
    //   'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
    //   'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
    //   'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    // ];
    
    return Container(
      padding: EdgeInsets.all(16.w), // Updated to use screenutil
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Header
          Row(
            children: <Widget>[
              Assets.icons.uniswapDexLogo.image(width: 0.16.sw), // Updated to use screenutil
              Gap(3.w), // Updated to use screenutil
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Uniswap',
                    style: TextStyle(
                      fontSize: 16.sp, // Updated to use screenutil
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  PhosphorIconsBold.x,
                  size: 26.sp, // Updated to use screenutil
                  color: AppColors.greyLight,
                ),
              ),
            ],
          ),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h), // Updated to use screenutil
            child: Text(
              "Swap cryptocurrencies directly without intermediaries on Uniswap's automated platform.",
              style: TextStyle(
                fontSize: 14.sp, // Updated to use screenutil
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          Gap(26.h), // Updated to use screenutil

          // Network
          Row(
            children: <Widget>[
              Icon(
                PhosphorIconsBold.shareNetwork,
                color: AppColors.greyLight,
                size: 20.sp, // Updated to use screenutil
              ),
              Gap(12.w), // Updated to use screenutil
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 16.sp, // Updated to use screenutil
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w), // Updated to use screenutil
                    margin: EdgeInsets.symmetric(horizontal: 3.w), // Updated to use screenutil
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      borderRadius: BorderRadius.circular(30.r), // Updated to use screenutil
                    ),
                    child: Text(
                      'DeFi',
                      style: TextStyle(
                        fontSize: 14.sp, // Updated to use screenutil
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w), // Updated to use screenutil
                    margin: EdgeInsets.symmetric(horizontal: 3.w), // Updated to use screenutil
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      borderRadius: BorderRadius.circular(30.r), // Updated to use screenutil
                    ),
                    child: Text(
                      'Staking',
                      style: TextStyle(
                        fontSize: 14.sp, // Updated to use screenutil
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Gap(12.h), // Updated to use screenutil

          // Socials
          Row(
            children: <Widget>[
              Icon(
                PhosphorIconsBold.cellSignalHigh,
                color: AppColors.greyLight,
                size: 20.sp, // Updated to use screenutil
              ),
              Gap(12.w), // Updated to use screenutil
              Text(
                'Socials',
                style: TextStyle(
                  fontSize: 16.sp, // Updated to use screenutil
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6.w), // Updated to use screenutil
                    margin: EdgeInsets.symmetric(horizontal: 4.w), // Updated to use screenutil
                    decoration: const BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      PhosphorIconsBold.globe, 
                      size: 18.sp, // Updated to use screenutil
                      color: AppColors.greyLight,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6.w), // Updated to use screenutil
                    margin: EdgeInsets.symmetric(horizontal: 4.w), // Updated to use screenutil
                    decoration: const BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      PhosphorIconsBold.twitterLogo, 
                      size: 18.sp, // Updated to use screenutil
                      color: AppColors.greyLight,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6.w), // Updated to use screenutil
                    margin: EdgeInsets.symmetric(horizontal: 4.w), // Updated to use screenutil
                    decoration: const BoxDecoration(
                      color: AppColors.greyVeryLight2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      PhosphorIconsBold.discordLogo,
                      size: 18.sp, // Updated to use screenutil
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Gap(28.h), // Updated to use screenutil

          // Skip page description
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: false, 
                  onChanged: (bool? v){},
                  side: const BorderSide(
                    color: AppColors.greyMedium,
                  ),
                ),
              ),
              Gap(4.w), // Updated to use screenutil
              Flexible(
                child: Text(
                  'Skip the popup next time for this app.',
                  style: TextStyle(
                    fontSize: 14.sp, // Updated to use screenutil
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
          Gap(12.h), // Updated to use screenutil

          // Launch button
          ActiveButton(
            label: 'Launch App',
            fontSize: 16.sp, // Updated to use screenutil
            height: 48.h, // Updated to use screenutil
            width: 1.sw - 32.w, // Full width minus padding
            onTap: (){},
            isDarkMode: false,
          ),
        ],
      ),
    );
  }
}
