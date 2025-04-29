import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config/theme/colors.dart';
import 'explore_buy_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _showDeleteMode = false;
  final Set<int> _selectedItems = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDeleteButton() {
    setState(() {
      _showDeleteMode = !_showDeleteMode;
    });

    if (_showDeleteMode) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(right: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _showDeleteMode ? AppColors.red.withOpacity(0.2) : AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: GestureDetector(
              onTap: _showDeleteMode
                  ? () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Clear Cart', style: TextStyle(fontSize: 22.sp)),
                          content: Text('Are you sure you want to remove all items?', style: TextStyle(fontSize: 16.sp)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Add clear cart functionality here
                              },
                              child: Text('Clear', style: TextStyle(color: AppColors.red, fontSize: 16.sp)),
                            ),
                          ],
                        ),
                      );
                    }
                  : () {},
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.3, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: Text(
                  _showDeleteMode ? 'Clear Cart' : 'Edit',
                  key: ValueKey(_showDeleteMode ? 'clear_cart' : 'edit'),
                  style: TextStyle(
                    color: _showDeleteMode ? AppColors.red : AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: _showDeleteMode ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                          deleteMode: _showDeleteMode,
                          isSelected: _selectedItems.contains(index),
                          onDelete: () {
                            // Delete functionality would go here
                          },
                          onTap: () {
                            setState(() {
                              if (_selectedItems.contains(index)) {
                                _selectedItems.remove(index);
                              } else {
                                _selectedItems.add(index);
                              }
                            });
                          },
                        );
                      },
                    ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(26.w, 16.h, 26.w, 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _showDeleteMode ? 0.0 : 1.0,
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: SizedBox(
                        width: _showDeleteMode ? 0 : 160.w,
                        height: 56.h,
                        child: _showDeleteMode
                            ? null
                            : FilledButton(
                                onPressed: () {
                                  // Only navigate if at least one item is selected
                                  if (_selectedItems.isNotEmpty) {
                                    final selectedItemIndex = _selectedItems.first;
                                    final selectedItem = cartItems[selectedItemIndex];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExploreBuyScreen(
                                          selectedItem: selectedItem,
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Show a snackbar or dialog to prompt user to select an item
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Please select an item first'),
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
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      PhosphorIconsRegular.shoppingCart,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    Gap(8.w),
                                    Text(
                                      'Checkout',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.only(left: _showDeleteMode ? 0 : 12.w),
                      child: FilledButton(
                        onPressed: _toggleDeleteButton,
                        style: FilledButton.styleFrom(
                          backgroundColor: _showDeleteMode ? AppColors.black : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _showDeleteMode ? 'Cancel' : 'Remove',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemTile extends StatefulWidget {
  final Map<String, String> itemData;
  final bool deleteMode;
  final bool isSelected;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const CartItemTile({
    Key? key,
    required this.itemData,
    required this.deleteMode,
    this.isSelected = false,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  static bool _globalDeleteMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Initialize state based on delete mode
    _globalDeleteMode = widget.deleteMode;
    
    // If we're starting in delete mode, initialize the animation accordingly
    if (widget.deleteMode) {
      _controller.value = 1.0;
    }
    
    // If item is already selected, set the animation value
    if (widget.isSelected) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CartItemTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Handle animation when the MODE changes
    if (oldWidget.deleteMode != widget.deleteMode) {
      _globalDeleteMode = widget.deleteMode;
      
      if (widget.deleteMode) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    
    // Handle animation when item selection changes
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
              // NFT Image with Hero tag
              Hero(
                tag: 'nft_image_${widget.itemData['name']}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 44.w,
                    height: 44.h,
                    imageUrl: widget.itemData['imageUrl']!,
                    errorWidget: (BuildContext ctx, String str, Object obj) =>
                        Container(color: Colors.amber),
                    progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                        CircularProgressIndicator(strokeWidth: 2.w),
                  ),
                ),
              ),
              
              Gap(16.w),
              
              // NFT Details
              Expanded(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.itemData['name']!,
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
              
              // Increase the gap between NFT details and price info
              const Spacer(),
              
              // Price info
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.isSelected || widget.deleteMode ? null : 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.itemData['usdValue']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                   Gap(4.h),
                    Text(
                      widget.itemData['price']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              
            
              
              // Selection/delete icon with slide animation
              if (widget.deleteMode)
                SlideTransition(
                  position: _offsetAnimation,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 24.w,
                      minHeight: 24.h,
                    ),
                    onPressed: widget.onDelete,
                    icon: Icon(
                      PhosphorIconsFill.trash,
                      color: AppColors.red,
                      size: 22.sp,
                    ),
                  ),
                )
              else
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeOutQuad,
                  )),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: widget.isSelected ? 1.0 : 0.0,
                    child: widget.isSelected
                      ? Icon(
                          PhosphorIconsFill.checkCircle,
                          color: AppColors.blue,
                          size: 22.sp,
                        )
                      : Icon(
                          PhosphorIconsFill.checkCircle,
                          color: AppColors.blue.withOpacity(0),
                          size: 22.sp,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}