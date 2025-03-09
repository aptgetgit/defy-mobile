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
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('Gesture tapped on WatchlistCuteTile!');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const WatchlistCuteNFTScreen(),
                    ),
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(8),
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
            children: <Widget>[
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
                        transitionsBuilder: (_, Animation<double> animation, __, Widget child) => FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
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
