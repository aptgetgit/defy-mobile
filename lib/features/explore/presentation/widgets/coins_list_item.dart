import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

enum CoinListType {
  mcap,
  meme,
  volume,
  gainers,
}

class CoinListItem extends StatelessWidget {

  const CoinListItem({
    required this.type,
    required this.logoUrl,
    required this.width,
    super.key,
  });
  final CoinListType type;
  final String logoUrl;
  final double width;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(left: 16),
    width: width * .45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: AppColors.white,
    ),
    child: _buildContentByType(),
  );

  Widget _buildContentByType() {
    switch (type) {
      case CoinListType.meme:
        return _buildMemeContent();
      case CoinListType.volume:
        return _buildVolumeContent();
      case CoinListType.gainers:
        return _buildGainersContent();
      case CoinListType.mcap:
        return _buildMcapContent();
    }
  }

  Widget _buildCoinHeader({String name = 'Aptos', String symbol = 'APT'}) => Row(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width * .4 * .23,
          height: width * .4 * .23,
          imageUrl: logoUrl,
          errorWidget: (BuildContext ctx, String str, Object obj) =>
              Container(color: Colors.amber),
          progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
              const CircularProgressIndicator(),
        ),
      ),
      const Gap(6),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (type != CoinListType.volume)
            Text(
              symbol,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
            ),
        ],
      ),
    ],
  );

  Widget _buildMcapContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildCoinHeader(),
      Container(
        padding: const EdgeInsets.all(4),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              r'$3.15M',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(PhosphorIconsFill.caretUp, color: AppColors.green, size: 18),
                Text(
                  '2.5%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget _buildMemeContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildCoinHeader(name: 'Bonk', symbol: 'BONK'),
      Container(
        padding: const EdgeInsets.all(4),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              r'$0.00002348',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(PhosphorIconsFill.caretUp, color: AppColors.green, size: 18),
                Text(
                  '2.5%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget _buildVolumeContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildCoinHeader(),
      Container(
        padding: const EdgeInsets.all(4),
        child: const Row(
          children: <Widget>[
            Text(
              r'$32M',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            Spacer(),
            Icon(PhosphorIconsBold.arrowCircleUpRight, color: AppColors.grey, size: 19.5),
          ],
        ),
      ),
    ],
  );

  Widget _buildGainersContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildCoinHeader(),
      Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: AppColors.white,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'MCAP',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.greyLight,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  r'$3.15M',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Icon(PhosphorIconsFill.caretUp, color: AppColors.green, size: 18),
                Text(
                  '2.5%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
