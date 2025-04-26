import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../borrow/presentation/screens/borrow_screen.dart';
import '../../explore/presentation/screens/explore_screen.dart';
import '../../lend/presentation/screens/lend_screen.dart';
import '../../stake/presentation/stake_screen.dart';
import '../../watchlist/presentation/watchlist_screen.dart';


class WalletMoreScreen extends StatefulWidget {
  const WalletMoreScreen({super.key});

  @override
  State<WalletMoreScreen> createState() => _WalletMoreScreenState();
}

class _WalletMoreScreenState extends State<WalletMoreScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ),);
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _onViewLessPressed() {
    _animationController.reverse().then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) => SlideTransition(
    position: _slideAnimation,
    child: Scaffold(
        body: SingleChildScrollView( // For overall screen scrolling
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Gap(70.h),
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text(
                    'More', 
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Gap(16.h),
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const MoreButton(imagePath: 'assets/icons/onramp-logo.png', text: 'Onramp'),
                    MoreButton(
                      imagePath: 'assets/icons/offramp-logo.png', 
                      text: 'Stake', 
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const StakeScreen(),
                        ),);
                      },
                    ),
                    MoreButton(
                      imagePath: 'assets/icons/mints-logo.png', 
                      text: 'Explore', 
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const ExploreScreen(),
                        ),);
                      },
                    ),
                    MoreButton(
                      imagePath: 'assets/icons/ledborrow-logo.png', 
                      text: 'Lend', 
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const LendScreen(),
                        ),);
                      },
                    ),
                  ],
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MoreButton(
                      imagePath: 'assets/icons/ledborrow-logo.png', 
                      text: 'Borrow', 
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const BorrowScreen(),
                        ),);
                      },
                    ),
                    MoreButton(
                      imagePath: 'assets/icons/watchlist-logo.png', 
                      text: 'Watchlist', 
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const WatchListScreen(),
                        ),);
                      },
                    ),
                    const MoreButton(imagePath: 'assets/icons/invitefriend-logo.png', text: 'Invite friend'),
                    const MoreButton(imagePath: 'assets/icons/support-logo.png', text: 'Support'),
                  ],
                ),
    
                Gap(24.h),
                // Investment Section
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text(
                    'Investment', 
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Gap(16.h),
                // Scrollable Investment Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/invest.png', 
                      height: 242.h,
                      width: 177.w,
                    ),
                    Gap(8.w),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/trading.png', 
                          height: 119.h, 
                          width: 176.w,
                        ),
                        Gap(8.h),
                        Image.asset(
                          'assets/images/marketplace.png', 
                          height: 115.h, 
                          width: 176.w,
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(172.h),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    width: 153.w,
                    height: 44.h,
                    child: Center( // "View less" button at the bottom
                      child: TextButton(
                        onPressed: _onViewLessPressed,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.white, // Text color
                          textStyle: TextStyle(fontSize: 20.sp),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle, 
                                color: AppColors.white,
                              ),
                              child: Icon(PhosphorIconsBold.caretUp, color: AppColors.black, size: 20.sp),
                            ),
                            Gap(8.w),
                            Text('View less', style: TextStyle(fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  );
}

// More Button Widget
class MoreButton extends StatelessWidget {
  const MoreButton({required this.imagePath, required this.text, super.key, this.onTap});
  
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 90.w,
    child: GestureDetector(
      onTap: onTap,
      child: Column(
          children: <Widget>[
            Image.asset(
              imagePath, 
              height: 60.h, 
              width: 60.w,
            ),
            Text(
              text, 
              style: TextStyle(
                color: AppColors.greyDark, 
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
    ),
  );
}
