import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math'; // Add this import for pi

import '../../../../config/theme/colors.dart';

class ExploreBuyScreen extends StatefulWidget {
  final Map<String, String> selectedItem;
  final List<Map<String, String>>? allSelectedItems;

  const ExploreBuyScreen({
    super.key,
    required this.selectedItem,
    this.allSelectedItems,
  });

  @override
  State<ExploreBuyScreen> createState() => _ExploreBuyScreenState();
}

class _ExploreBuyScreenState extends State<ExploreBuyScreen> {
  late PageController _pageController;
  late List<Map<String, String>> _items;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _items = widget.allSelectedItems ?? [widget.selectedItem];
    _currentPage = _items.indexWhere((item) =>
        item['name'] == widget.selectedItem['name'] &&
        item['imageUrl'] == widget.selectedItem['imageUrl']);
    if (_currentPage < 0) _currentPage = 0;
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 0.8); // Use viewportFraction for carousel
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.white, width: 1.w),
                    image: DecorationImage(
                      image: NetworkImage(_items[_currentPage]['imageUrl']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(4.w),
                Text(
                  '${_items.length} ${_items.length == 1 ? 'item' : 'items'}',
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
      body: Column(
        children: [
          Expanded(
            child: _items.isEmpty
                ? const Center(child: Text("No items selected"))
                : AspectRatio(
                    aspectRatio: 0.85,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _items.length,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return _carouselView(index, _items);
                      },
                    ),
                  ),
          ),
         
        ],
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w), // Add a bit of left padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay Using",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/aptos.png',
                        width: 12.w,
                        height: 12.h,
                      ),
                      Gap(8.w),
                      Text(
                        'APT',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(8.w),
                      Icon(
                        PhosphorIcons.caretDown(),
                        size: 16.sp,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(14.h),
           const Divider(
              color: AppColors.greyVeryLight,
              thickness: 1,
              height: 1,
            ),
            Gap(14.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(95.w, 48.h),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  backgroundColor: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if ((_items[_currentPage]['price'] ?? '').isNotEmpty) ...[
                      Gap(10.w),
                      Text(
                        _items[_currentPage]['price']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselView(int index, List<Map<String, String>> items) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: _carouselCard(items[index]),
        );
      },
    );
  }

  Widget _carouselCard(Map<String, String> data) {
    return Column(
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: AspectRatio(
            aspectRatio: 1, // Make the image square
            child: Hero(
              tag: 'nft_image_${data['name']}',
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(data['imageUrl']!),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            data['name'] ?? '',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data['price'] ?? '',
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}