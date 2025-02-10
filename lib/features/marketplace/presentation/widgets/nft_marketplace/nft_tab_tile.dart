import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theme/colors.dart';
import '../../screens/nft_collections_details_screen.dart';
import '../../utils/collections_functions.dart';

class NFTTabTile extends StatefulWidget {
  const NFTTabTile(
      {super.key,
      required this.index,
      required this.collectionUrl,
      required this.collectionName,
      required this.floor,
      required this.id,
      required this.slug,
      required this.usdVolume,
      required this.volume,
      required this.supply,
      required this.tradesCount});

  final String id;
  final String slug;
  final int usdVolume;
  final int supply;
  final int tradesCount;
  final int index;
  final String? collectionUrl;
  final String? collectionName;
  final int? volume;
  final int? floor;

  @override
  _NFTTabTileState createState() => _NFTTabTileState();
}

class _NFTTabTileState extends State<NFTTabTile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NFTCollectionsDetailsScreen(
              id: widget.id,
              slug: widget.slug,
              floor: widget.floor ?? 0,
              usdVolume: widget.usdVolume,
              volume: widget.volume!,
              supply: widget.supply,
              tradesCount: widget.tradesCount,
              imageUrl: widget.collectionUrl ?? 'null',
              collectionName: widget.collectionName ?? 'null',
            ),
          ),
        );
      },
      child: Column(
        children: [
          const Gap(16),
          Row(
            children: [
              Text(
                widget.index >= 0 && widget.index <= 9
                    ? ' ${widget.index.toString()}'
                    : widget.index.toString(),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const Gap(8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getNftAsset(
                      context: context,
                      imageUrl: widget.collectionUrl,
                      isTitle: true)
                ],
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.collectionName ?? 'N/A',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Gap(60),
                        Row(
                          children: [
                            Text(
                              '${double.parse(getVolumePriceInAPT(widget.volume)).toStringAsFixed(2)}' ??
                                  'N/A',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Gap(6),
                            Image.asset(
                              'assets/icons/aptos.png',
                              width: 12,
                              height: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "${getFloorPriceInAPT(widget.floor)} APT",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyLight),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "+32.02%",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greenDark),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getFloorPriceInAPT(int? floor) {
    if (floor == null) {
      return 'N/A';
    }
    final floorPrice = floor / math.pow(10, 8);
    return floorPrice.toString();
  }

  String getVolumePriceInAPT(int? volume) {
    if (volume == null) {
      return 'N/A';
    }
    final volumePrice = volume / math.pow(10, 8);
    return volumePrice.toString();
  }
}
