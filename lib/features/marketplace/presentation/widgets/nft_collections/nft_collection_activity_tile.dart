
import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTCollectionActivityTile extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final int? price;
  final String? sender;
  final String? receiver;
  final String? blockTime;
  final String type;

  const NFTCollectionActivityTile({
    Key? key,
    required this.name,
    this.imageUrl,
    required this.price,
    required this.sender,
    this.receiver,
    required this.blockTime,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String processedImageUrl =
        imageUrl?.replaceAll('ipfs://', 'https://ipfs.io/ipfs/') ?? '';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  height: 55,
                  width: 55,
                  fit: BoxFit.cover,
                  image: processedImageUrl.isNotEmpty
                      ? NetworkImage(processedImageUrl) as ImageProvider
                      : const AssetImage("assets/images/Nft-Placeholder.png"),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          PhosphorIconsFill.sparkle,
                          size: 16,
                          color: AppColors.greenDark,
                        ),
                        const Gap(6),
                        Text(
                          type,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.greenDark,
                          ),
                        )
                      ],
                    ),
                    Text(
                      _formatTimeAgo(blockTime),
                      style: TextStyle(color: AppColors.greenDark, fontSize: 12),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${priceInApt(price?.toDouble() ?? 300000)} APT",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  _buildAddressRow(
                      "From:", sender ?? '0x924982878489284721849120'),
                  _buildAddressRow("To:", receiver ?? 'allan.avex'),
                ],
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.greyVeryLight,
        )
      ],
    );
  }

  Widget _buildAddressRow(String label, String address) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.greyDark,
          ),
        ),
        const Gap(4),
        Text(
          _truncateAddress(address),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.greyLight,
          ),
        ),
      ],
    );
  }

  double priceInApt(num price) {
    return price / math.pow(10, 8);
  }

  String _truncateAddress(String address) {
    if (address.length <= 10) return address;
    return '${address.substring(0, 5)}...${address.substring(address.length - 5)}';
  }

  String _formatTimeAgo(String? blockTime) {
    if (blockTime == null) return 'N/A';

    final DateTime activityTime = DateTime.parse(blockTime).toLocal();
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(activityTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}S ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}M ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}H ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}D ago';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '${months}MO ago';
    } else {
      int years = (difference.inDays / 365).floor();
      return '${years}Y ago';
    }
  }
}
