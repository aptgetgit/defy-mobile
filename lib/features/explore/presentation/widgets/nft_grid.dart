import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/colors.dart';
import 'nft_grid_item.dart';
import 'nft_list_item.dart';  // We'll create this file next

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
        itemBuilder: (BuildContext context, int index) => NFTGridItem(
          imageUrl: nftItems[index]['imageUrl']!,
          name: nftItems[index]['name']!,
          price: nftItems[index]['price']!,
        ),
      ),
    );
  }
  
  Widget _buildListView(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    
    return SizedBox(
      height: height * .285 * 2,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: nftItems.length,
        separatorBuilder: (context, index) => Divider(
          height: 1.h,
          indent: 16.w,
          endIndent: 16.w,
          color: AppColors.greyVeryLight,
        ),
        itemBuilder: (BuildContext context, int index) => NFTListItem(
          imageUrl: nftItems[index]['imageUrl']!,
          name: nftItems[index]['name']!,
          price: nftItems[index]['price']!,
        ),
      ),
    );
  }
}