import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';

class NextSellScreen extends StatefulWidget {
  final Map<String, dynamic> selectedNFT;
  final List<Map<String, dynamic>>? allSelectedNFTs;

  const NextSellScreen({
    Key? key,
    required this.selectedNFT,
    this.allSelectedNFTs,
  }) : super(key: key);

  @override
  State<NextSellScreen> createState() => _NextSellScreenState();
}

class _NextSellScreenState extends State<NextSellScreen> {
  late final List<Map<String, dynamic>> _items;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _items = widget.allSelectedNFTs ?? [widget.selectedNFT];
    final int initialPage = _items.indexWhere((item) => item['id'] == widget.selectedNFT['id']);
    _currentPage = initialPage < 0 ? 0 : initialPage;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 12.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            Text(
              'Sell NFT',
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
                      for (int i = 0; i < (_items.length > 3 ? 3 : _items.length); i++)
                        Positioned(
                          right: i * 5.w,
                          child: Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(color: Colors.white, width: 1.w),
                              image: DecorationImage(
                                image: _items[i]['imageUrl'].toString().startsWith('http')
                                    ? NetworkImage(_items[i]['imageUrl'])
                                    : AssetImage(_items[i]['imageUrl']) as ImageProvider,
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
                  '${_items.length} ${_items.length == 1 ? 'item' : 'items'}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
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
                color: Colors.grey[200],
                height: 1.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _items.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final nft = _items[index];
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Column(
                children: [
                  Hero(
                    tag: 'nft-image-${nft['id']}',
                    child: Material(
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          nft['imageUrl'] as String,
                          width: 300.w,
                          height: 300.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Text(
                    nft['id'].toString(),
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Gap(8.h),
                  Text(
                    nft['price'].toString(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          );
        },
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
              padding: EdgeInsets.only(left: 4.w),
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
            Divider(
              color: AppColors.greyVeryLight,
              thickness: 1,
              height: 1,
            ),
            Gap(14.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement checkout logic
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
                      'Sell Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if ((_items[_currentPage]['price'] ?? '').toString().isNotEmpty) ...[
                      Gap(10.w),
                      Text(
                        _items[_currentPage]['price'].toString(),
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
}