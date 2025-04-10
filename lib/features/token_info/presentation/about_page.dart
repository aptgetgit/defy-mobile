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
  double _investmentAmount = 10000;
  String _timePeriod = '1M';

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
          Gap(20.h),
          Text('SIMILAR TOKENS', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
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
                          fontWeight: FontWeight.w500,
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
                Gap(16.w),
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
                            'assets/icons/bluemove.png',
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
                        'Bluemove',
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'MOVE ',
                        style: context.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(16.w),
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
                            'assets/icons/pancake.png',
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
                        'Pancake',
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'CAKE',
                        style: context.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(35.h),
          Text('CALCULATOR', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          Gap(16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Invested amount', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                  Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                ],
              ),
              Gap(12.h),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4.h,
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Slider(
                    value: _investmentAmount,
                    max: 50000,
                    divisions: 500,
                    label: '\$${_investmentAmount.round()}',
                    onChanged: (double value) => setState(() => _investmentAmount = value),
                    activeColor: AppColors.blue,
                    inactiveColor: AppColors.blue.withOpacity(0.25),
                  ),
                ),
              ),
              Gap(24.h),
              Text('Over the past', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
              Gap(21.h),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _timePeriod = '1M'),
                    child: Container(
                      width: 54.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: _timePeriod == '1M' ? AppColors.blue : AppColors.transparent),
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.greyVeryLight,
                      ),
                      child: Center(
                        child: Text(
                          '1M',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _timePeriod == '1M' ? Colors.blue : AppColors.greyLight,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(13.w),
                  GestureDetector(
                    onTap: () => setState(() => _timePeriod = '3M'),
                    child: Container(
                      width: 54.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: _timePeriod == '3M' ? AppColors.blue : AppColors.transparent),
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.greyVeryLight,
                      ),
                      child: Center(
                        child: Text(
                          '3M',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _timePeriod == '3M' ? Colors.blue : AppColors.greyLight,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(13.w),
                  GestureDetector(
                    onTap: () => setState(() => _timePeriod = '6M'),
                    child: Container(
                      width: 54.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: _timePeriod == '6M' ? AppColors.blue : AppColors.transparent),
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.greyVeryLight,
                      ),
                      child: Center(
                        child: Text(
                          '6M',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _timePeriod == '6M' ? Colors.blue : AppColors.greyLight,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(13.w),
                  GestureDetector(
                    onTap: () => setState(() => _timePeriod = '1Y'),
                    child: Container(
                      width: 54.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: _timePeriod == '1Y' ? AppColors.blue : AppColors.transparent),
                        borderRadius: BorderRadius.circular(40.r),
                        color: AppColors.greyVeryLight,
                      ),
                      child: Center(
                        child: Text(
                          '1Y',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _timePeriod == '1Y' ? Colors.blue : AppColors.greyLight,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                children: <Widget>[
                  Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500)),
                  Gap(4.w),
                  Text('would have become', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                  Gap(4.w),
                  Text(r'$432.23', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  Gap(4.w),
                  Text('(+2.12%)', style: TextStyle(fontSize: 14.sp, color: Colors.green, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          Gap(35.h),
          Text('ADDITIONAL INFO', style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 10.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Contract Address',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.greyLight,
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
              Gap(10.h),
              Row(
                children: <Widget>[
                  Text(
                    'MCAP',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$12.54B',
                    overflow: TextOverflow.ellipsis,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Row(
                children: <Widget>[
                  Text(
                    'FDV',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                     '\$23.25M',
                    overflow: TextOverflow.ellipsis,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Row(
                children: <Widget>[
                  Text(
                    'Total Supply',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                     '#4',
                    overflow: TextOverflow.ellipsis,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Row(
                children: <Widget>[
                  Text(
                    'Circulating Supply',
                    style: context.titleMedium?.copyWith(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                     '\$23.25M',
                    overflow: TextOverflow.ellipsis,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
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
