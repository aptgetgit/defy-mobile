// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/transaction/swap/presentation/providers/swap_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SwapTokenTile extends ConsumerStatefulWidget {
  SwapTokenTile({
    super.key,
    required this.controller,
    required this.chooseTokens,
    required this.isMarketSelected,
    required this.label,
    required this.swapTokenInUSD,
    required this.isFromTokenTile,
  });

  final TextEditingController controller;
  final Function chooseTokens;
  final String label;
  final bool isMarketSelected;
  String swapTokenInUSD;
  final bool isFromTokenTile;

  @override
  ConsumerState<SwapTokenTile> createState() => _SwapTokenTileState();
}

class _SwapTokenTileState extends ConsumerState<SwapTokenTile> {
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: height * .13,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xfff4f4f6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width / 3,
                child: TextField(
                  controller: widget.controller,
                  showCursor: true,
                  keyboardType: TextInputType.none,
                  cursorColor: AppColors.black,
                  cursorWidth: 3,
                  cursorHeight: 24,
                  decoration: InputDecoration(
                    hintText: '0.0',
                    hintStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: AppColors.greyLight,),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,height: 1),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.swapTokenInUSD,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.greyLight,),
                  ),
                  const Gap(3),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final temp = widget.swapTokenInUSD;
                        widget.swapTokenInUSD = widget.controller.text;
                        widget.controller.text = temp;
                      });
                    },
                    child: const Icon(
                      PhosphorIconsBold.arrowsDownUp,
                      size: 18,
                      color: Color(0xff646d80),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: !widget.isMarketSelected
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: !widget.isMarketSelected,
                child: Text(widget.label,
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: AppColors.greyLight),),
              ),
              Row(
                children: [
                  Consumer(
                    builder: (ctx,ref,child) {
                  final tokens = ref.watch(swapProvider);
                  return tokens.when(
                    data: (data) {
                  final fromTokens = data.fromTokens;
                  final toTokens = data.toTokens;
                      return GestureDetector(
                      onTap: () {
                        widget.chooseTokens();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getImageFromUrl(widget.isFromTokenTile ? fromTokens[0].logoUrl : toTokens[0].logoUrl, width * .075),
                            const Gap(6),
                            Text(
                              widget.isFromTokenTile ? fromTokens[0].name ?? 'N/A' : toTokens[0].name ?? 'N/A' ,
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                            ),
                            const Gap(6),
                            const Icon(
                              PhosphorIconsBold.caretRight,
                              size: 22,
                              color: Color(0xff979daa),
                            )
                          ],
                        ),
                      ),
                    );
                    }, 
                  error: (i,st){
                    return const Text('Error');
                  }, 
                  loading: () {
                    return CircularProgressIndicator();
                  },
                  );
                      
                    }
                  ),
                ],
              ),
            ],
          ),
        ],
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
