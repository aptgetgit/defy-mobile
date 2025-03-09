import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../config/theme/colors.dart';
import '../widgets/watchlist_nft_tile.dart';
import '../widgets/watchlist_update_collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
      home: WatchlistAvatarNFTScreen(),
    );
}

class WatchlistAvatarNFTScreen extends StatefulWidget {
  const WatchlistAvatarNFTScreen({super.key});

  @override
  State<WatchlistAvatarNFTScreen> createState() => _WatchlistAvatarNFTScreenState();
}

class _WatchlistAvatarNFTScreenState extends State<WatchlistAvatarNFTScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool showDeleteButton = false;
  String collectionName = 'Avatar NFT';

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDeleteButton() {
    setState(() {
      showDeleteButton = !showDeleteButton;
      if (showDeleteButton) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              collectionName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Gap(40),
            GestureDetector(
              onTap: () async {
                final updatedCollectionName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const WatchListUpdateCollectionScreen(),
                  ),
                );
                if (updatedCollectionName != null) {
                  setState(() {
                    collectionName = updatedCollectionName as String;
                  });
                }
              },
              child: Icon(
                PhosphorIcons.pencilSimpleLine(PhosphorIconsStyle.bold),
                color: AppColors.greyLight,
                size: 18,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
                    'NFT',
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.trendUp(PhosphorIconsStyle.bold),
                            color: AppColors.grey,
                            size: 18,
                          ),
                          onPressed: () {
                            // Handle rising arrow button press
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyVeryLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            PhosphorIcons.dotsThreeVertical(PhosphorIconsStyle.bold),
                            color: AppColors.grey,
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
              child: ListView.builder(
                itemCount: 6, // Number of tiles
                itemBuilder: (BuildContext context, int index) => WatchlistNFTTile(deleteNft: showDeleteButton),
              ),
            ),
            const Gap(50),
            if(showDeleteButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle delete button press
                  },
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
