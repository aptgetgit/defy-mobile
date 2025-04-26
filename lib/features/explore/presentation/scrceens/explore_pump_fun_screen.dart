import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/navigation/routes/router.dart';

class ExplorePumpFunScreen extends StatefulWidget {
  const ExplorePumpFunScreen({super.key});

  @override
  State<ExplorePumpFunScreen> createState() => _ExplorePumpFunScreenState();
}

class _ExplorePumpFunScreenState extends State<ExplorePumpFunScreen> {
  final TextEditingController _searchConroller = TextEditingController();

  @override
  void dispose() {
    _searchConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pump Fun',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: IconButton(
                icon: Icon(PhosphorIconsFill.plusCircle, size: 36.sp),
                onPressed: () => const CreateTokenScreenRoute().push(context),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xfff4f4f6),
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
                _buildPumpFunTile(context),
              ],
            ),
          ),
        ),
      );

  Widget _buildPumpFunTile(BuildContext context) {
    final double width = context.screenWidth;
    final List<String> nftImages = <String>[
      'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
      'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: nftImages.length,
      itemBuilder: (BuildContext ctx, int index) => GestureDetector(
        onTap: () {
          const ExplorePumpFunTokenTransactionsScreenRoute().push(context);
        },
        child: Container(
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight2,
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
                  errorWidget: (BuildContext ctx, String str, Object obj) =>
                      Container(color: Colors.amber),
                  progressIndicatorBuilder: (BuildContext ctx, String str,
                          DownloadProgress download) =>
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
                        color: AppColors.greyLight,
                      ),
                    ),
                    Gap(6.h),
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
                            text: 'MCAP: ',
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
                            text: 'Replies: ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
