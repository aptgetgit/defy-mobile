import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../../data/models/token.dart';
import '../providers/swap_provider.dart';
import '../widgets/token_list_item.dart';

class SwapScreen extends ConsumerStatefulWidget {
  const SwapScreen({super.key});

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends ConsumerState<SwapScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = <String>['ALL', 'EMOJI', 'MEME', 'STABLE'];
  
  // Animation controllers
  late AnimationController _buttonAnimController;
  late Animation<Offset> _buttonSlideAnimation;
  
  // Animation for the bottom container
  late Animation<Offset> _containerSlideAnimation;
  
  bool _previousBothTokensSelected = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    
    // Initialize animation controller
    _buttonAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    
    // Define slide animation for the button (from bottom)
    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero,          // End at its final position
    ).animate(
      CurvedAnimation(
        parent: _buttonAnimController,
        curve: Curves.easeOutCubic,
      ),
    );
    
    // Define slide animation for the container (move up)
    _containerSlideAnimation = Tween<Offset>(
      begin: Offset.zero,          // Start at normal position
      end: const Offset(0, -0.3),  // Move up
    ).animate(
      CurvedAnimation(
        parent: _buttonAnimController,
        curve: Curves.easeOutCubic,
      ),
    );
    
    // Set "from" container as active initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(swapProvider.notifier).setActiveBox('from');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _buttonAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final SwapState swapState = ref.watch(swapProvider);
        final List<Token> tokens = swapState.tokens;
        final Token? fromToken = swapState.fromToken;
        final Token? toToken = swapState.toToken;
        final String? activeBox = swapState.activeBox;
        
        // Check if both tokens are selected
        final bool bothTokensSelected = fromToken != null && toToken != null;
        
        // Handle animation when selection state changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (bothTokensSelected && !_previousBothTokensSelected) {
            _buttonAnimController.forward();
          } else if (!bothTokensSelected && _previousBothTokensSelected) {
            _buttonAnimController.reverse();
          }
          _previousBothTokensSelected = bothTokensSelected;
        });

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 24.sp),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Swap',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              // Search bar and tabs
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Tokens',
                          contentPadding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.h),
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 207, 210, 216),
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: const Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color: AppColors.greyMedium,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColors.greyVeryLight,
                        ),
                      ),
                    ),
                    Gap(16.h),
                    CustomTabBar(
                      tabController: _tabController,
                      tabs: const <String>['All', 'Emoji', 'Meme', 'Stable'],
                      trailing: Icon(
                        PhosphorIconsBold.dotsThreeVertical,
                        size: 24.sp,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              // Token list
              Expanded(
                child: ListView.builder(
                  itemCount: tokens.length,
                  itemBuilder: (BuildContext context, int index) => TokenListItem(
                      token: tokens[index],
                      onTap: () {
                        if (activeBox == 'from') {
                          ref.read(swapProvider.notifier).setFromToken(tokens[index]);
                          // Auto-switch to "to" container after selecting "from" token
                          ref.read(swapProvider.notifier).setActiveBox('to');
                        } else if (activeBox == 'to') {
                          ref.read(swapProvider.notifier).setToToken(tokens[index]);
                        }
                      },
                    ),
                ),
              ),
              
              // Container for bottom section and button with animations
              SizedBox(
                height: 168.h, // Give enough space for both container and button
                child: Stack(
                  children: <Widget>[
                    // Bottom section with animation
                    AnimatedBuilder(
                      animation: _buttonAnimController,
                      builder: (BuildContext context, Widget? child) => SlideTransition(
                        position: _containerSlideAnimation,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w, 
                            right: 16.w, 
                            bottom: 40.h * (_buttonAnimController.value),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(24.r),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 16,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                // Row with from/to containers
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // From container
                                    GestureDetector(
                                      onTap: () {
                                        ref.read(swapProvider.notifier).setActiveBox('from');
                                      },
                                      child: Container(
                                        width: (MediaQuery.of(context).size.width - 48.w - 40.w) / 2,
                                        height: 64.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.greyVeryLight,
                                          borderRadius: BorderRadius.circular(12.r),
                                          border: activeBox == 'from'
                                              ? Border.all(color: AppColors.blue)
                                              : null,
                                        ),
                                        child: fromToken == null
                                            ? Shimmer.fromColors(
                                                baseColor: AppColors.greyMedium,
                                                highlightColor: AppColors.white,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 32.w,
                                                      height: 32.h, 
                                                      decoration: BoxDecoration(
                                                        color: AppColors.greyMedium,
                                                        borderRadius: BorderRadius.circular(6.56.r),
                                                      ),
                                                    ),
                                                    Gap(10.w),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Container(
                                                          width: 62.w,
                                                          height: 9.h, 
                                                          decoration: BoxDecoration(
                                                            color: AppColors.greyMedium,
                                                            borderRadius: BorderRadius.circular(2.r),
                                                          ),
                                                        ),
                                                        Gap(8.h),
                                                        Container(
                                                          width: 62.w,
                                                          height: 3.h, 
                                                          decoration: BoxDecoration(
                                                            color: AppColors.greyMedium,
                                                            borderRadius: BorderRadius.circular(1.r),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                                              child: Row(
                                                  children: <Widget>[
                                                    Image.asset(fromToken.icon, width: 44.w, height: 44.h),
                                                    Gap(8.w),
                                                    Text(
                                                      fromToken.symbol,
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                      ),
                                    ),
                                    // To container
                                    GestureDetector(
                                      onTap: () {
                                        ref.read(swapProvider.notifier).setActiveBox('to');
                                      },
                                      child: Container(
                                        width: (MediaQuery.of(context).size.width - 48.w - 40.w) / 2,
                                        height: 64.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.greyVeryLight,
                                          borderRadius: BorderRadius.circular(12.r),
                                          border: activeBox == 'to'
                                              ? Border.all(color: AppColors.blue)
                                              : null,
                                        ),
                                        child: toToken == null
                                            ? Shimmer.fromColors(
                                                baseColor: AppColors.greyMedium,
                                                highlightColor: AppColors.white,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 32.w,
                                                      height: 32.h, 
                                                      decoration: BoxDecoration(
                                                        color: AppColors.greyMedium,
                                                        borderRadius: BorderRadius.circular(6.56.r),
                                                      ),
                                                    ),
                                                    Gap(8.w),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Container(
                                                          width: 62.w,
                                                          height: 9.h, 
                                                          decoration: BoxDecoration(
                                                            color: AppColors.greyMedium,
                                                            borderRadius: BorderRadius.circular(2.r),
                                                          ),
                                                        ),
                                                        Gap(8.h),
                                                        Container(
                                                          width: 62.w,
                                                          height: 3.h, 
                                                          decoration: BoxDecoration(
                                                            color: AppColors.greyMedium,
                                                            borderRadius: BorderRadius.circular(1.r),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                                              child: Row(
                                                  children: <Widget>[
                                                    Image.asset(toToken.icon, width: 44.w, height: 44.h),
                                                    Gap(8.w),
                                                    Text(
                                                      toToken.symbol,
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Swap button
                                Positioned(
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (fromToken != null && toToken != null) {
                                        ref.read(swapProvider.notifier).setFromToken(toToken);
                                        ref.read(swapProvider.notifier).setToToken(fromToken);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.greyVeryLight,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.25),
                                            blurRadius: 2,
                                            offset: const Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        PhosphorIconsRegular.arrowsLeftRight,
                                        size: 24.sp,
                                        color: AppColors.greyLight,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Animated Continue Button
                    Positioned(
                      bottom: 32.h,
                      left: 16.w,
                      right: 16.w,
                      child: AnimatedBuilder(
                        animation: _buttonAnimController,
                        builder: (BuildContext context, Widget? child) => SlideTransition(
                            position: _buttonSlideAnimation,
                            child: Opacity(
                              opacity: _buttonAnimController.value,
                              child: ElevatedButton(
                                onPressed: bothTokensSelected ? () {
                                  const SwapAmountRoute().push(context);
                                } : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.black,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  minimumSize: Size(double.infinity, 56.h),
                                ),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
}