import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
// import 'package:defy/config/assets.gen.dart';
import '../../../core/extensions/context_extensions.dart';
import 'shared/social_tile.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // Static data
    final Map<String, Object> coin = <String, Object>{
      'coin_description': 'Take the red bean to join the garden. View the collection at azuki.com/gallery.',
      'coin_link': <String, String>{
        'website': 'https://website.com',
        'twitter': 'https://twitter.com',
        'discord': 'https://discord.com',
        'whitepaper': 'https://whitepaper.com',
      },
      'coin_defyapp_symbol': 'APT',
      'coin_name': 'Aptos Coin',
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.h),
          Text('DESCRIPTION', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 10.h),
          Text(
            coin['coin_description']! as String,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyDark,
            ),
          ),
          SizedBox(height: 30.h),
          Text('SOCIALS', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                if ((coin['coin_link']! as Map<String, String>)['website'] != null)
                  const SocialTile(
                    icon: PhosphorIconsBold.globe,
                    label: 'Website',
                  ),
                Gap(8.w),
                if ((coin['coin_link']! as Map<String, String>)['twitter'] != null)
                  const SocialTile(
                    icon: PhosphorIconsBold.twitterLogo,
                    label: 'Twitter',
                  ),
                Gap(8.w),
                if ((coin['coin_link']! as Map<String, String>)['discord'] != null)
                  const SocialTile(
                    icon: PhosphorIconsBold.discordLogo,
                    label: 'Discord',
                  ),
                Gap(8.w),
                if ((coin['coin_link']! as Map<String, String>)['whitepaper'] != null)
                  const SocialTile(
                    icon: PhosphorIconsBold.scroll,
                    label: 'Whitepaper',
                  ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text('PERKS (1)', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(10.h),
          Row(
            children: <Widget>[
              Text(
                'Users helping us add perks will be rewarded  ',
                style: context.bodySmall?.copyWith(
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
              Icon(
                PhosphorIconsFill.info,
                color: Colors.black.withValues(alpha: 0.5),
                size: 16.sp,
              ),
            ],
          ),
          Gap(20.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.w),
                  width: context.screenWidth * 0.55,
                  height: context.screenWidth * 0.35,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/cosmos-bg.png'),
                      fit: BoxFit.fill,
                    ),
                    color: const Color(0xffF4F4F6),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/rocket.png',
                            height: context.screenHeight * 0.045,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Cosmos',
                        style: context.titleLarge
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Free Entry for Virtual Cosmic \nEvent',
                        style: context.bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ),
          Gap(20.h),
          Text('SIMILAR NFTS', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(10.h),
          Container(
            padding: EdgeInsets.all(15.w),
            height: context.screenWidth * 0.3,
            width: context.screenWidth * 0.45,
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F6),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/gui-inu.png',
                      height: context.screenWidth * 0.09,
                    ),
                    Text(
                      '↑ 3.16%',
                      style: context.titleMedium?.copyWith(
                        color: const Color(0xff4EB13D),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Gui Inu',
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'GUI',
                  style: context.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text('PRICE SIMULATION', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(6.h),
          Text(
            'The Price of APT with the market cap of another assets',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyLight,
            ),
          ),
          SizedBox(height: 20.h),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/gui-inu.png',
                        height: 40.h,
                      ),
                      Gap(12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Gui Inu',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'GUI',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            r'$142.39',
                            style: context.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'x0.10021',
                            style: context.bodyMedium?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Gap(35.h),
          Text('CALCULATOR', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(12.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('assets/icons/aptos-logo.png',
                            height: 24.h,),
                        SizedBox(width: 10.w),
                        Text(
                          (coin['coin_defyapp_symbol'] as String?)?.toUpperCase() ?? '',
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      width: context.screenWidth * 0.45,
                      height: context.screenWidth * 0.125,
                      decoration: BoxDecoration(
                        color: const Color(0xffF4F4F6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '90.02',
                            style: context.titleMedium?.copyWith(
                              color: Colors.black.withValues(alpha: 0.5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('assets/icons/usdc.png',
                            height: 24.h,),
                        SizedBox(width: 10.w),
                        Text('USDC', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      width: context.screenWidth * 0.45,
                      height: context.screenWidth * 0.125,
                      decoration: BoxDecoration(
                        color: const Color(0xffF4F4F6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '90.02',
                            style: context.titleMedium?.copyWith(
                              color: Colors.black.withValues(alpha: 0.5),
                              fontWeight: FontWeight.w600,
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
          SizedBox(height: 20.h),
          Text('ADDITIONAL INFO', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: const Color(0xffF4F4F6),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      PhosphorIconsRegular.scroll,
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 24.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Contract',
                      style: context.titleMedium?.copyWith(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      truncateMiddle('0x1::aptos_coin::AptosCoin'),
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      PhosphorIconsRegular.link,
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 24.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Chain',
                      style: context.titleMedium?.copyWith(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      getChainName(coin['coin_name'] as String?),
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      PhosphorIconsRegular.asterisk,
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 24.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Token Standard',
                      style: context.titleMedium?.copyWith(
                        color: Colors.black.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'ERC-721',
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  String truncateMiddle(String text, {int startLength = 4, int endLength = 4}) {
    if (text.length <= startLength + endLength) {
      return text;
    }
    return '${text.substring(0, startLength)}..${text.substring(text.length - endLength)}';
  }

  String getChainName(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }
    return text.split(' ').first.toUpperCase();
  }
}
