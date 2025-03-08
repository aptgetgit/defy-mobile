import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../lend/presentation/widgets/efficiency_mode_popup.dart';
import '../widgets/borrow_provider_item.dart';
import 'borrow_info_screen.dart';

class BorrowScreen extends StatefulWidget {
  const BorrowScreen({super.key});

  @override
  State<BorrowScreen> createState() => _BorrowScreenState();
}

class _BorrowScreenState extends State<BorrowScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isEMode = false;
  String _disabledCategory = '';

  // Define your collateral categories
  final Map<String, List<Map<String, dynamic>>> _collateralCategories = <String, List<Map<String, dynamic>>>{
    'APT Collateral': <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Aptos',
        'percentage': '15%',
        'imagePath': 'assets/icons/aptos.png',
        'ltv': '85% LTV',
      },
      <String, dynamic>{
        'name': 'AmnisAptos',
        'percentage': '33%',
        'imagePath': 'assets/icons/amapt.png',
        'ltv': '85% LTV',
      },
      <String, dynamic>{
        'name': 'Gui inu',
        'percentage': '30%',
        'imagePath': 'assets/icons/gui-inu.png',
        'ltv': '85% LTV',
      },
      <String, dynamic>{
        'name': 'Bluemove',
        'percentage': '0.1%',
        'imagePath': 'assets/icons/bluemove.png',
        'ltv': '20% LTV',
      },
    ],
    'Stable Collateral': <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Circle USD',
        'percentage': '20%',
        'imagePath': 'assets/icons/usdc.png',
        'ltv': '90% LTV',
      },
      <String, dynamic>{
        'name': 'Tether USD',
        'percentage': '20.45%',
        'imagePath': 'assets/icons/tethusd.png',
        'ltv': '90% LTV',
      },
      <String, dynamic>{
        'name': 'Pancake',
        'percentage': '14%',
        'imagePath': 'assets/icons/pancake.png',
        'ltv': '14% LTV',
      },
      <String, dynamic>{
        'name': 'Wrapped Ether',
        'percentage': '21%',
        'imagePath': 'assets/icons/weth.png',
        'ltv': '85% LTV',
      },
    ],
  };


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Borrow', style: TextStyle(fontSize: 20)),
      elevation: 0,
    ),
    body: NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Top card section with gradient
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.fromARGB(255, 65, 64, 64), // Left side (grey)
                        Colors.black, // Right side (black)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/aptos.png',
                        width: 40,
                        height: 40,
                      ),
                      const Gap(8),
                      const Text(
                        '89% APY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(4),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Borrow and Earn on Aptos Token and get rewards',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Gap(18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: const BorderSide(color: Colors.white),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              maximumSize: const Size(82, 44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'View',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Gap(8),
                                Icon(PhosphorIconsBold.arrowCircleUpRight),
                              ],
                            ),
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: const Size(237, 42),
                            ),
                            child: const Text('Borrow APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                // Stats Section
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(r'$12121.21', style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600)),
                            Gap(4),
                            Row(
                              children: <Widget>[
                                Text('Net Assets', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w400, color: AppColors.greyLight)),
                                Gap(2),
                                Icon(PhosphorIconsBold.caretRight, size: 10, color: AppColors.greyLight),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('107.55%', style: TextStyle(fontSize: 18, color: AppColors.red, fontWeight: FontWeight.w600)),
                            Gap(4),
                            Text('Health Factor', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w400, color: AppColors.greyLight)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('5.23%', style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600)),
                            Gap(4),
                            Text('Net APY', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w400, color: AppColors.greyLight)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(8),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _TabBarDelegate(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2),
                    ),
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.black,
                    unselectedLabelColor: AppColors.greyLight,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.zero,
                    indicatorWeight: 1,
                    dividerHeight: 1,
                    dividerColor: AppColors.greyVeryLight,
                    tabs: const <Widget>[
                      Tab(text: 'All'),
                      Tab(text: 'Stables'),
                      Tab(text: 'Aptos'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: <Widget>[
                        const Text('E-Mode', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.greyLight)),
                        const Gap(6),
                        SwitchTheme(
                          data: SwitchThemeData(
                            trackOutlineColor: WidgetStateProperty.all<Color>(AppColors.transparent),
                            trackColor: _isEMode ? WidgetStateProperty.all<Color>(AppColors.blue) : WidgetStateProperty.all<Color>(AppColors.greyMedium),
                            thumbColor: WidgetStateProperty.all<Color>(Colors.white),
                          ),
                          child: Switch(value: _isEMode, onChanged: (bool value) {
                            setState(() {
                              _isEMode = value;
                            });
                            if (value) {
                              _showEfficiencyModePopup();
                            }
                          },),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildTabViewContent(0),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildTabViewContent(1),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildTabViewContent(2),
          ),
        ],
      ),
    ),
  );
  void _showEfficiencyModePopup() {
    // Calculate the screen size to position the dialog
    final Size screenSize = MediaQuery.of(context).size;
    
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: screenSize.width * 0.95, // Make it slightly less than screen width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: EfficiencyModePopup(
                onEnableCategory: (String categoryName) {
                  setState(() {
                    _disabledCategory = categoryName == 'APT Collateral' 
                        ? 'Stable Collateral' 
                        : 'APT Collateral';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Create a separate method for the actual tab content
  Widget _buildTabViewContent(int tabIndex) {
    List<Map<String, dynamic>> activeItems = <Map<String, dynamic>>[];
    List<Map<String, dynamic>> disabledItems = <Map<String, dynamic>>[];
    
    if (tabIndex == 0) { // All tab
      for (final String category in _collateralCategories.keys) {
        final List<Map<String, dynamic>> items = _collateralCategories[category] ?? <Map<String, dynamic>>[];
        if (category == _disabledCategory && _isEMode) {
          disabledItems.addAll(items);
        } else {
          activeItems.addAll(items);
        }
      }
    } else if (tabIndex == 1) { // Stables tab
      activeItems = _collateralCategories['Stable Collateral'] ?? <Map<String, dynamic>>[];
      if (_disabledCategory == 'Stable Collateral' && _isEMode) {
        disabledItems = activeItems;
        activeItems = <Map<String, dynamic>>[];
      }
    } else { // Aptos tab
      activeItems = _collateralCategories['APT Collateral'] ?? <Map<String, dynamic>>[];
      if (_disabledCategory == 'APT Collateral' && _isEMode) {
        disabledItems = activeItems;
        activeItems = <Map<String, dynamic>>[];
      }
    }
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Active assets
          ...activeItems.map((Map<String, dynamic> item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BorrowProviderItem(
              name: item['name'],
              percentage: item['percentage'],
              imagePath: item['imagePath'],
              ltv: item['ltv'],
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => BorrowInfoScreen(
                    name: item['name'], 
                    logoPath: item['imagePath'],
                    percentage: item['percentage'],
                    investors: item['investors'],
                    returnPeriod: item['returnPeriod'],
                  ),),
                );
              },
            ),
          ),),
          
          // Disabled assets section
          if (disabledItems.isNotEmpty) ...<Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Disabled assets',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
              ),
            ),
            ...disabledItems.map((Map<String, dynamic> item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BorrowProviderItem(
                name: item['name'],
                percentage: item['percentage'],
                imagePath: item['imagePath'],
                ltv: item['ltv'],
                isDisabled: true,
                onTap: () {},
              ),
            ),),
          ],
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate(this.tabBar);
  final Widget tabBar;

  @override
  double get minExtent => kToolbarHeight - 10; // Minimum height for tab bar

  @override
  double get maxExtent => kToolbarHeight - 10; // Maximum height remains same

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Material(
      color: Colors.white,
      elevation: overlapsContent ? 4 : 0, // Add elevation when overlapping
      shadowColor: Colors.black.withOpacity(0.1),
      child: tabBar, // The entire row containing balance + tabs
    );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}