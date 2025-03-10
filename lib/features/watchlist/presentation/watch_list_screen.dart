import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../components/watchlist_nft_tab.dart';
import '../components/watchlist_token_tab.dart';
import 'providers/watchlist_provider.dart';

// Remove standalone app code for integrated version
// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }
// 
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
// 
//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//         home: WatchListScreen(),
//         debugShowCheckedModeBanner: false,
//       );
// }

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
              PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
              color: Colors.black,
              size: 24,
            ),
          ),
          title: const Text(
            'Watchlist',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(
                onPressed: () {
                  // This could show favorite collections or perform other actions
                  // using the provider state
                },
                icon: Icon(
                  PhosphorIcons.star(),
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight - 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomTabBar(
                tabController: _tabController,
                tabs: const <String>[
                  'NFTs',
                  'Tokens',
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const Gap(32),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      WatchlistNFTTab(),
                      WatchlistTokensTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
