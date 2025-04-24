import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/colors.dart';

import '../data/models/explore_models.dart';
import '../providers/explore_provider.dart';

import 'explore_token_info_screen.dart';

class ExploreTokensScreen extends ConsumerStatefulWidget {
  const ExploreTokensScreen({super.key});

  @override
  ConsumerState<ExploreTokensScreen> createState() => _ExploreTokensScreenState();
}

class _ExploreTokensScreenState extends ConsumerState<ExploreTokensScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    ref.read(exploreNotifierProvider.notifier).searchTokens(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exploreState = ref.watch(exploreNotifierProvider);

    return DefaultTabController(
      length: exploreState.isToggled ? 2 : 4,
      child: Scaffold(
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
              Padding(
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
              ),

              // Trending Cards section
              if (exploreState.trendingTokens.isNotEmpty)
                Container(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exploreState.trendingTokens.length,
                    itemBuilder: (context, index) {
                      final token = exploreState.trendingTokens[index];
                      return _buildTrendingCard(token);
                    },
                  ),
                ),

              // Tab Bar section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.black,
                        dividerColor: AppColors.greyVeryLight,
                        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                        tabs: exploreState.isToggled
                            ? const <Widget>[
                                Tab(text: 'Emoji'),
                                Tab(text: 'Tokens'),
                              ]
                            : const <Widget>[
                                Tab(text: 'All'),
                                Tab(text: 'Emoji'),
                                Tab(text: 'Defi'),
                                Tab(text: 'Meme'),
                              ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        PhosphorIconsBold.sortAscending,
                        color: AppColors.greyMedium,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        ref.read(exploreNotifierProvider.notifier).showSortSheet();
                        _showSortOptions(context);
                      },
                    ),
                  ],
                ),
              ),

              // Tab View Content
              Expanded(
                child: TabBarView(
                  children: exploreState.isToggled
                      ? <Widget>[
                          _buildTokenList(exploreState.displayedTokens
                              .where((t) => t.symbol.toString().contains('🌐')).toList()),
                          _buildTokenList(exploreState.displayedTokens),
                        ]
                      : <Widget>[
                          _buildTokenList(exploreState.displayedTokens),
                          _buildTokenList(exploreState.displayedTokens
                              .where((t) => t.symbol.toString().contains('🌐')).toList()),
                          _buildTokenList(exploreState.displayedTokens
                              .where((t) => t.name.toString().contains('Pancake')).toList()),
                          _buildTokenList(exploreState.displayedTokens
                              .where((t) => t.priceUsd < 3.0).toList()),
                        ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTokenList(List<ExploreToken> tokens) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: tokens.length,
      itemBuilder: (context, index) {
        final token = tokens[index];
        final isFavorite = ref.watch(exploreNotifierProvider)
            .favoriteTokenIds.contains(token.id);

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(token.logo ?? 'assets/images/default_token.png'),
            radius: 22.r,
          ),
          title: Text(
            token.name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            token.symbol,
            style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(token.priceUsd.toStringAsFixed(2),
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                  Text('${token.changePercentage}%',
                      style: TextStyle(
                          color: token.changePercentage > 0 ? Colors.green : Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  ref.read(exploreNotifierProvider.notifier)
                      .toggleTokenFavorite(token.id);
                },
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ExploreTokenInfoScreen(
                  name: token.name,
                  logoPath: token.logo ?? 'assets/images/default_token.png',
                  percentage: '${token.changePercentage}%',
                  investors: token.investors.toString(),
                  returnPeriod: token.returnPeriod,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTrendingCard(ExploreToken token) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            spreadRadius: 1.r,
            blurRadius: 5.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(token.logo ?? 'assets/images/default_token.png'),
            radius: 30.r,
          ),
          Gap(8.h),
          Text(
            token.name,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            token.symbol,
            style: TextStyle(color: AppColors.grey, fontSize: 12.sp),
          ),
          Gap(8.h),
          Text(
            '\$${token.priceUsd.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final state = ref.watch(exploreNotifierProvider);

        return Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Sort by Price (High to Low)'),
                trailing: state.isSortPriceHighToLowSelected
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  ref.read(exploreNotifierProvider.notifier).setSortOption(
                    isSortPriceHighToLowSelected: true,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sort by Price (Low to High)'),
                trailing: state.isSortPriceLowToHighSelected
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  ref.read(exploreNotifierProvider.notifier).setSortOption(
                    isSortPriceLowToHighSelected: true,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sort by Change (24h)'),
                trailing: state.isSortChangeSelected
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  ref.read(exploreNotifierProvider.notifier).setSortOption(
                    isSortChangeSelected: true,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
