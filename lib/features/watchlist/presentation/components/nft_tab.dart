import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/watchlist/presentation/widgets/collection_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchlistNFTTab extends StatefulWidget {
  const WatchlistNFTTab({super.key});

  @override
  State<WatchlistNFTTab> createState() => _WatchlistNFTTabState();
}

class _WatchlistNFTTabState extends State<WatchlistNFTTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              mainAxisExtent: MediaQuery.of(context).size.width * .6,
            ),
      itemCount: 4,
      itemBuilder: (ctx,index) {
        if(index == 3) {
          return _buildNewCollectionTile();
        } else {
          return WatchlistCollectionTile();
        }
        
      },
    );
  }

 Widget _buildNewCollectionTile() {
  return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
            height: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4)
            ),
            child: Center(child: Text('New list')),
          ),
          const SizedBox(),
        ],
      );
 }
}

