import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';

class ExploreOrderScreen extends StatefulWidget {
  const ExploreOrderScreen({super.key});

  @override
  State<ExploreOrderScreen> createState() => _ExploreOrderScreenState();
}

class _ExploreOrderScreenState extends State<ExploreOrderScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listingsItems = [
      {
        'imageUrl': 'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
        'name': 'Listed NFT #1283',
        'price': '0.5APT',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
        'name': 'Listed NFT #3845',
        'price': '1.2APT',
        'status': 'Active',
        'date': '5 days ago',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
        'name': 'Listed NFT #7621',
        'price': '1.5APT',
        'status': 'Canceled',
        'date': '1 week ago',
      },
    ];

    final List<Map<String, dynamic>> bidsItems = [
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
        'name': 'Bid NFT #2493',
        'price': '0.8APT',
        'status': 'Pending',
        'date': '1 day ago',
      },
      {
        'imageUrl': 'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
        'name': 'Bid NFT #7621',
        'price': '1.5APT',
        'status': 'Rejected',
        'date': '3 days ago',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Custom Tab Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Row(
                    children: [
                      // Tab Bar
                      Expanded(
                        child: CustomTabBar(
                          tabController: _tabController,
                          tabs: const ['Listings', 'Bids'],
                          isScrollable: true,
                          withPositionedIndicator: false,
                        ),
                      ),
                    ],
                  ),
                  
                  // Bottom divider
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 350.w,
                      height: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Listings Tab
                  _buildOrderTabContent(
                    items: listingsItems,
                    emptyMessage: 'No listings found',
                    isListing: true,
                  ),
                  
                  // Bids Tab
                  _buildOrderTabContent(
                    items: bidsItems,
                    emptyMessage: 'No bids found',
                    isListing: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildOrderTabContent({
    required List<Map<String, dynamic>> items,
    required String emptyMessage,
    required bool isListing,
  }) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isListing ? PhosphorIcons.tag() : PhosphorIcons.handCoins(),
              size: 48.sp,
              color: Colors.grey,
            ),
            SizedBox(height: 16.h),
            Text(
              emptyMessage,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildOrderTile(
          item: item,
          isListing: isListing,
        );
      },
    );
  }
  
  Widget _buildOrderTile({
    required Map<String, dynamic> item,
    required bool isListing,
  }) {
    // Determine status color based on the status string
   
   
    
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Handle tap on order tile
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // NFT Image
                  Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: NetworkImage(item['imageUrl'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  Gap(12.w),
                  
                  // NFT Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // NFT Name
                        Text(
                          item['name'] as String,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        Gap(4.h),
                        Text(
                          item['price'] as String,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Trailing section with USD price and "Top offer" text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$${(double.parse(item['price'].toString().replaceAll('APT', '')) * 8.45).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        'Top offer',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
