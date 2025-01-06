import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/domain/entities/user_wallet_nft.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'dart:math' as math;

class NftTile extends StatefulWidget {
  const NftTile({
    super.key,
    required this.nfts,
  });
  final List<UserWalletNFT>? nfts;

  @override
  State<NftTile> createState() => _NftTileState();
}

class _NftTileState extends State<NftTile> {
  ExpansionTileController controller = ExpansionTileController();
  bool like = false;

  @override
  void dispose() {
    super.dispose();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final collectionName = widget.nfts![0].collection!.title;
    final collectionAsset = widget.nfts![0].collection!.coverUrl;
    final totalTokens = widget.nfts!.length;

    return ListTileTheme(
      dense: true,
      child: ExpansionTile(
        initiallyExpanded: false,
        controller: controller,
        shape: const Border(),
        tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getNftAsset(
                context: context, imageUrl: collectionAsset, isTitle: true),
          ],
        ),
        title: Text(
          collectionName ?? 'N/A',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              totalTokens.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {
                // setState(() => expand = !expand);
                // controller.isExpanded
                //     ? controller.collapse()
                //     : controller.expand();
              },
              child: const Icon(
                PhosphorIconsBold.caretDown,
                size: 18,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        onExpansionChanged: (val) {
          // setState(() => expand = val);
        },
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              mainAxisExtent: width / 1.43,
            ),
            itemCount: widget.nfts!.length,
            itemBuilder: (context, index) {
              final double? price = _getPrice(widget.nfts![index].collection!.floor);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getNftAsset(
                        context: context,
                        imageUrl: widget.nfts![index].nft!.mediaUrl,
                        isTitle: false),
                    const Gap(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: width / 3),
                          child: Text(
                            widget.nfts![index].nft!.name ?? 'N/A',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            PhosphorIconsBold.dotsThreeVertical,
                            color: AppColors.greyLight,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width / 3),
                      child: Text(
                        collectionName ?? 'N/A',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(3),
                    Row(
                      children: [
                        Text('${price.toString()}APT',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                        const Spacer(),
                        IconButton(
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          onPressed: () {
                            setState(
                              () {
                                like = !like;
                              },
                            );
                          },
                          icon: like
                              ? const Icon(
                                  PhosphorIconsFill.heart,
                                  size: 20,
                                  color: Colors.red,
                                )
                              : Icon(
                                  PhosphorIcons.heart(),
                                  size: 20,
                                ),
                        ),
                        Text(
                          '2.2k',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greyLight),
                        ),
                        const Gap(10)
                      ],
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _getNftAsset(
      {required BuildContext context,
      required String? imageUrl,
      required isTitle}) {
    final width = context.screenWidth;
    if (imageUrl == null) {
      return const CircleAvatar(radius: 22, backgroundColor: Colors.amber);
    } else {
      //two cases - ipfs and url to call
      return ClipRRect(
        borderRadius: BorderRadius.circular(isTitle ? 30.0 : 12.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: isTitle ? width * .11 : width * .5,
          height: isTitle ? width * .11 : width * .45,
          imageUrl: imageUrl,
          errorWidget: (ctx, str, obg) => Container(color: Colors.amber),
          progressIndicatorBuilder: (ctx, str, download) =>
              const CircularProgressIndicator(),
        ),
      );
    }
  }

double? _getPrice(int? amount) {
    if(amount != null) {
      final price = amount / math.pow(10,8);
      return price;
    }
  return null;
}
}
