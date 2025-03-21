import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/watchlist_grid_tile.dart';
import '../widgets/watchlist_newList_tile.dart';
import '../widgets/watchlist_new_collection.dart';

class WatchlistTokensTab extends StatelessWidget {
  const WatchlistTokensTab({super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const WatchlistGridTile(),
            Padding(
                padding: EdgeInsets.only(bottom: 38.h),
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
