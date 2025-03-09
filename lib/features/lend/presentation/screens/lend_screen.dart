import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../providers/lend_provider.dart';
import '../providers/lend_state_model.dart';
import '../widgets/efficiency_mode_popup.dart';
import '../widgets/lend_provider_item.dart';
import 'lend_info_screen.dart';

class LendScreen extends ConsumerStatefulWidget {
  const LendScreen({super.key});

  @override
  ConsumerState<LendScreen> createState() => _LendScreenState();
}

class _LendScreenState extends ConsumerState<LendScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  // Define your collateral categories
  final Map<String, List<Map<String, dynamic>>> _collateralCategories = <String, List<Map<String, dynamic>>>{
    'APT Collateral': <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Aptos',
        'percentage': '15%',
        'imagePath': 'assets/icons/aptos.png',
        'ltv': '85% LTV',
        'amount': '100.21',
        'unit': 'APT',
        'investors': 'James, Jane and 14+',
        'returnPeriod': '30 days',
      },
      <String, dynamic>{
        'name': 'AmnisAptos',
        'percentage': '33%',
        'imagePath': 'assets/icons/amapt.png',
        'ltv': '85% LTV',
        'amount': '210.45',
        'unit': 'AMAPT',
        'investors': 'James, Jane and 5+',
        'returnPeriod': '14 days',
      },
      <String, dynamic>{
        'name': 'Gui inu',
        'percentage': '30%',
        'imagePath': 'assets/icons/gui-inu.png',
        'ltv': '85% LTV',
        'amount': '50.42',
        'unit': 'GUI',
        'investors': 'Sam, Tom and 8+',
        'returnPeriod': '21 days',
      },
      <String, dynamic>{
        'name': 'Bluemove',
        'percentage': '0.1%',
        'imagePath': 'assets/icons/bluemove.png',
        'ltv': '20% LTV',
        'amount': '1200.00',
        'unit': 'MOVE',
        'investors': 'Lisa, Mark and 3+',
        'returnPeriod': '45 days',
      },
    ],
    'Stable Collateral': <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Circle USD',
        'percentage': '20%',
        'imagePath': 'assets/icons/usdc.png',
        'ltv': '90% LTV',
        'amount': '1000.00',
        'unit': 'USDC',
        'investors': 'Sara, Mike and 22+',
        'returnPeriod': '7 days',
      },
      <String, dynamic>{
        'name': 'Tether USD',
        'percentage': '20.45%',
        'imagePath': 'assets/icons/tethusd.png',
        'ltv': '90% LTV',
        'amount': '2500.00',
        'unit': 'USDT',
        'investors': 'Alex, Jamie and 10+',
        'returnPeriod': '15 days',
      },
      <String, dynamic>{
        'name': 'Pancake',
        'percentage': '14%',
        'imagePath': 'assets/icons/pancake.png',
        'ltv': '14% LTV',
        'amount': '75.33',
        'unit': 'CAKE',
        'investors': 'John, Eva and 6+',
        'returnPeriod': '60 days',
      },
      <String, dynamic>{
        'name': 'Wrapped Ether',
        'percentage': '21%',
        'imagePath': 'assets/icons/weth.png',
        'ltv': '85% LTV',
        'amount': '1.25',
        'unit': 'WETH',
        'investors': 'Chris, Mia and 18+',
        'returnPeriod': '90 days',
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
  Widget build(BuildContext context) {
    final LendState lendState = ref.watch(lendNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Lend', style: TextStyle(fontSize: 20)),
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
                          Color.fromARGB(255, 65, 64, 64),
                          Colors.black,
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
                            'Lend and Earn on Aptos Token and get rewards',
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
                              onPressed: () {
                                // Store Aptos info in the provider
                                ref.read(lendNotifierProvider.notifier).setSelectedAsset(
                                  name: 'Aptos',
                                  iconPath: 'assets/icons/aptos.png',
                                  maxAmount: '100.21',
                                  maxAmountUnit: 'APT',
                                  apy: '89%',
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => 
                                      const LendInfoScreen(
                                        name: 'Aptos', 
                                        logoPath: 'assets/icons/aptos.png',
                                        percentage: '89%',
                                        investors: 'James, Jane and 14+',
                                        returnPeriod: '30 days',
                                      ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: const Size(237, 42),
                              ),
                              child: const Text('Lend APT', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                r'$${lendState.netAssets.toStringAsFixed(2)}', 
                                style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600),
                              ),
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
                              Text(
                                '${lendState.healthFactor.toStringAsFixed(2)}%', 
                                style: const TextStyle(fontSize: 18, color: AppColors.red, fontWeight: FontWeight.w600),
                              ),
                              const Gap(4),
                              const Text('Health Factor', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w400, color: AppColors.greyLight)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${lendState.netApy.toStringAsFixed(2)}%', 
                                style: const TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.w600),
                              ),
                              const Gap(4),
                              const Text('Net APY', style: TextStyle(fontSize: 12.6, fontWeight: FontWeight.w400, color: AppColors.greyLight)),
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
            delegate: TabBarDelegate(
              CustomTabBar(
                tabController: _tabController,
                tabs: const <String>['All', 'Stables', 'Aptos'],
                trailing: Row(
                  children: <Widget>[
                    const Text(
                      'E-Mode', 
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w500, 
                        color: AppColors.greyLight,
                      ),
                    ),
                    const Gap(6),
                    SwitchTheme(
                      data: SwitchThemeData(
                        trackOutlineColor: WidgetStateProperty.all<Color>(AppColors.transparent),
                        trackColor: lendState.isEMode 
                          ? WidgetStateProperty.all<Color>(AppColors.blue) 
                          : WidgetStateProperty.all<Color>(AppColors.greyMedium),
                        thumbColor: WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      child: Switch(
                        value: lendState.isEMode, 
                        onChanged: (bool value) {
                          ref.read(lendNotifierProvider.notifier).toggleEMode(value);
                          if (value) {
                            _showEfficiencyModePopup();
                          }
                        },
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
  }
  
  void _showEfficiencyModePopup() {
    // Calculate the screen size to position the dialog
    final Size screenSize = MediaQuery.of(context).size;
    
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    color: Colors.black.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: EfficiencyModePopup(
                onEnableCategory: (String categoryName) {
                  final String category = categoryName == 'APT Collateral' 
                      ? 'Stable Collateral' 
                      : 'APT Collateral';
                  ref.read(lendNotifierProvider.notifier).setDisabledCategory(category);
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
    final LendState lendState = ref.watch(lendNotifierProvider);
    List<Map<String, dynamic>> activeItems = <Map<String, dynamic>>[];
    List<Map<String, dynamic>> disabledItems = <Map<String, dynamic>>[];
    
    if (tabIndex == 0) { // All tab
      for (final String category in _collateralCategories.keys) {
        final List<Map<String, dynamic>> items = _collateralCategories[category] ?? <Map<String, dynamic>>[];
        if (category == lendState.disabledCategory && lendState.isEMode) {
          disabledItems.addAll(items);
        } else {
          activeItems.addAll(items);
        }
      }
    } else if (tabIndex == 1) { // Stables tab
      activeItems = _collateralCategories['Stable Collateral'] ?? <Map<String, dynamic>>[];
      if (lendState.disabledCategory == 'Stable Collateral' && lendState.isEMode) {
        disabledItems = activeItems;
        activeItems = <Map<String, dynamic>>[];
      }
    } else { // Aptos tab
      activeItems = _collateralCategories['APT Collateral'] ?? <Map<String, dynamic>>[];
      if (lendState.disabledCategory == 'APT Collateral' && lendState.isEMode) {
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
            child: LendProviderItem(
              name: item['name'] as String,
              percentage: item['percentage'] as String,
              imagePath: item['imagePath'] as String,
              ltv: item['ltv'] as String,
              onTap: () {
                // Store the selected asset in the provider
                ref.read(lendNotifierProvider.notifier).setSelectedAsset(
                  name: item['name'] as String,
                  iconPath: item['imagePath'] as String,
                  maxAmount: item['amount'] as String? ?? '100.21',
                  maxAmountUnit: item['unit'] as String? ?? 'APT',
                  apy: item['percentage'] as String,
                );
                
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => LendInfoScreen(
                    name: item['name'] as String, 
                    logoPath: item['imagePath'] as String,
                    percentage: item['percentage'] as String,
                    investors: item['investors'] as String? ?? 'James, Jane and 14+',
                    returnPeriod: item['returnPeriod'] as String? ?? '30 days',
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
              child: LendProviderItem(
                name: item['name'] as String,
                percentage: item['percentage'] as String,
                imagePath: item['imagePath'] as String,
                ltv: item['ltv'] as String,
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
