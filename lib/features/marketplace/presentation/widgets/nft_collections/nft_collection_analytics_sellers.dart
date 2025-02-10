import 'package:defy/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../bin/nft_collection_analytics_buysell_tile.dart';

class NFTCollectionAnalyticsSellers extends StatefulWidget {
  const NFTCollectionAnalyticsSellers({super.key});

  @override
  State<NFTCollectionAnalyticsSellers> createState() => _NFTCollectionAnalyticsSellersState();
}

class _NFTCollectionAnalyticsSellersState extends State<NFTCollectionAnalyticsSellers> {

  int filterIndex = 0;

  void change(int i){
    setState(() {
      filterIndex = i;
    });
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Top 10 Buyers",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),
              ),
              const Spacer(),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: filterIndex == 0 ? AppColors.greyVeryLight : AppColors.transparent
                ),
                child: Center(
                  child: Text(
                    "All",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: filterIndex == 0 ? AppColors.black : AppColors.greyLight
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: filterIndex == 1 ? AppColors.greyVeryLight : AppColors.transparent
                ),
                child: Center(
                  child: Text(
                    "1D",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: filterIndex == 1 ? AppColors.black : AppColors.greyLight
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: filterIndex == 2 ? AppColors.greyVeryLight : AppColors.transparent
                ),
                child: Center(
                  child: Text(
                    "1M",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: filterIndex == 2 ? AppColors.black : AppColors.greyLight
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: filterIndex == 3 ? AppColors.greyVeryLight : AppColors.transparent
                ),
                child: Center(
                  child: Text(
                    "1Y",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: filterIndex == 3 ? AppColors.black : AppColors.greyLight
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: AppColors.greyVeryLight
                ),
                child: Center(
                  child: Icon(
                    PhosphorIconsBold.calendarBlank,
                    size: 16,
                    color: AppColors.greyDark,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "#",
                  style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "ADDRESS",
                  style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BOUGHT",
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "VOLUME",
                      style: TextStyle(
                          color:AppColors. greyDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),),
            ],
          ),
          const Gap(6),
          const Divider(
            thickness: 1,
            color: AppColors.greyMedium,
          ),
          const Gap(16),
          AnimatedCrossFade(
            firstChild: Column(
              children: [
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyLight
                            ),
                          ),
                        ),
                        const Gap(4),
                        Icon(
                          PhosphorIconsBold.caretDown,
                          size: 16,
                          color:AppColors. greyLight,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            secondChild: Column(
              children: [
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                NFTCollectionAnalyticsBuysellTile(),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "See less",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyLight
                          ),
                        ),
                        const Gap(4),
                        Icon(
                          PhosphorIconsBold.caretUp,
                          size: 16,
                          color:AppColors. greyLight,
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ), crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst, duration: Duration(milliseconds: 400),
          ),


        ],
      ),
    );
  }
}
