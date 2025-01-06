import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_buyers.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_sellers.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/nft_collections/nft_collection_piechart.dart';

import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_buyers.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_sellers.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_collections/nft_collection_analytics_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/nft_collections/nft_collection_piechart.dart';

class NFTCollectionAnalyticsTab extends StatefulWidget {
  const NFTCollectionAnalyticsTab({super.key});

  @override
  State<NFTCollectionAnalyticsTab> createState() =>
      _NFTCollectionAnalyticsTabState();
}

class _NFTCollectionAnalyticsTabState extends State<NFTCollectionAnalyticsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Gap(30),
                  Text(
                    "Holding Amount Distribution",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                      fontSize: 18,
                    ),
                  ),
                  NFTCollectionPiechart(),
                ],
              ),
            ),
            const Gap(32),
            Text(
              "Blue Chip",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Gap(20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "33.77%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "NCBP",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "2273",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Blue Chip Owner",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "8183",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Owner Count",
                          style: TextStyle
                          (
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Gap(30),
            NFTCollectionAnalyticsTable(),
            const Gap(45),
            NFTCollectionAnalyticsBuyers(),
            const Gap(45),
            NFTCollectionAnalyticsSellers(),
            const Gap(60)
          ],
        ),
      ),
    );
  }
}
