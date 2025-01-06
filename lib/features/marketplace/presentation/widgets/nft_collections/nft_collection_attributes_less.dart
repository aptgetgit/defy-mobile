import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:math' as math;
class NFTCollectionAttributesLess extends StatefulWidget {
  final int volume;
  final int floor;
  final int totalSales;
  const NFTCollectionAttributesLess({
    Key? key,
    required this.volume,
    required this.floor,
    required this.totalSales
  }) : super(key: key);

  @override
  State<NFTCollectionAttributesLess> createState() => _NFTCollectionAttributesLessState();
}

class _NFTCollectionAttributesLessState extends State<NFTCollectionAttributesLess> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(14),
        _buildAttributeRow(
          icon1: PhosphorIconsBold.cube,
          title1: "Total Volume",
          value1: getVolumePriceInAPT(widget.volume) ?? 'N/A',
          icon2: PhosphorIconsBold.tag,
          title2: "Floor Price",
          value2: getFloorPriceInAPT(widget.floor),
        ),
        const Gap(14),
        _buildAttributeRow(
          icon1: PhosphorIconsBold.tagSimple,
          title1: "Best Offer",
          value1: "--",
          icon2: PhosphorIconsBold.currencyDollar,
          title2: "Total Sales",
          value2: formatNumber(widget.totalSales.toDouble()),
        ),
        const Gap(14),
        _buildAttributeRow(
          icon1: PhosphorIconsBold.tagSimple,
          title1: "Best Offer",
          value1: "--",
          icon2: PhosphorIconsBold.star,
          title2: "Listed",
          value2: "11%",
        ),
        const Gap(14),
        _buildAttributeRow(
          icon1: PhosphorIconsBold.tagSimple,
          title1: "Best Offer",
          value1: "--",
          icon2: PhosphorIconsBold.star,
          title2: "Listed",
          value2: "11%",
        ),
        const Gap(14),
        _buildAttributeRow(
          icon1: PhosphorIconsBold.cube,
          title1: "Owners(Unique)",
          value1: "44 (52%)",
          icon2: PhosphorIconsBold.arrowCircleUp,
          title2: "See Less",
          value2: "",
          isLastRow: true,
        ),
      ],
    );
  }

  Widget _buildAttributeRow({
    required IconData icon1,
    required String title1,
    required String value1,
    required IconData icon2,
    required String title2,
    required String value2,
    bool isLastRow = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAttributeItem(icon1, title1, value1),
        _buildAttributeItem(icon2, title2, value2, isLastItem: isLastRow),
      ],
    );
  }

  Widget _buildAttributeItem(IconData icon, String title, String value, {bool isLastItem = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(38),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 20,
                color: isLastItem && title == "See Less" ? AppColors.red : AppColors.greyDark,
              ),
            ),
          ),
          const Gap(6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isLastItem && title == "See Less" ? AppColors.red : AppColors.black,
                ),
              ),
              if (title != "See Less")
                Text(
                  title,
                  style: TextStyle(color: AppColors.greyDark),
                ),
            ],
          )
        ],
      ),
    );
  }

  String getVolumePriceInAPT(int? volume) {
    if (volume == null) {
      return 'N/A';
    }
    final volumePrice = volume / math.pow(10, 8);
    return '${formatNumber(volumePrice)} APT';
  }

  String formatNumber(double number) {
    if (number >= 1000000000000) {
      return '${(number / 1000000000000).toStringAsFixed(1)}T';
    } else if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toStringAsFixed(2);
    }
  }

  String getFloorPriceInAPT(int? floor) {
    if (floor == null) {
      return 'N/A';
    }
    final floorPrice = floor / math.pow(10, 8);
    return '${formatNumber(floorPrice)} APT';
  }
}