import 'package:flutter/material.dart';

import '../widgets/watchlist_grid_tile.dart';

class WatchlistTokensTab extends StatelessWidget {
  const WatchlistTokensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WatchlistGridTile(),
            
          ],
        ),
      ],
    );
  }
}