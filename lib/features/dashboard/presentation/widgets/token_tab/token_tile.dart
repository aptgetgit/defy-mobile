import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/dashboard/presentation/provider/ui_provider.dart';
import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
import 'package:defy/features/shared/presentation/providers/token_metadata_notifier_provider.dart';
import 'package:defy/features/shared/presentation/widgets/curved_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:math' as math;

class TokenTile extends ConsumerStatefulWidget {
  const TokenTile({super.key, required this.token});
  final UserWalletToken token;

  @override
  ConsumerState<TokenTile> createState() => _TokenTileState();
}

class _TokenTileState extends ConsumerState<TokenTile> {
  bool isTokenSelected = false;

  void selectToken() {
    setState(() {
      isTokenSelected = !isTokenSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final selectTokens = ref.watch(tokenSelectionProvider);
    final amount =
        _calculateAmount(widget.token.amount, widget.token.metaData?.decimals);
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      dense: true,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: GestureDetector(
          onTap: () {},
          child: ListTile(
              leading: Consumer(builder: (ctx, ref, child) {
                final tokenMetaData =
                    ref.watch(tokenMetaDataProvider(widget.token.assetType));
                return tokenMetaData.when(
                  data: (data) {
                    return _imageBuilderFromUrl(
                        width * .08, width * .08, data?.coinLogoUrl);
                  },
                  error: (i, st) {
                    return Icon(Icons.error);
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                );
              }),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.token.metaData?.name ?? 'N/A',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Consumer(builder: (ctx, ref, child) {
                    final tokenMetaData = ref
                        .watch(tokenMetaDataProvider(widget.token.assetType));
                    return tokenMetaData.when(
                      data: (data) {
                        final tokenAmount = _calculateAmount(
                            widget.token.amount,
                            widget.token.metaData?.decimals);
                        final priceInUsd = _calculateAmountInUsd(
                            tokenAmount, data?.coinMetric?.priceUsd);
                        return Text(
                          "\$${priceInUsd?.toStringAsFixed(4) ?? 'N?A'}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        );
                      },
                      error: (i, st) {
                        return const Text('N/A');
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                    );
                  }),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${amount ?? '-'} ${widget.token.metaData!.symbol}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "-1.02%",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              trailing: selectTokens ? CurvedCheckbox(
                        isChecked: isTokenSelected,
                        isRound: true,
                        onTap: selectToken,
                      ) : null ,),
        ),
      ),
    );
  }

  Widget _imageBuilderFromUrl(double height, double width, String? url) {
    if (url == null) {
      return Text('NULL'); //return image from assets or any placeholder
    }
    final isSvgImage = url.endsWith('svg');
    return isSvgImage
        ? SvgPicture.network(
            url,
            width: width,
            height: height,
            placeholderBuilder: (BuildContext context) => const SizedBox(),
            fit: BoxFit.contain,
          )
        : CachedNetworkImage(
            imageUrl: url,
            width: width,
            height: height,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
  }

  double? _calculateAmount(
    int? amount,
    int? decimals,
  ) {
    if (amount != null && decimals != null) {
      final coinAmount = amount / math.pow(10, decimals);
      return coinAmount;
    } else {
      return null;
    }
  }

  double? _calculateAmountInUsd(double? coinAmount, double? priceUSD) {
    if (coinAmount != null) {
      if (priceUSD != null) {
        final coinAmountInUsd = coinAmount * priceUSD;
        return coinAmountInUsd;
      }
    }
    return null;
  }
}
