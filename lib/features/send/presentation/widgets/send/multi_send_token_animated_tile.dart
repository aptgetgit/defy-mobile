import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../../../../../config/theme/colors.dart';
import '../../../domain/models/selectable_item_model.dart';
import '../../../domain/models/token_model.dart';

class MultiSendTokenAnimatedTile<T extends SelectableItem>
    extends ConsumerStatefulWidget {
  final List<SelectableItem> selectedAssetItems;
  const MultiSendTokenAnimatedTile(
      {super.key, required this.selectedAssetItems});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MultiSendTokenAnimatedTileState();
}

class _MultiSendTokenAnimatedTileState
    extends ConsumerState<MultiSendTokenAnimatedTile> {
  final ScrollController _scrollController = ScrollController();
  int? topIndex;
  static const double itemHeight = 90.0; // Height of each item

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateTopIndex);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateTopIndex);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateTopIndex() {
    // final double offset = _scrollController.offset;
    // final int index = (offset / itemHeight).round();
    setState(() {});
  }

  void _snapToNearestItem() {
    final double offset = _scrollController.offset;
    final double target = (offset / itemHeight).round() * itemHeight;
    if (target != _scrollController.offset) {
      _scrollController.animateTo(
        target,
        duration: Duration(milliseconds: 200), // Reduced duration
        curve: Curves.easeInOut, // Adjusted curve
      );
    }
  }

  @override
  Widget build(BuildContext context) => NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          _snapToNearestItem(); // Snap to the nearest item when scroll ends
        }
        return false;
      },
      child: Container(
        height: 300,
        child: TransformableListView.builder(
          controller: _scrollController,
          physics: SnapScrollPhysics(itemHeight: itemHeight),
          getTransformMatrix: getTransformMatrix,
          itemBuilder: (context, index) {
            final SelectableItem token = widget.selectedAssetItems[index];
            bool isTop = topIndex == index;
            if (token is Token) {
              return MultiInputCard(
                index: index,
                tokenImage: token.tokenImage!,
                tokenName: token.tokenName!,
                tokenBalance: token.tokenBalance!,
                tokenPrice: token.tokenPrice!,
                showShadow: isTop,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          itemCount: widget.selectedAssetItems.length,
        ),
      ),
    );

  Matrix4 getTransformMatrix(TransformableListItem item) {
    const endScaleBound = 0.01;
    final double animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position == TransformableListItemPosition.middle) {
      return paintTransform;
    }

    if (item.position == TransformableListItemPosition.topEdge) {
      final double scale = endScaleBound + ((1 - endScaleBound) * animationProgress);
      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }
}

class MultiInputCard<T extends SelectableItem> extends StatelessWidget {
  final String tokenImage;
  final String tokenName;
  final String tokenPrice;
  final String tokenBalance;
  final bool showShadow;
  final int index;

  const MultiInputCard({
    required this.tokenName,
    required this.tokenPrice,
    required this.tokenBalance,
    required this.tokenImage,
    required this.index,
    this.showShadow = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: showShadow || index == 0 ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: showShadow || index == 0
            ? [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                  color: Colors.black.withOpacity(0.12),
                )
              ]
            : [],
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(12),
            Image(
              height: 40,
              width: 40,
              image: AssetImage(tokenImage),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tokenName,
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  tokenPrice,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tokenPrice,
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  tokenBalance,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark),
                ),
              ],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
}

class SnapScrollPhysics extends ScrollPhysics {
  final double itemHeight;

  const SnapScrollPhysics({required this.itemHeight, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  SnapScrollPhysics applyTo(ScrollPhysics? ancestor) => SnapScrollPhysics(
      itemHeight: itemHeight,
      parent: buildParent(ancestor),
    );

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) => offset;

  @override
  double get maxFlingVelocity => double.infinity;

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => true;

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if (velocity.abs() < 1.0) {
      final double target = (position.pixels / itemHeight).round() * itemHeight;
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        0.0,
        tolerance: tolerance,
      );
    }
    return super.createBallisticSimulation(position, velocity);
  }
}
