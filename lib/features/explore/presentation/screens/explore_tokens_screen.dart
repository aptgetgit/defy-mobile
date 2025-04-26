import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../providers/explore_provider.dart';

import '../providers/explore_state.dart';
import '../widgets/token_card_widgets.dart';
import '../widgets/token_list_widget.dart';


class ExploreTokensScreen extends ConsumerStatefulWidget {
  const ExploreTokensScreen({super.key});

  @override
  ConsumerState<ExploreTokensScreen> createState() => _ExploreTokensScreenState();
}

class _ExploreTokensScreenState extends ConsumerState<ExploreTokensScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  final PageController pageController = PageController();
  late TabController _tabController;
  bool _isToggled = false; // Track the toggle state here

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    
    final exploreState = ref.read(exploreNotifierProvider);
    _isToggled = exploreState.isToggled;
    _tabController = TabController(
      length: _isToggled ? 2 : 4,
      vsync: this,
    );

    // Add listener to tab controller to update the provider state
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(exploreNotifierProvider.notifier).setCurrentTab(_tabController.index);
      }
    });

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        final nextPage = (currentPage.value + 1) % 3;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
      }
    });
  }

  void _onSearchChanged() {
    ref.read(exploreNotifierProvider.notifier).searchTokens(_searchController.text);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safe place to check for state changes that require controller updates
    final exploreState = ref.read(exploreNotifierProvider);
    if (_isToggled != exploreState.isToggled) {
      _isToggled = exploreState.isToggled;
      _recreateTabController();
    }
  }

  void _recreateTabController() {
    final oldIndex = _tabController.index;
    _tabController.dispose();
    _tabController = TabController(
      length: _isToggled ? 2 : 4,
      vsync: this,
      initialIndex: oldIndex < (_isToggled ? 2 : 4) ? oldIndex : 0,
    );
    // Re-add the listener
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        ref.read(exploreNotifierProvider.notifier).setCurrentTab(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    currentPage.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreState = ref.watch(exploreNotifierProvider);
    
    // Track toggle changes to update controller in didChangeDependencies
    if (_isToggled != exploreState.isToggled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          // This will trigger didChangeDependencies next frame
        });
      });
    }

    // Use keys to help Flutter identify when structure completely changes
    final tabKey = exploreState.isToggled ? 'emoji-tabs' : 'all-tabs';
    final tabViewKey = exploreState.isToggled ? 'emoji-tabview' : 'all-tabview';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tokens',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Search bar with toggle button
            _buildSearchBarAndToggle(exploreState),

            // Hot Emoji Card Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SizedBox(
                height: 220.h,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  children: [
                    TokenCardWidgets.buildHotEmojiCard(currentPage: currentPage),
                    TokenCardWidgets.buildHotWheelsCard(currentPage: currentPage),
                    TokenCardWidgets.buildNoobRacersCard(currentPage: currentPage),
                  ],
                ),
              ),
            ),

            // Tab Bar section - with key
            Padding(
              key: Key(tabKey),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomTabBar(
                    tabController: _tabController,
                    tabs: exploreState.isToggled 
                      ? ['Emoji', 'Tokens']
                      : ['All', 'Emoji', 'Defi', 'Meme'],
                    isScrollable: true,
                    withPositionedIndicator: false, // Change to false as we're managing our own divider
                  ),
                  // Add positioned divider at the bottom like in wallet screen
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 350.w,
                      height: 1,
                      color: AppColors.greyVeryLight,
                    ),
                  ),
                ],
              ),
            ),

            // Tab View Content - with key
            Expanded(
              key: Key(tabViewKey),
              child: TabBarView(
                controller: _tabController,
                children: exploreState.isToggled
                  ? <Widget>[
                      TokenListWidget(tokens: exploreState.displayedTokens
                        .where((t) => t.tileType == 'emoji').toList()),
                      TokenListWidget(tokens: exploreState.displayedTokens),
                    ]
                  : <Widget>[
                      TokenListWidget(tokens: exploreState.displayedTokens),
                      TokenListWidget(tokens: exploreState.displayedTokens
                        .where((t) => t.tileType == 'emoji').toList()),
                      TokenListWidget(tokens: exploreState.displayedTokens
                        .where((t) => t.name.toString().contains('Pancake')).toList()),
                      TokenListWidget(tokens: exploreState.displayedTokens
                        .where((t) => t.priceUsd < 3.0).toList()),
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarAndToggle(ExploreState exploreState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: <Widget>[
          // Search Bar
          Expanded(
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xfff4f4f6),
                borderRadius: BorderRadius.circular(58.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(16.w),
                  Icon(
                    PhosphorIconsBold.magnifyingGlass,
                    color: AppColors.greyMedium,
                    size: 18.sp,
                  ),
                  Gap(8.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search or paste URL',
                        hintStyle: TextStyle(
                          color: AppColors.greyMedium,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    PhosphorIconsBold.cards,
                    color: AppColors.greyMedium,
                    size: 18.sp,
                  ),
                  Gap(16.w),
                ],
              ),
            ),
          ),

          // Custom Toggle Button with Label
          Gap(8.w),
          GestureDetector(
            onTap: () {
              ref.read(exploreNotifierProvider.notifier).toggleRocketMode();
              // Don't recreate here - will be handled by didChangeDependencies
            },
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 46.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    color: exploreState.isToggled ? Colors.orange : AppColors.greyMedium,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withAlpha(51),
                        spreadRadius: -2.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Align(
                    alignment: exploreState.isToggled ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 22.w,
                      height: 22.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Gap(2.h),
                Text(
                  '🚀 mode',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}