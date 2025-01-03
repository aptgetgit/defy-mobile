import 'dart:ui';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:defy/features/shared/presentation/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTMintDetailsView extends ConsumerStatefulWidget {
  const NFTMintDetailsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NFTMintDetailsViewState();
}

class _NFTMintDetailsViewState extends ConsumerState<NFTMintDetailsView> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.12;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 164.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/nft-bg-header.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
                    child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(size / 2),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: size,
                            width: size,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(size / 2)),
                            child: Center(
                              child: Icon(
                                PhosphorIconsBold.caretLeft,
                                size: size * 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Drunk & Dope Kids',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4.h),
                      Text('By Jerrold',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyLight)),
                    ],
                  ),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(PhosphorIconsBold.dotsThreeVertical,
                          color: AppColors.grey, size: 20))
                ],
              ),
            ),
            SizedBox(height: 10.h),
            ExpandableTextWidget(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus ut ante fermentum aliquam. Donec auctor, nunc nec ultricies ultricies, nunc nisl ultricies nunc, nec ultricies nunc nisl nec nunc. Nulla nec purus ut ante fermentum aliquam. Donec auctor, .',
  style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RowSuper(
                    innerDistance: -12,
                    children: [
                      Image.asset('assets/images/rocket.png', height: 20),
                      Image.asset('assets/images/rocket.png', height: 20),
                      Image.asset('assets/images/rocket.png', height: 20),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'James, Jane',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    ' +2 others minted',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 352.h,
              width: 352.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyVeryLight, width: 2),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/cyborg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: Text(
            //     'Mint Schedule',
            //     style: TextStyle(
            //       fontSize: 18.sp,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Image.asset('assets/images/mint_widget.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonColor1: AppColors.black,
        buttonColor2: AppColors.black,
        buttonText1: 'Mint Now',
        buttonText2: 'Mint Now',
        onTap1: () {},
        onTap2: () {},
        dualButton: true,
        upperWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Whitelist Stage',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenLight,
                ),
              ),
              const Spacer(),
              Text(
                'Price 0.07 APT',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        isLeftWidgetCustom: true,
        leftCustomWidget: Container(
          margin: const EdgeInsets.only(left: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.white,
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(PhosphorIconsRegular.minus,
                    size: 20, color: AppColors.black),
              ),
              Text(
                '1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(PhosphorIconsRegular.plus,
                    size: 20, color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
