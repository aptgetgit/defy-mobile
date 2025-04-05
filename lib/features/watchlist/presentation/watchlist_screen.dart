import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../components/watchlist_nft_tab.dart';
import '../components/watchlist_token_tab.dart';
import 'providers/watchlist_provider.dart';

class WatchListScreen extends ConsumerStatefulWidget {
  const WatchListScreen({super.key});

  @override
  ConsumerState<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<WatchListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    
    // Initialize tab controller and set to the last selected tab index from provider
    final int selectedTabIndex = ref.read(watchlistProvider).selectedTabIndex;
    _tabController = TabController(
      length: 2, 
      vsync: this, 
      initialIndex: selectedTabIndex,
    );
    
    // Listen for tab changes to update provider
    _tabController.addListener(_handleTabChange);
  }
  
  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      // Update the selected tab index in the provider
      ref.read(watchlistProvider.notifier).setSelectedTab(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController..removeListener(_handleTabChange)
    ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              PhosphorIconsBold.caretLeft,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
          title: Text(
            'Watchlist',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: IconButton(
                onPressed: () {
                  // This could show favorite collections or perform other actions
                  // using the provider state
                },
                icon: Icon(
                  PhosphorIconsRegular.star,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Add the tab bar here with full-width bottom line
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.greyVeryLight,
                        width: 1.h,
                      ),
                    ),
                  ),
                  child: CustomTabBar(
                    tabController: _tabController,
                    tabs: const <String>[
                      'NFTs',
                      'Tokens',
                    ],
                  ),
                ),
              ),
              Gap(32.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      const WatchlistNFTTab(),
                      const WatchlistTokensTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}