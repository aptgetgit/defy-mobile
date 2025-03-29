import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import 'watchlist_newList_tile.dart';

class WatchListNewCollectionHomeScreen extends StatefulWidget {
  const WatchListNewCollectionHomeScreen({super.key});

  @override
  State<WatchListNewCollectionHomeScreen> createState() => _WatchListNewCollectionHomeScreenState();
}

class _WatchListNewCollectionHomeScreenState extends State<WatchListNewCollectionHomeScreen> {
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  String _searchQuery = '';
  bool _isTextFieldFocused = false; // Add this to track focus state
  final FocusNode _searchFocusNode = FocusNode(); // Add focus node

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenKeyboardVisibility();
    });
    _searchController.addListener(_onTextChange);
    _searchFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = _searchFocusNode.hasFocus;
    });
  }

  void _onTextChange() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _clearText() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }


  void _listenKeyboardVisibility() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        onChange: () {
          final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          setState(() {
            _isKeyboardOpen = isOpen;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onTextChange);
    _searchFocusNode.removeListener(_onFocusChange);
    _searchController.dispose();
    super.dispose();
  }

  // Update the search bar implementation in the _showSelectTokensBottomSheet method
  void _showSelectTokensBottomSheet(BuildContext context) {
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title and Close Button - keep existing code
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 24.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Select Tokens',
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
              
              // Search Bar - updated implementation
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    // When container is tapped, give focus to the TextField
                    _searchFocusNode.requestFocus();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 244, 244, 246),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        // TextField with animated search icon and placeholder
                        Row(
                          children: <Widget>[
                            // Animated icon container
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 40.w,
                              alignment: (_isTextFieldFocused || _searchQuery.isNotEmpty) 
                                  ? Alignment.centerLeft 
                                  : Alignment.center,
                              padding: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                  ? EdgeInsets.only(left: 12.w)
                                  : null,
                              child: Icon(
                                PhosphorIconsBold.magnifyingGlass,
                                color: AppColors.greyLight,
                                size: 20.sp,
                              ),
                            ),
                            
                            // Expanded TextField
                            Expanded(
                              child: TextField(
                                focusNode: _searchFocusNode,
                                controller: _searchController,
                                autofocus: false,
                                showCursor: _isTextFieldFocused || _searchQuery.isNotEmpty,
                                onChanged: (String value) {
                                  setState(() {
                                    _searchQuery = value;
                                  });
                                },
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // Use regular hintText instead of the manual positioning
                                  hintText: _isTextFieldFocused || _searchQuery.isNotEmpty ? "" : "Search for assets",
                                  hintStyle: TextStyle(
                                    color: AppColors.greyLight,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 11.h),
                                  suffixIcon: _searchQuery.isNotEmpty
                                      ? IconButton(
                                          icon: CircleAvatar(
                                            backgroundColor: const Color.fromARGB(255, 189, 189, 189),
                                            radius: 10.r,
                                            child: Center(
                                              child: Icon(
                                                PhosphorIconsBold.x,
                                                color: AppColors.white,
                                                size: 12.sp,
                                              ),
                                            ),
                                          ),
                                          onPressed: _clearText,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Token List - keep existing code
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: 4, // 4 items as shown in the image
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    // visualDensity: VisualDensity.compact,
                    dense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                      leading: CircleAvatar(
                        radius: 20.r,
                        backgroundImage: const AssetImage('assets/icons/aptos.png'), // Replace with your token icon
                      ),
                      title: Text(
                        'Aptos',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      subtitle: Text(
                        'APT',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyLight,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '\$14,232.84',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            '+18%',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
              
              // Add To Button - keep existing code
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 4, 20.w, 24.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle "Add To Dummy" action
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: Text(
                      'Add To Dummy',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: IconButton(
              icon: Icon(PhosphorIconsRegular.star, size: 24.sp),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: <Widget>[
            Text(
              'Name Your Collection',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
            Gap(20.h),
            Hero(
              tag: 'new_list',
              child: GestureDetector(
                onTap: () {
                  _showSelectTokensBottomSheet(context);
                },
                child: const WatchlistNewListTile(),
              ),
            ),
            Gap(30.h),
            TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 24.sp),
              decoration: const InputDecoration(
                hintText: 'List Name',
                hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
                border: InputBorder.none, // Removes the border
              ),
              textAlign: TextAlign.center, // Aligns text to center
            ),
            const Spacer(),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24.h),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        // Handle create action
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? Colors.black
                      : AppColors.greyMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: _isButtonEnabled
                          ? Colors.white // White when enabled
                          : AppColors.greyLight,
                    ),
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

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({required this.onChange});
  final VoidCallback onChange;

  @override
  void didChangeMetrics() {
    onChange();
  }
}
