import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/models/nft_model.dart';
import '../../domain/models/selectable_item_model.dart';
import '../providers/send_provider.dart';

class SendAssetSelectionNFTsTab<T extends SelectableItem>
    extends ConsumerStatefulWidget {
  const SendAssetSelectionNFTsTab({
    required this.nfts,
    required this.selectedToItems,
    super.key,
  });
  final List<NFT> nfts;
  final List<T> selectedToItems;

  @override
  ConsumerState<SendAssetSelectionNFTsTab<T>> createState() =>
      _SendAssetSelectionNFTsTabState<T>();
}

class _SendAssetSelectionNFTsTabState<T extends SelectableItem>
    extends ConsumerState<SendAssetSelectionNFTsTab<T>> {
  late List<NFTCollection> collections;

  @override
  void initState() {
    super.initState();
    collections = [NFTCollection(title: "All NFTs", nfts: widget.nfts)];
  }

  @override
  Widget build(BuildContext context) {
    final SendNFTScreenProvider sendNftController =
        ref.watch(sendNFTScreenProviderProvider.notifier);
    final SendNFTState sendNFTState = ref.watch(sendNFTScreenProviderProvider);

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Padding(
                padding: EdgeInsets.zero,
                child: CollectionExpansionTile(
                  collection: collections[index],
                  sendNFTState: sendNFTState,
                  sendNftController: sendNftController,
                ),
              ),
            childCount: collections.length,
          ),
        ),
      ],
    );
  }
}

class CollectionExpansionTile extends ConsumerStatefulWidget {
  const CollectionExpansionTile({
    super.key,
    required this.collection,
    required this.sendNFTState,
    required this.sendNftController,
  });
  final NFTCollection collection;
  final SendNFTState sendNFTState;
  final SendNFTScreenProvider sendNftController;

  @override
  ConsumerState<CollectionExpansionTile> createState() =>
      _CollectionExpansionTileState();
}

class _CollectionExpansionTileState
    extends ConsumerState<CollectionExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconRotation;
  late Animation<double> _heightFactor;
  late Animation<double> _contentFade;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _iconRotation = Tween<double>(begin: 0.75, end: 0.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _heightFactor = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _contentFade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.value = 1.0;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _selectAll() {
    widget.sendNftController.toggleAllNFTsInCollection(widget.collection.nfts);
  }

  @override
  Widget build(BuildContext context) {
    final bool allSelected = widget.collection.nfts
        .every((nft) => widget.sendNFTState.selectedNFTs.contains(nft));

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: ClipOval(
            child: Image.asset(
              'assets/images/nft-5.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            widget.collection.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.sendNFTState.isSelectionMode)
                GestureDetector(
                  onTap: _selectAll,
                  child: Text(
                    allSelected ? 'Unselect All' : 'Select All',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                Text(
                  '${widget.collection.nfts.length}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: _isExpanded ? 0.5 : 0.75,
                child: IconButton(
                  icon: const Icon(Icons.expand_more),
                  onPressed: _toggleExpanded,
                ),
              ),
            ],
          ),
          onTap: _toggleExpanded,
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) => ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: _heightFactor.value,
              child: Opacity(
                opacity: _contentFade.value,
                child: child,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double cardWidth = (constraints.maxWidth - 8) / 2;
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.collection.nfts.map((NFT nft) => SellNFTCard(
                      nft: nft,
                      collectionName: widget.collection.title,
                      cardWidth: cardWidth,
                      isSelected:
                          widget.sendNFTState.selectedNFTs.contains(nft),
                      isSelectionMode: true,
                      onToggleSelection: () =>
                          widget.sendNftController.toggleNFTSelection(nft),
                    )).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SellNFTCard extends StatelessWidget {
  final NFT nft;
  final String collectionName;
  final double cardWidth;
  final bool isSelected;
  final bool isSelectionMode;
  final VoidCallback onToggleSelection;

  const SellNFTCard({
    Key? key,
    required this.nft,
    required this.collectionName,
    required this.cardWidth,
    required this.isSelected,
    required this.isSelectionMode,
    required this.onToggleSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: isSelectionMode ? onToggleSelection : null,
        child: Stack(
          children: <Widget>[
            Container(
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: nft.assetPath,
                        fit: BoxFit.cover,
                        errorWidget: (BuildContext context, String error,
                                Object stackTrace) =>
                            Container(
                          color: Colors.grey[100],
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[300],
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    nft.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelectionMode && isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 24,
                  ),
                ),
              ),
          ],
        ),
      );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(child: child);

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
}

class NFTCollection {
  final String title;
  final List<NFT> nfts;

  NFTCollection({required this.title, required this.nfts});
}
