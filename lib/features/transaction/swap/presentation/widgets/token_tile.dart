import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/curved_check_box.dart';
import 'package:defy/features/transaction/swap/domain/entities/swap_token_entity.dart';
import 'package:defy/features/transaction/swap/presentation/providers/swap_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class TokenTile extends ConsumerStatefulWidget {
  const TokenTile(
      {super.key, required this.token, required this.isSwapFrom});

  final SwapTokenEntity token;
  final bool isSwapFrom;

  @override
  ConsumerState<TokenTile> createState() => _TokenTileState();
}

class _TokenTileState extends ConsumerState<TokenTile> {

  void selectToken() {
    if (!widget.token.isSelected!) {
      if (widget.isSwapFrom) {
        ref.read(swapProvider.notifier).addFromToken(widget.token);
      } else {
        ref.read(swapProvider.notifier).addToToken(widget.token);
      }
    } else {
      if (widget.isSwapFrom) {
        ref.read(swapProvider.notifier).removeFromToken(widget.token);
      } else {
        ref.read(swapProvider.notifier).removeToToken(widget.token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return InkWell(
      onTap: selectToken,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.transparent,
        ),
        width: width,
        child: Row(
          children: [
            //0xffE0E0E0
            getImageFromUrl(widget.token.logoUrl, width * .11),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.token.name ?? 'N/A',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                ),
                Text(
                  '${widget.token.amount ?? '0.0'} ${widget.token.symbol ?? ''}',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700, color: AppColors.greyLight),
                ),
              ],
            ),
            const Spacer(),
            Consumer(
              builder: (ctx,ref,child) {
                final price = 3.4;
                return Text(
                          price != null ? "\$${price.toStringAsFixed(4)}" : 'N/A',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        );
                    // final priceUsd = widget.token.tokenAddress != null
                    //     ? ref.watch(coinMetaDataProvider(
                    //         widget.token.tokenAddress!,
                    //         widget.token.coinAmount ?? 0.0),)
                    //     : const AsyncValue.data(0.0);
                    // return priceUsd.when(
                    //   data: (price) {
                    //     return Text(
                    //       price != null ? "\$${price.toStringAsFixed(4)}" : 'N/A',
                    //       style: AppFont.of(context,
                    //           fontSize: AppFont.size16,
                    //           fontWeight: AppFont.bold),
                    //     );
                    //   },
                    //   error: (i, st) {
                    //     return const Text('N/A');
                    //   },
                    //   loading: () {
                    //     return const CircularProgressIndicator();
                    //   },
                    // );
              }
            ),
            const Gap(12),
            CurvedCheckbox(
              isChecked: widget.token.isSelected ?? false,
              isRound: true,
              onTap: selectToken,
            ).animate().slideX(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 100),
                ),
          ],
        ),
      ),
    );
  }
  
Widget getImageFromUrl( String? imageUrl, double size) {

  final isSvg = imageUrl?.endsWith(".svg") ?? true;
  if (isSvg) {
    return ClipRRect(
      borderRadius : BorderRadius.circular(30),
      child: SvgPicture.network(
        imageUrl ??
            'https://raw.githubusercontent.com/PanoraExchange/Aptos-Tokens/main/logos/APT.svg',
        width: size,
        height: size,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius : BorderRadius.circular(30),
      child: Image.network(
        filterQuality : FilterQuality.high,
        imageUrl ??
            'https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png',
        width: size,
        height:size,
      ),
    );
  }
}
}
