import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../presentation/watchlist_cute_nft_screen.dart';
import '../widgets/watchlist_cute_nft_tile.dart';
import '../widgets/watchlist_grid_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';


class WatchlistNFTTab extends StatefulWidget {
  const WatchlistNFTTab({super.key});

  @override
  State<WatchlistNFTTab> createState() => _WatchlistNFTTabState();
}

class _WatchlistNFTTabState extends State<WatchlistNFTTab> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('Gesture tapped on WatchlistCuteTile!');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WatchlistCuteNFTScreen(),
                    ),
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white, // Make it visible with color
                    child: const WatchlistCuteTile(),
                  ),
                ),
              ),
              const WatchlistGridTile(),
            ],
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: GestureDetector(
                  onTap: () {
                    print('Gesture tapped on WatchlistNewListTile!');
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => const WatchListNewCollectionScreen(),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Hero(
                    tag: 'new_list',
                    child: WatchlistNewListTile(),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
