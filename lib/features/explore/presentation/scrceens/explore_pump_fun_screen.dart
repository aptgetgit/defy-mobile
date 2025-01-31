import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/app/routes/router.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExplorePumpFunScreen extends StatefulWidget {
  const ExplorePumpFunScreen({super.key});

  @override
  State<ExplorePumpFunScreen> createState() => _ExplorePumpFunScreenState();
}

class _ExplorePumpFunScreenState extends State<ExplorePumpFunScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pump Fun',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
              actions : [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: IconButton(
            icon: Icon(PhosphorIconsFill.plusCircle,size: 36,),
            onPressed: () => CreateTokenScreenRoute().push(context),
          ),
        ),
      ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xfff4f4f6),
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
              ),

              _buildPumpFunTile(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPumpFunTile(BuildContext context) {
    final width = context.screenWidth;
    final nftImages = [
      "https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000",
      "https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000",
    ];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: nftImages.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap : () {
            ExplorePumpFunTokenTransactionsScreenRoute().push(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight2,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: width * .28,
                    height: width * .28,
                    imageUrl: nftImages[index],
                    errorWidget: (ctx, str, obg) =>
                        Container(color: Colors.amber),
                    progressIndicatorBuilder: (ctx, str, download) =>
                        const CircularProgressIndicator(),
                  ),
                ),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'APTMAN (APTMAN)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Are you APTMAN?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight),
                    ),
                    const Gap(6),
                    RichText(
                      text: TextSpan(
                        text: 'Created by ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                        children: [
                          TextSpan(
                            text: 'TheWeimals',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'MCAP:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                            children: [
                              TextSpan(
                                text: '313',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Replies:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                            children: [
                              TextSpan(
                                text: '1,322',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
