import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../widgets/watchlist_nft_tile.dart'; // Import the WatchlistNFTTile widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WatchlistCuteNFTScreen(),
    );
  }
}

class WatchlistCuteNFTScreen extends StatefulWidget {
  const WatchlistCuteNFTScreen({super.key});

  @override
  State<WatchlistCuteNFTScreen> createState() => _WatchlistCuteNFTScreenState();
}

class _WatchlistCuteNFTScreenState extends State<WatchlistCuteNFTScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool showDeleteButton = false;

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
  Widget build(BuildContext context) {
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
          "Cute NFTs🐣",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0), // Increased padding to the right
            child: Icon(
              PhosphorIcons.pencilSimple(PhosphorIconsStyle.bold),
              color: Colors.black,
              size: 21,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "NFT",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
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
                          onPressed: () {
                            // Handle rising arrow button press
                          },
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
              child: ListView.builder(
                itemCount: 6, // Number of tiles
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      WatchlistNFTTile(deleteNft: showDeleteButton),
                      if (showDeleteButton)
                        Positioned(
                          right: 0,
                          child: SlideTransition(
                            position: _offsetAnimation,
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Handle delete button press
                              },
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}