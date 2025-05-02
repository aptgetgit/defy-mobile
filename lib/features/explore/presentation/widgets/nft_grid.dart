import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/nft_detail_screen.dart';
import 'nft_grid_item.dart';
import 'nft_list_item.dart';

class NFTGrid extends StatelessWidget {
  final List<Map<String, String>> nftItems;
  final bool isGridView;
  
  const NFTGrid({
    Key? key, 
    required this.nftItems, 
    this.isGridView = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGridView 
        ? _buildGridView(context)
        : _buildListView(context);
  }
  
  Widget _buildGridView(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    
    return SizedBox(
      height: height * .285 * 2,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.h,
          crossAxisSpacing: 4.w,
          mainAxisExtent: height * .285,
        ),
        itemCount: nftItems.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NFTDetailScreen(),
              ),
            );
          },
          child: NFTGridItem(
            imageUrl: nftItems[index]['imageUrl']!,
            name: nftItems[index]['name']!,
            price: nftItems[index]['price']!,
          ),
      ),
    ),
    );
  }
  
  Widget _buildListView(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    
    return SizedBox(
      height: height * .285 * 2,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: nftItems.length,
         itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NFTDetailScreen(),
              ),
            );
          },
          child: NFTListItem(
            imageUrl: nftItems[index]['imageUrl']!,
            name: nftItems[index]['name']!,
            price: nftItems[index]['price']!,
          ),
        ),
      ),
    );
  }
}