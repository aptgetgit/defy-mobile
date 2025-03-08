import 'package:flutter/material.dart';

import '../widgets/watchlist_grid_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';

class WatchlistTokensTab extends StatelessWidget {
  const WatchlistTokensTab({super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WatchlistGridTile(),
            Padding(
                padding: const EdgeInsets.only(bottom: 38),
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