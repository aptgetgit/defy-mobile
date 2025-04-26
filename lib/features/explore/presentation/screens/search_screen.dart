import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.greyVeryLight,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Search bar row
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(PhosphorIconsRegular.caretLeft, size: 24.sp),
                  onPressed: () => Navigator.pop(context),
                  color: AppColors.greyDark,
                ),
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(58.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Gap(12.w),
                        Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: const Color.fromARGB(255, 207, 210, 216),
                          size: 24.sp,
                        ),
                        Gap(8.w),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            controller: _searchController,
                            onChanged: (String value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: AppColors.white,
                              hintText: 'Search Something',
                              hintStyle: TextStyle(
                                color: AppColors.greyLight,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 11.h),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(PhosphorIconsFill.xCircle, size: 22.sp),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                          color: const Color.fromARGB(255, 189, 189, 189),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Gap(4.h),

            // Conditionally show TabBar
            if (_searchQuery.isNotEmpty)
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.w,
                        ),
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: AppColors.greyLight,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                      labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      indicatorWeight: 1.w,
                      dividerHeight: 1.h,
                      dividerColor: AppColors.white,
                      tabAlignment: TabAlignment.start,
                      tabs: const <Widget>[
                        Tab(text: 'All'),
                        Tab(text: 'Token'),
                        Tab(text: 'NFT'),
                        Tab(text: 'DeFi'),
                        Tab(text: 'Dapp'),
                      ],
                    ),
                  ),
                  Gap(16.h),
                ],
              ),

            // TabBar Views
            Expanded(
              child: _searchQuery.isNotEmpty
                ? TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      _buildAllTab(),
                      _buildTokensTab(),
                      _buildEmptyContent(),
                      _buildEmptyContent(),
                      _buildEmptyContent(),
                    ],
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Search Something',
                            style: TextStyle(color: AppColors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          Gap(14.h),
                          Text(
                            'You can search tokens, NFTs, Defi Yields, Dapps or the browser.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.greyLight, fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildAllTab() => Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 17.w, top: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_searchQuery.isNotEmpty)
              Text(
                'Google Search',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColors.greyLight),
              ),
              Gap(8.h),
              Row(
                children: <Widget>[
                  Image.asset('assets/icons/google.png', width: 26.w, height: 26.h),
                  Gap(15.w),
                  Text('Search "$_searchQuery"',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.black),),
                ],
              ),
              Gap(10.h),
              Text(
                'Tokens',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColors.greyLight),
              ),
          ],
        ),
      ),
      Expanded(child: _buildTokensTab()),
    ],
  );

  Widget _buildTokensTab() {
    final List<Map<String, String>> tokens = <Map<String, String>>[
      <String, String>{'name': 'Ethereum', 'price': r'$142.39', 'value': 'ETH', 'change': '-1.02%'},
      <String, String>{'name': 'Ethereum', 'price': r'$142.39', 'value': '0.678 ETH', 'change': '-1.02%'},
      <String, String>{'name': 'Ethereum', 'price': r'$142.39', 'value': '0.678 ETH', 'change': '-1.02%'},
      <String, String>{'name': 'Ethereum', 'price': r'$142.39', 'value': '0.678 ETH', 'change': '-1.02%'},
    ];

    return ListView.builder(
      itemCount: tokens.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, String> token = tokens[index];
        return ListTile(
          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
          leading: Image.asset('assets/icons/aptos.png', width: 32.w, height: 32.h),
          title: Text(
            token['name']!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
          ),
          subtitle: Text(
            token['value']!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color.fromARGB(255, 151, 157, 170)),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                token['price']!,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              Text(
                token['change']!,
                style: TextStyle(
                  color: const Color.fromARGB(255, 151, 157, 170), 
                  fontSize: 14.sp, 
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyContent() => Center(
      child: Text(
        'No content available',
        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
      ),
    );
}
