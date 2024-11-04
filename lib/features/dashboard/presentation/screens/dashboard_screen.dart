import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/dashboard/presentation/components/nft_tab.dart';
import 'package:defy/features/dashboard/presentation/components/token_tab.dart';
import 'package:defy/features/dashboard/presentation/provider/ui_provider.dart';
import 'package:defy/features/dashboard/presentation/widgets/appbar.dart';
import 'package:defy/features/dashboard/presentation/widgets/tab_bar.dart';
import 'package:defy/features/dashboard/presentation/widgets/total_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(keepScrollOffset: true);
  }

  final dashboardKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
  ref.listen<bool>(balanceFilterVisibilityProvider, (_, isVisible) {
    if (isVisible) {
      showModalBottomSheet(
        context: context,
        builder: (context) => _buildBalanceFilter(context),
      ).then((_) {
        ref.read(balanceFilterVisibilityProvider.notifier).toggle();
      });
    }
  });
    return Scaffold(
      key: dashboardKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                DashboardAppbar(),
                Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, isScrolled) {
                    return [
                      const TotalBalanceWidget(),
                      const TabBarWidget(),
                    ];
                  },
                  body: TabBarView(
                    children: ['Token', 'NFT', 'DeFi'].map((t) {
                      switch (t) {
                        case 'Token':
                          return TokenTab();
                        case 'NFT':
                          return NFTTab();
                        case 'DeFi':
                          return Center(child: Text(t));
                        default:
                          return Center(child: Text('Not Availabe'));
                      }
                    }).toList(),
                  ),
                ),
                                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceFilter(BuildContext context) {
    final themeData = context.themeData;
    return Consumer(
      builder: (ctx,ref,child) {
        var _selectedValue = ref.watch(balanceFilterProvider);
        return Container(
        constraints: const BoxConstraints.tightFor(),
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: themeData.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Balance",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(PhosphorIconsBold.x),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(
                  PhosphorIconsBold.coins,
                  color: AppColors.grey,
                ),
                title: const Text(
                  "Total Balance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Radio(
                  activeColor: AppColors.black,
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) => ref.read(balanceFilterProvider.notifier).toggle(value!),
                ),
              ),
              ListTile(
                leading: const Icon(
                  PhosphorIconsBold.coins,
                  color: AppColors.grey,
                ),
                title: const Text(
                  "Token Balance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Radio(
                  activeColor: AppColors.black,
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) => ref.read(balanceFilterProvider.notifier).toggle(value!),
                ),
              ),
              ListTile(
                leading: const Icon(
                  PhosphorIconsBold.stackSimple,
                  color: AppColors.grey,
                ),
                title: const Text(
                  "NFT Balance",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Radio(
                  activeColor: AppColors.black,
                  value: 3,
                  groupValue: _selectedValue,
                  onChanged: (value) => ref.read(balanceFilterProvider.notifier).toggle(value!),
                ),
              ),
              ListTile(
                leading: const Icon(
                  PhosphorIconsBold.selectionAll,
                  color: AppColors.grey,
                ),
                title: const Text(
                  "Live Positions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Radio(
                  activeColor: AppColors.black,
                  value: 4,
                  groupValue: _selectedValue,
                  onChanged: (value) => ref.read(balanceFilterProvider.notifier).toggle(value!),
                ),
              ),
            ],
          ),
      );
      } 
    );
  }
}
