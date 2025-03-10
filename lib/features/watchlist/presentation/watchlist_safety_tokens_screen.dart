import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // Add Riverpod
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../widgets/watchlist_token_tile.dart';
import '../widgets/watchlist_update_collection.dart';
import 'providers/watchlist_collection_details_provider.dart';
import 'providers/watchlist_collection_model.dart';
import 'providers/watchlist_provider.dart'; // For editing collection

// Remove standalone app for integrated version
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
// 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// 
//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//       home: WatchlistSafetyTokensScreen(),
//     );
// }

class WatchlistSafetyTokensScreen extends ConsumerStatefulWidget {
  const WatchlistSafetyTokensScreen({this.collectionId, super.key});
  
  final String? collectionId; // Allow collection ID to be passed

  @override
  ConsumerState<WatchlistSafetyTokensScreen> createState() => _WatchlistSafetyTokensScreenState();
}

class _WatchlistSafetyTokensScreenState extends ConsumerState<WatchlistSafetyTokensScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  String? collectionId;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    // If collection ID is passed, use it; otherwise find by name
    if (widget.collectionId != null) {
      collectionId = widget.collectionId;
    } else {
      // Find Safety Tokens collection after widget is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final List<WatchlistCollection> tokenCollections = ref.read(watchlistProvider.notifier)
            .getCollectionsByType(CollectionType.token)
            .where((WatchlistCollection c) => c.name.contains('Safety Tokens'))
            .toList();
        
        if (tokenCollections.isNotEmpty) {
          setState(() {
            collectionId = tokenCollections.first.id;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDeleteButton() {
    if (collectionId == null) {
      return;
    }
    
    final bool isDeleteMode = ref.read(watchlistCollectionDetailsProvider(collectionId!)).isDeleteMode;
    ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier).toggleDeleteMode();
    
    if (!isDeleteMode) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _editCollection() {
    if (collectionId == null) {
      return;
    }
    
    final WatchlistCollection collection = ref.read(watchlistCollectionDetailsProvider(collectionId!)).collection;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WatchListUpdateCollectionScreen(
          initialName: collection.name,
          collectionId: collectionId!,
        ),
      ),
    );
  }

  void _handleSort() {
    if (collectionId == null) {
      return;
    }
    
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('Sort by'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                  .setSortOption(SortOption.nameAsc);
              Navigator.pop(context);
            },
            child: const Text('Name (A-Z)'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                  .setSortOption(SortOption.nameDesc);
              Navigator.pop(context);
            },
            child: const Text('Name (Z-A)'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                  .setSortOption(SortOption.priceAsc);
              Navigator.pop(context);
            },
            child: const Text('Price (Low to High)'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                  .setSortOption(SortOption.priceDesc);
              Navigator.pop(context);
            },
            child: const Text('Price (High to Low)'),
          ),
        ],
      ),
    );
  }

  void _deleteCollection() {
    if (collectionId == null) {
      return;
    }
    
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete Collection'),
        content: const Text('Are you sure? This action cannot be undone.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Delete collection
              ref.read(watchlistProvider.notifier).deleteCollection(collectionId!);
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show loading while finding collection
    if (collectionId == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Get collection details from provider
    final CollectionDetailsState collectionDetails = ref.watch(watchlistCollectionDetailsProvider(collectionId!));
    final WatchlistCollection collection = collectionDetails.collection;
    final bool showDeleteButton = collectionDetails.isDeleteMode;
    
    // Sort items based on selected option
    final List sortedItems = [...collection.items];
    switch (collectionDetails.sortOption) {
      case SortOption.nameAsc:
        sortedItems.sort((a, b) => (a.name as String).compareTo(b.name as String));
      case SortOption.nameDesc:
        sortedItems.sort((a, b) => (b.name as String).compareTo(a.name as String));
      case SortOption.priceAsc:
        sortedItems.sort((a, b) {
          final double priceA = double.tryParse((a.usdValue as String?)?.replaceAll(r'$', '') ?? '0') ?? 0;
          final double priceB = double.tryParse((b.usdValue as String?)?.replaceAll(r'$', '') ?? '0') ?? 0;
          return priceA.compareTo(priceB);
        });
      case SortOption.priceDesc:
        sortedItems.sort((a, b) {
          final double priceA = double.tryParse((a.usdValue as String?)?.replaceAll(r'$', '') ?? '0') ?? 0;
          final double priceB = double.tryParse((b.usdValue as String?)?.replaceAll(r'$', '') ?? '0') ?? 0;
          return priceB.compareTo(priceA);
        });
    }
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          collection.name, // Use collection name from provider
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: IconButton(
              icon: Icon(
                PhosphorIcons.pencilSimple(PhosphorIconsStyle.bold),
                color: Colors.black,
                size: 21,
              ),
              onPressed: _editCollection, // Added edit functionality
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Tokens',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.arrowUpRight(PhosphorIconsStyle.bold),
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: _handleSort, // Added sort functionality
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.dotsThreeVertical(PhosphorIconsStyle.bold),
                            color: Colors.black,
                            size: 18,
                          ),
                          onPressed: _toggleDeleteButton,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: collection.items.isEmpty
                ? const Center(child: Text('No tokens in this collection'))
                : ListView.builder(
                  itemCount: sortedItems.length, // Use actual items count
                  itemBuilder: (BuildContext context, int index) {
                    final item = sortedItems[index];
                    return WatchlistTokenTile(
                      tokenData: <String, String>{
                        'id': item.id as String,
                        'name': item.name as String,
                        'imagePath': item.imagePath as String,
                        'symbol': item.symbol as String,
                        'nativeValue': item.nativeValue as String,
                        'usdValue': item.usdValue as String,
                      },
                      deleteNft: showDeleteButton,
                      onDelete: () {
                        // Delete item using provider
                        ref.read(watchlistCollectionDetailsProvider(collectionId!).notifier)
                            .deleteItem(item.id as String);
                      },
                    );
                  },
                ),
            ),
            const Gap(50),
            if(showDeleteButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: _deleteCollection, // Added delete collection functionality
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: const Size(double.infinity, 54),
                  ),
                  child: const Text('Delete Collection'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
