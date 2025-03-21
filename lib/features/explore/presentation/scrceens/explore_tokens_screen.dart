import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

import '../widgets/trending_cards.dart';
import 'explore_token_info_screen.dart';

class ExploreTokensScreen extends StatefulWidget {
  const ExploreTokensScreen({super.key});

  @override
  State<ExploreTokensScreen> createState() => _ExploreTokensScreenState();
}

class _ExploreTokensScreenState extends State<ExploreTokensScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isToggled = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _isToggled ? 2 : 4, // 2 tabs when toggled, 4 when not
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
                          setState(() {
                            _isToggled = !_isToggled;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 46.w,
                              height: 26.h,
                              decoration: BoxDecoration(
                                color: _isToggled ? Colors.orange : AppColors.greyMedium,
                                borderRadius: BorderRadius.circular(50.r),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    spreadRadius: -2.r,
                                    offset: Offset(0, 2.h),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Align(
                                alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
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

                Gap(12.h),

                // Trending Cards with conditional title
                TrendingCards(isToggled: _isToggled),

                Gap(12.h),

                // Tab Bar with Sort Icon
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
                          tabs: _isToggled
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
                          _showSortOptions(context);
                        },
                      ),
                    ],
                  ),
                ),

                // Tab View Content
                Expanded(
                  child: TabBarView(
                    children: _isToggled
                        ? <Widget>[
                            _buildCryptoList(), // Emoji
                            _buildCryptoList(), // Tokens
                          ]
                        : <Widget>[
                            _buildCryptoList(), // All
                            _buildCryptoList(), // Emoji
                            _buildCryptoList(), // Defi
                            _buildCryptoList(), // Meme
                          ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildCryptoList() => ListView(
      padding: EdgeInsets.all(16.w),
      children: <Widget>[
        _buildCryptoTile(
          name: 'Globe With Meridian',
          subtitle: '🌐 GLOBE',
          price: r'$0.12',
          percentage: '1.02%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/globe.png',
        ),
        _buildCryptoTile(
          name: 'Aptos',
          subtitle: 'APT',
          price: r'$6.05',
          percentage: '-0.02%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/aptos.png',
        ),
        _buildCryptoTile(
          name: 'Pancake',
          subtitle: 'CAKE',
          price: r'$5.05',
          percentage: '-1.02%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/pancake.png',
        ),
        _buildCryptoTile(
          name: 'Fire Coin',
          subtitle: 'FIRE',
          price: r'$2.75',
          percentage: '5.23%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/fire.png',
        ),
        _buildCryptoTile(
          name: 'Lucky Token',
          subtitle: 'LUCK',
          price: r'$8.90',
          percentage: '0.75%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/lucky.png',
        ),
        _buildCryptoTile(
          name: 'Rocket Coin',
          subtitle: 'ROCK',
          price: r'$12.30',
          percentage: '-0.45%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/rocket.png',
        ),
        _buildCryptoTile(
          name: 'Diamond Token',
          subtitle: 'DMD',
          price: r'$18.45',
          percentage: '3.89%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/diamond.png',
        ),
        _buildCryptoTile(
          name: 'Peach Coin',
          subtitle: 'PEACH',
          price: r'$0.89',
          percentage: '-2.34%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/peach.png',
        ),
        _buildCryptoTile(
          name: 'Unicorn Token',
          subtitle: 'UNI',
          price: r'$15.32',
          percentage: '4.21%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/unicorn.png',
        ),
      ],
    );

  Widget _buildCryptoTile({
    required String name,
    required String subtitle,
    required String price,
    required String percentage,
    required Color percentageColor,
    required String logoPath,
  }) => ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(logoPath),
        radius: 22.r,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(price, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          Text(percentage, style: TextStyle(color: percentageColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ExploreTokenInfoScreen(
              name: name,
              logoPath: logoPath,
              percentage: percentage,
              investors: '1,234', // Example data
              returnPeriod: '1Y', // Example data
            ),
          ),
        );
      },
    );

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Sort by Price (High to Low)', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sort by Price (Low to High)', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sort by Change (24h)', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
    );
  }
}
