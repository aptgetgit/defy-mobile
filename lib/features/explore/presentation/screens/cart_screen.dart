import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/theme/colors.dart';
import 'bid_amount_screen.dart';
import 'explore_buy_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample cart items using NFT data
  final List<Map<String, String>> cartItems = [
    {
      'imageUrl': 'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
      'name': 'Cyberpunk kid #6823',
      'price': '245 APT',
      'usdValue': '\$24,500',
    },
    {
      'imageUrl': 'https://i.seadn.io/s/raw/files/96008751ea35fab46c85f688f521054b.png?auto=format&dpr=1&w=1000',
      'name': 'Azuki #421',
      'price': '32 APT',
      'usdValue': '\$3,200',
    },
    {
      'imageUrl': 'https://i.seadn.io/s/raw/files/6e8b6e53ca87016580ec4bb58a66466a.png?auto=format&dpr=1&w=1000',
      'name': 'Bored Ape #1592',
      'price': '507 APT',
      'usdValue': '\$50,700',
    },
    {
      'imageUrl': 'https://i.seadn.io/s/raw/files/3469b206cc467c4d30a30d5fb01c3ed5.png?auto=format&dpr=1&w=1000',
      'name': 'Doodle #7823',
      'price': '18 APT',
      'usdValue': '\$1,800',
    },
  ];

  // Initialize here to avoid LateInitializationError
  List<bool> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = List<bool>.filled(cartItems.length, true);
  }

  @override
  Widget build(BuildContext context) {
    // Ensure _selectedItems is always in sync with cartItems
    if (_selectedItems.length != cartItems.length) {
      _selectedItems = List<bool>.filled(cartItems.length, true);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 12.h,
        leading: IconButton(
          icon: Icon(
            PhosphorIconsBold.caretLeft,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              'Shopping Cart',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 45.w,
                  height: 20.h,
                  child: Stack(
                    children: [
                      for (int i = 0; i < (cartItems.length > 3 ? 3 : cartItems.length); i++)
                        Positioned(
                          right: i * 5.w,
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: Colors.white, width: 1.w),
                              image: DecorationImage(
                                image: NetworkImage(cartItems[i]['imageUrl']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Gap(4.w),
                Text(
                  '${cartItems.length} items',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(20.w),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Column(
            children: [
              Gap(8.h),
              Container(
                color: AppColors.greyVeryLight,
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(12.h),
            Expanded(
              child: cartItems.isEmpty
                  ? Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 16.sp)))
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemTile(
                          itemData: item,
                          selected: _selectedItems[index],
                          onSelect: () {
                            setState(() {
                              _selectedItems[index] = !_selectedItems[index];
                            });
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 26.h, top: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.r,
              offset: Offset(0, -4.h),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Checkout button on the left
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExploreBuyScreen(
                        selectedItem: cartItems[0],
                        allSelectedItems: cartItems,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(95.w, 45.h),
                  maximumSize: Size(150.w, 48.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  backgroundColor: AppColors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Bid button on the right
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(95.w, 45.h),
                  maximumSize: Size(150.w, 48.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  side: BorderSide(width: 1.w, color: AppColors.blue),
                  foregroundColor: AppColors.blue,
                ),
                onPressed: () {
                  // Find all selected items
                  final List<Map<String, String>> selectedItems = cartItems
                      .asMap()
                      .entries
                      .where((entry) => _selectedItems[entry.key])
                      .map((entry) => entry.value)
                      .toList();

                  if (selectedItems.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BidAmountScreen(
                          itemData: selectedItems.first, // First item for compatibility
                          selectedItems: selectedItems, // All selected items
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please select an item to bid on'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(16.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Bid',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final Map<String, String> itemData;
  final bool selected;
  final VoidCallback onSelect;

  const CartItemTile({
    Key? key,
    required this.itemData,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(12.r),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Card(
        margin: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 20.w, right: 2.w),
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide.none,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
          child: Row(
            children: <Widget>[
              Hero(
                tag: 'nft_image_${itemData['name']}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 44.w,
                    height: 44.h,
                    imageUrl: itemData['imageUrl']!,
                    errorWidget: (BuildContext ctx, String str, Object obj) =>
                        Container(color: Colors.amber),
                    progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                        CircularProgressIndicator(strokeWidth: 2.w),
                  ),
                ),
              ),
              Gap(16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      itemData['name']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Floor Price',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      itemData['usdValue']!,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      itemData['price']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              // Update the icon to use PhosphorIconsFill instead of Icons
              Gap(12.w),
              selected 
                ? Icon(
                    PhosphorIconsFill.checkCircle,
                    color: AppColors.blue,
                    size: 22.sp,
                  )
                : SizedBox(width: 22.sp, height: 22.sp), // Empty space when unselected
            ],
          ),
        ),
      ),
    );
  }
}