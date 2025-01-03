import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_cart_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class NFTMarketplaceCartTile extends ConsumerStatefulWidget {
  final NFTMarketplaceCartEntity nft;
  final bool isEditMode;
  final Function(NFTMarketplaceCartEntity) onDelete;
  const NFTMarketplaceCartTile({
    required this.isEditMode,
    required this.nft,
    required this.onDelete,
    super.key,
  });

  @override
  ConsumerState<NFTMarketplaceCartTile> createState() =>
      _NFTMarketplaceCartTileState();
}

class _NFTMarketplaceCartTileState extends ConsumerState<NFTMarketplaceCartTile>
    with SingleTickerProviderStateMixin {
  bool clickDelete = false;
  bool isDeleted = false;

  delete() {
    _controller.forward(from: 0.0);

    setState(() {
      clickDelete = !clickDelete;
    });

    if (clickDelete) {
      widget.onDelete(widget.nft);
    }
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);

    return Column(
      children: [
        Visibility(
          visible: !isDeleted,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: clickDelete ? MediaQuery.of(context).size.width : 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: widget.nft.mediaUrl.replaceAll(
                                          "ipfs://", "https://ipfs.io/ipfs/") ??
                                      '',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const Gap(12),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: widget.nft.name ?? '',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                  ),
                                  Text(
                                      '\$${(getPriceInAPT(widget.nft.price) * 4.15).toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                ],
                              ),
                              const Gap(4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: widget.nft.collectionName ?? '',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text:
                                            '${getPriceInAPT(widget.nft.price)} APT',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          color: Colors.grey)),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          const Gap(12),
                          Visibility(
                            visible: widget.isEditMode,
                            child: GestureDetector(
                              onTap: delete,
                              child: Icon(
                                PhosphorIcons.minusCircle(
                                    PhosphorIconsStyle.fill),
                                color: AppColors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: clickDelete ? 0 : MediaQuery.of(context).size.width,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    height: clickDelete ? 45 : 65,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: AppColors.greyVeryLight,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: clickDelete,
                                child: AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return ShaderMask(
                                        shaderCallback: (Rect bounds) =>
                                            LinearGradient(
                                          colors: <Color>[
                                            AppColors.greyDark,
                                            AppColors.greyLight.withOpacity(0.6)
                                          ],
                                          stops: <double>[
                                            _controller.value,
                                            _controller.value
                                          ],
                                        ).createShader(bounds),
                                        child: Text(
                                          "Removing from Cart",
                                          style: TextStyle(
                                              color: AppColors.greyLight.withOpacity(0.6),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      );
                                    }),
                              ),
                              GestureDetector(
                                onTap: delete,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 4),
                                    child: Text(
                                      "undo",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  double getPriceInAPT(int price) {
    return price / math.pow(10, 8);
  }
}
