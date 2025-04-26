import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/nft_model.dart';
import '../../domain/models/selectable_item_model.dart';

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<NFT>('nfts', nfts))
      ..add(IterableProperty<T>('selectedToItems', selectedToItems));
  }
}

class _SendAssetSelectionNFTsTabState<T extends SelectableItem>
    extends ConsumerState<SendAssetSelectionNFTsTab<T>> {
  late List<NFTCollection> collections;

  @override
  void initState() {
    super.initState();
    collections = <NFTCollection>[
      NFTCollection(title: 'All NFTs', nfts: widget.nfts)
    ];
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Padding(
                padding: EdgeInsets.zero,
                child: CollectionExpansionTile(
                  collection: collections[index],
                ),
              ),
              childCount: collections.length,
            ),
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<NFTCollection>('collections', collections));
  }
}

class CollectionExpansionTile extends ConsumerStatefulWidget {
  const CollectionExpansionTile({
    required this.collection,
    super.key,
  });
  final NFTCollection collection;

  @override
  ConsumerState<CollectionExpansionTile> createState() =>
      _CollectionExpansionTileState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<NFTCollection>('collection', collection));
  }
}

class _CollectionExpansionTileState
    extends ConsumerState<CollectionExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _contentFade;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

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

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            leading: ClipOval(
              child: Image.asset(
                'assets/images/avatar-1.png',
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
                    spacing: 16,
                    runSpacing: 20,
                    children: widget.collection.nfts
                        .map(
                          (NFT nft) => SellNFTCard(
                            nft: nft,
                            collectionName: widget.collection.title,
                            cardWidth: cardWidth,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SellNFTCard extends StatelessWidget {
  const SellNFTCard({
    required this.nft,
    required this.collectionName,
    required this.cardWidth,
    super.key,
  });
  final NFT nft;
  final String collectionName;
  final double cardWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 168,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 168,
              height: 168,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(
                    nft.assetPath,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              nft.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: <Widget>[
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${nft.nftValue}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<NFT>('nft', nft))
      ..add(StringProperty('collectionName', collectionName))
      ..add(DoubleProperty('cardWidth', cardWidth));
  }
}

class NFTCollection {
  NFTCollection({required this.title, required this.nfts});
  final String title;
  final List<NFT> nfts;
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      SizedBox.expand(child: child);

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
}
