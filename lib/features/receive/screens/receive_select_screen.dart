import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import 'receive_amount_screen.dart';
import 'receive_share_screen.dart';

class ReceiveSelectScreen extends ConsumerStatefulWidget {
  const ReceiveSelectScreen({super.key});

  @override
  _ReceiveSelectScreenState createState() => _ReceiveSelectScreenState();
}

class _ReceiveSelectScreenState extends ConsumerState<ReceiveSelectScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;

  // Titles and subtitles for each page
  final List<Map<String, String>> _pageTitles = <Map<String, String>>[
    <String, String>{'title': 'Select Asset', 'subtitle': 'Request tokens'},
    <String, String>{'title': 'Enter Amount', 'subtitle': 'Request tokens'},
    <String, String>{'title': 'Share Link', 'subtitle': 'Request tokens'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showSearchIcon) {
      setState(() {
        _showSearchIcon = true;
      });
    } else if (_scrollController.offset <= 100 && _showSearchIcon) {
      setState(() {
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentPage = ref.watch(receivePageProvider);
    final ReceivePageNotifier pageNotifier = ref.read(receivePageProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
            onPressed: () {
              if (currentPage > 0) {
                pageNotifier.previousPage();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (int index) {
              final bool isActive = (index + 1) == currentPage + 1;
              final bool isVisited = (index + 1) <= currentPage + 1;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                height: isActive ? 6.h : 4.h,
                width: isActive ? 69.w : 42.w,
                decoration: BoxDecoration(
                  color: isVisited ? AppColors.green : AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              );
            }),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Fixed Section (Title, Subtitle, Search Bar)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Gap(10.h),
                  // Dynamic Title and Subtitle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _pageTitles[currentPage]['title']!,
                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                      if (currentPage == 0)
                        AnimatedOpacity(
                          opacity: _showSearchIcon ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: IconButton(
                            icon: Icon(PhosphorIconsBold.magnifyingGlass, size: 24.sp),
                            onPressed: () {
                              // Handle search icon press
                            },
                          ),
                        ),
                    ],
                  ),
                  Gap(8.h),
                  Text(
                    _pageTitles[currentPage]['subtitle']!,
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
            if (currentPage == 0)
              AnimatedOpacity(
                opacity: _showSearchIcon ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Search Assets',
                            hintStyle: TextStyle(
                              color: AppColors.greyLight,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                        ),
                        Positioned(
                          left: 100.w,
                          child: Icon(
                            PhosphorIconsBold.magnifyingGlass,
                            color: AppColors.greyLight,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Gap(20.h),

            // Scrollable Section (PageView)
            Expanded(
              child: PageView(
                controller: pageNotifier.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  debugPrint('PageView onPageChanged: index = $index');
                  // Only update if the index differs from the provider state.
                  if (index != ref.read(receivePageProvider)) {
                    pageNotifier.setPage(index);
                  }
                },
                children: <Widget>[
                  // Page 1: Asset List
                  KeyedSubtree(
                    key: const ValueKey('assetListPage'),
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      itemCount: _assets.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, String> asset = _assets[index];
                        return AssetItem(
                          name: asset['name'],
                          symbol: asset['symbol'],
                          imagePath: asset['imagePath'],
                          onTap: () {
                            debugPrint('AssetItem tapped: ${asset['name']}, currentPage: $currentPage');
                            if (currentPage == 0) { // only trigger if we're on the asset list page
                              pageNotifier.nextPage();
                            } else {
                              debugPrint('Ignoring tap; already navigated.');
                            }
                          },
                        );
                      },
                    ),
                  ),
                  // Page 2: Enter Amount Screen
                  const KeyedSubtree(
                    key: ValueKey('amountPage'),
                    child: ReceiveAmountScreen(),
                  ),
                  // Page 3: Share Link Screen
                  const KeyedSubtree(
                    key: ValueKey('sharePage'),
                    child: ReceiveShareScreen(),
                  ),
                ],
              ),
            ),

            // Next Button (Only shown on pages other than the first page)
            if (currentPage != 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  onPressed: currentPage == 2 ? () {
                    _showShareBottomSheet(context);
                  } : pageNotifier.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentPage == 2 ? AppColors.blue : AppColors.black,
                    minimumSize: Size(double.infinity, 56.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                  child: Text(
                    currentPage == 2 ? 'Share Link' : 'Continue',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _assets = <Map<String, String>>[
    <String, String>{'name': 'Aptos', 'symbol': 'APT', 'imagePath': 'assets/icons/aptos.png'},
    <String, String>{'name': 'Gui inu', 'symbol': 'GUI', 'imagePath': 'assets/icons/gui-inu.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Pancake', 'symbol': 'CAKE', 'imagePath': 'assets/icons/pancake.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
  ];

  // Function to show the bottom sheet
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 24.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Share this page',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(PhosphorIconsRegular.x, size: 24.sp),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                child: Image.asset(
                  'assets/images/share-qr.png',
                  width: 380.w,
                  height: 502.h,
                ),
              ),
              Gap(24.h),
              // Share Options
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Row(
                    children: <Widget>[
                      _buildShareOption(
                        icon: PhosphorIconsRegular.downloadSimple, 
                        label:'Save',
                        onPressed: () {},
                      ),
                      Gap(30.w),
                      _buildShareOption(
                        icon: PhosphorIconsRegular.clipboard, 
                        label:'Copy',
                        onPressed: () {},
                      ),
                      Gap(30.w),
                      _buildShareOption(
                        imagePath: 'assets/icons/whatsapp.png',
                        label:'Whatsapp',
                        onPressed: () {},
                      ),
                      Gap(30.w),
                      _buildShareOption(
                        imagePath: 'assets/icons/telegram.png', 
                        label:'Telegram',
                        onPressed: () {},
                      ),
                      Gap(30.w),
                      _buildShareOption(
                        imagePath: 'assets/icons/x.png', 
                        label:'X',
                        onPressed: () {},
                      ),
                      Gap(30.w),
                      _buildShareOption(
                        icon: PhosphorIconsFill.dotsThreeOutline, 
                        label:'More',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Gap(24.h),
            ],
          ),
        ),
    );
  }

  // Helper function to build share option buttons
  Widget _buildShareOption({
    IconData? icon, // Optional icon
    String? imagePath, // Optional image path
    required String label,
    required VoidCallback onPressed,
  }) => Column(
      children: <Widget>[
        CircleAvatar(
          radius: 24.r, // Adjust the size of the circle
          backgroundColor: Colors.grey.shade200, // Background color of the circle
          child: ClipOval(
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    width: 48.w, // Adjust the size of the image
                    height: 48.h,
                    fit: BoxFit.cover, // Fill the circle with the image
                  )
                : Icon(
                    icon,
                    size: 24.sp, // Adjust the size of the icon
                    color: Colors.black, // Icon color
                  ),
          ),
        ),
        Gap(8.h), // Space between the circle and the label
        Text(
          label,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
}

// Widget for Each Asset Item
class AssetItem extends StatelessWidget {
  const AssetItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.imagePath,
    this.onTap,
  });
  final String? name;
  final String? symbol;
  final String? imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imagePath!),
        radius: 22.r,
      ),
      title: Text(
        name!,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        symbol!,
        style: TextStyle(fontSize: 14.sp, color: const Color.fromARGB(255, 151, 157, 170)),
      ),
    ),
  );
}
