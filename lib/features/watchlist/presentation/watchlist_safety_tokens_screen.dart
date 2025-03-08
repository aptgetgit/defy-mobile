import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../config/theme/colors.dart';
import '../widgets/watchlist_token_tile.dart'; // Import the WatchlistNFTTile widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WatchlistSafetyTokensScreen(),
    );
  }
}

class WatchlistSafetyTokensScreen extends StatefulWidget {
  const WatchlistSafetyTokensScreen({super.key});

  @override
  State<WatchlistSafetyTokensScreen> createState() => _WatchlistSafetyTokensScreenState();
}

class _WatchlistSafetyTokensScreenState extends State<WatchlistSafetyTokensScreen> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) => Scaffold(
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
          "Safety Tokens 🤩",
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
                    "Tokens",
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
                  return WatchlistTokenTile(deleteNft: showDeleteButton);
                },
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
                  child: const Text("Delete Collection"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    minimumSize: const Size(double.infinity, 54),
                  ),
                ),
              )
          ],
        ),
      ),
    );
}