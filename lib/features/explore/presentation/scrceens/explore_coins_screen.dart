import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/navigation/routes/router.dart';
import '../widgets/coins_category_header.dart';
import '../widgets/coins_list_item.dart';

class ExploreCoinsScreen extends StatefulWidget {
  const ExploreCoinsScreen({super.key});

  @override
  State<ExploreCoinsScreen> createState() => _ExploreCoinsScreenState();
}

class _ExploreCoinsScreenState extends State<ExploreCoinsScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchConroller = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 650),
      vsync: this,
    );
    // Define a combined slide + bounce animation
    _slideAnimation = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.05),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0, -0.05),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 25,
      ),
    ]).animate(_animationController);

    // Define a combined slide + bounce animation
    _slideAnimation2 = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, 0.05),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 20,
      ),
    ]).animate(_animationController);
    
    // Start the animation
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
      backgroundColor: AppColors.greyVeryLight2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  children: <Widget>[
                    Icon(PhosphorIconsBold.caretLeft, size: 20.sp),
                    Gap(12.w),
                    Expanded(
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              Gap(12.h),

              _buildTopBanner(context),

              SlideTransition(
                position: _slideAnimation2,
                child: Column(
                  children: <Widget>[
                    CategoryHeader('Uptos Pump', () => const ExplorePumpFunScreenRoute().push(context)),
                    _buildPumpFunTile(context),
                  ],
                ),
              ),

              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: <Widget>[
                    CategoryHeader('Top MCAP Coins', () {}),
                    _buildCoinsList(context, CoinListType.mcap),
                  ],
                ),
              ),

              CategoryHeader('Top Meme Coins', () {}),
              _buildCoinsList(context, CoinListType.meme),

              CategoryHeader('Top Volume', () {}),
              _buildCoinsList(context, CoinListType.volume),

              CategoryHeader('Highest Gainers', () {}),
              _buildCoinsList(context, CoinListType.gainers, bottomPadding: 16.h),
            ],
          ),
        ),
      ),
    );

  Widget _buildTopBanner(BuildContext context) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 0,
      margin: EdgeInsets.all(16.w),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildTabButton('Meme coins 🔥', isActive: true, width: 126.w),
                SizedBox(width: 8.w),
                _buildTabButton('MCAP Coins', isActive: false, width: 109.w),
              ],
            ),
            SizedBox(height: 16.h),
            _buildListItem(
              context,
              iconUrl: 'https://via.placeholder.com/40',
              title: 'Bonk',
              subtitle: 'BONK',
              change: '2.5%',
            ),
            _buildListItem(
              context,
              iconUrl: 'https://via.placeholder.com/40',
              title: 'GUI',
              subtitle: 'GUI',
              change: '2.5%',
            ),
            _buildListItem(
              context,
              iconUrl: 'https://via.placeholder.com/40',
              title: 'Bonk',
              subtitle: 'BONK',
              change: '2.5%',
            ),
          ],
        ),
      ),
    );

  Widget _buildTabButton(String label, {required bool isActive, double? width, double? height}) => Container(
      constraints: BoxConstraints(
        minWidth: 126.w,
      ),
      height: height ?? 34.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: isActive
            ? Border.all(color: Colors.transparent)
            : Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.orange : Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );


  Widget _buildListItem(
    BuildContext context, {
    required String iconUrl,
    required String title,
    required String subtitle,
    required String change,
  }) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(iconUrl),
            radius: 20.r,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              Icon(PhosphorIconsFill.caretUp, color: Colors.green, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                change,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );

  Widget _buildPumpFunTile(BuildContext context) {
    final double width = context.screenWidth;
    final List<String> nftImages = <String>[
      'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
    ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext ctx, int index) => Container(
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: width * .28,
                  height: width * .28,
                  imageUrl: nftImages[index],
                  errorWidget: (BuildContext ctx, String str, Object obj) => Container(color: Colors.amber),
                  progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                      CircularProgressIndicator(strokeWidth: 2.w),
                ),
              ),
              Gap(8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'APTMAN (APTMAN)',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Are you APTMAN?',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,),
                    ),
                    Gap(10.h),
                    RichText(
                      text: TextSpan(
                        text: 'Created by ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'TheWeimals',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'MCAP:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyLight,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '313',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Replies:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '1,322',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
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
    );
  }

  Widget _buildCoinsList(BuildContext context, CoinListType type, {double? bottomPadding}) {
    final List<String> coinsLogos = _getCoinsLogos(type);
    final double width = context.screenWidth;
    
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 0),
      child: SizedBox(
        height: width * .33,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: coinsLogos.length,
          itemBuilder: (BuildContext ctx, int index) => CoinListItem(
            type: type,
            logoUrl: coinsLogos[index],
            width: width,
          ),
        ),
      ),
    );
  }
  
  List<String> _getCoinsLogos(CoinListType type) {
    if (type == CoinListType.meme) {
      return <String>[
        'https://cryptologos.cc/logos/bonk1-bonk-logo.png?v=035',
        'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
        'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
        'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
      ];
    }
    return <String>[
      'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
      'https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png',
      'https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png',
      'https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png',
    ];
  }
}
