import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../wallet/data/models/nft_model.dart';
import '../../wallet/data/models/token_model.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../../wallet/presentation/providers/wallet_state.dart';

class WatchlistNewListTile extends ConsumerStatefulWidget {
  const WatchlistNewListTile({
    super.key,
    this.selectedTokens,
    this.selectedNFTs,
    this.forceEmptyState = false,
  });

  final List<Token>? selectedTokens;
  final List<NFT>? selectedNFTs;
  final bool forceEmptyState;

  @override
  ConsumerState<WatchlistNewListTile> createState() => WatchlistNewListTileState();
}

class WatchlistNewListTileState extends ConsumerState<WatchlistNewListTile> with SingleTickerProviderStateMixin {
  late AnimationController _fillAnimationController;
  late Animation<double> _fillAnimation;
  bool _shouldFillCircle = false;

  @override
  void initState() {
    super.initState();
    _fillAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fillAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fillAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _fillAnimationController.dispose();
    super.dispose();
  }

  void resetBackgroundColor() {
  }

  void startFillAnimation() {
    if (!_fillAnimationController.isAnimating) {
      _fillAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.forceEmptyState) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.39,
        height: MediaQuery.of(context).size.width * 0.39,
        child: AnimatedBuilder(
          animation: _fillAnimation,
          builder: (context, child) {
            return CustomPaint(
              painter: SimpleDashedCirclePainter(
                fillPercent: _shouldFillCircle ? _fillAnimation.value : 0,
              ),
              child: _buildEmptyState(),
            );
          },
        ),
      );
    }

    final WalletState walletState = ref.watch(walletNotifierProvider);
    final Set<int> selectedTokenIndices = walletState.selectedTokens;
    final List<Token> tokens = selectedTokenIndices
        .map((int index) => walletState.allTokens[index])
        .toList();

    final List<NFT> nfts = <NFT>[];
    walletState.selectedNFTs.forEach((int collectionIndex, Set<int> nftIndices) {
      for (final int nftIndex in nftIndices) {
        if (collectionIndex < walletState.allNFTCollections.length &&
            nftIndex < walletState.allNFTCollections[collectionIndex].nfts.length) {
          nfts.add(walletState.allNFTCollections[collectionIndex].nfts[nftIndex]);
        }
      }
    });

    final List<Token> finalTokens = widget.selectedTokens ?? tokens;
    final List<NFT> finalNfts = widget.selectedNFTs ?? nfts;

    final List<dynamic> assetsToShow = [];
    if (finalTokens.isNotEmpty) {
      assetsToShow.addAll(finalTokens.take(4));
    }
    if (assetsToShow.length < 4 && finalNfts.isNotEmpty) {
      assetsToShow.addAll(finalNfts.take(4 - assetsToShow.length));
    }

    return Container(
      width: 164.w,
      height: 164.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: CustomPaint(
        painter: SimpleDashedCirclePainter(),
        child: assetsToShow.isEmpty
            ? _buildEmptyState()
            : _buildWithSelectedAssets(assetsToShow),
      ),
    );
  }

  Widget _buildEmptyState() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            PhosphorIcons.listPlus(),
            size: 48.sp,
            color: AppColors.greyLight,
          ),
          SizedBox(height: 2.h),
          Text(
            'New List',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyLight,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      );

  Widget _buildWithSelectedAssets(List<dynamic> assets) {
    final List itemsToShow = assets.take(4).toList();
    final int itemCount = itemsToShow.length;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        if (itemCount >= 1)
          Align(
            child: _buildAssetIcon(itemsToShow[0], 1),
          ),
        if (itemCount >= 2)
          Align(
            child: _buildAssetIcon(itemsToShow[1], 2),
          ),
        if (itemCount >= 3)
          Align(
            child: _buildAssetIcon(itemsToShow[2], 3),
          ),
        if (itemCount >= 4)
          Align(
            child: _buildAssetIcon(itemsToShow[3], 4),
          ),
      ],
    );
  }

  Widget _buildAssetIcon(dynamic asset, int itemCount) {
    if (asset is Token) {
      return Container(
        height: 40.h,
        width: 40.w,
        margin: itemCount == 1
            ? EdgeInsets.only(left: 30.w, bottom: 30.h)
            : itemCount == 2
                ? EdgeInsets.only(right: 30.w, top: 20.h)
                : itemCount == 3
                    ? EdgeInsets.only(left: 30.w, top: 20.h)
                    : EdgeInsets.only(right: 30.w, bottom: 30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            asset.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    if (asset is NFT) {
      return Container(
        height: 40.h,
        width: 40.w,
        margin: itemCount == 1
            ? EdgeInsets.only(left: 30.w, bottom: 30.h)
            : itemCount == 2
                ? EdgeInsets.only(right: 30.w, top: 20.h)
                : itemCount == 3
                    ? EdgeInsets.only(left: 30.w, top: 20.h)
                    : EdgeInsets.only(right: 30.w, bottom: 30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            asset.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Icon(
        Icons.help_outline,
        color: Colors.grey[700],
        size: 20.sp,
      ),
    );
  }
}

class SimpleDashedCirclePainter extends CustomPainter {
  final double fillPercent;

  SimpleDashedCirclePainter({this.fillPercent = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    final Paint backgroundPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius, backgroundPaint);
    
    if (fillPercent > 0) {
      final Paint fillPaint = Paint()
        ..color = AppColors.greyVeryLight
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(center, radius * fillPercent, fillPaint);
    }

    const double dashWidth = 8;
    const double dashSpace = 8;
    
    final Paint dashPaint = Paint()
      ..color = AppColors.greyMedium
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double circumference = 2 * 3.141592653589793 * radius;
    final int dashCount = (circumference / (dashWidth + dashSpace)).round();
    final int finalDashCount = dashCount < 16 ? 16 : dashCount;
    const double adjustedTotalLength = dashWidth + dashSpace;
    final double adjustedAngleStep = (2 * 3.141592653589793) / finalDashCount;

    for (int i = 0; i < finalDashCount; i++) {
      final double startAngle = i * adjustedAngleStep;
      final double sweepAngle = adjustedAngleStep * (dashWidth / adjustedTotalLength);
      
      if (fillPercent > 0) {
        final double fillAngle = 2 * 3.141592653589793 * fillPercent;
        if (startAngle < fillAngle) {
          canvas.drawArc(
            Rect.fromCircle(center: center, radius: radius),
            startAngle,
            sweepAngle,
            false,
            dashPaint,
          );
        }
      } else {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
          dashPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(SimpleDashedCirclePainter oldDelegate) => oldDelegate.fillPercent != fillPercent;
}
