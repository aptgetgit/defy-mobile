// swap_screen.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'limit_tab_screen.dart';
import 'market_tab_screen.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> with SingleTickerProviderStateMixin {
  // Add TabController
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        // Trigger rebuild when tab changes to update actions
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Swap',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(PhosphorIconsRegular.arrowsClockwise, size: 24),
              onPressed: () {},
            ),
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // TabBar takes only the space it needs
                Flexible(
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2),
                    ),
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.zero, // Remove horizontal padding
                    indicatorWeight: 1,
                    dividerHeight: 1,
                    dividerColor: Colors.grey[300],
                    tabs: const [
                      Tab(text: 'Market'),
                      Tab(text: 'Limit'),
                    ],
                  ),
                ),
                // Icons on the right side of the tab bar
                Row(
                  children: <Widget>[
                    if (_tabController.index == 1) ...[
                      // Show gear icon only in Limit tab
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              PhosphorIconsRegular.chartBar,
                              size: 20,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Add settings action here
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          IconButton(
                            icon: const Icon(
                              PhosphorIconsRegular.notebook, 
                              size: 20,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Add info action here
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      const Gap(15), // Add spacing between icons
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
    ),      
    body: TabBarView(
      controller: _tabController,
      children: const [
        MarketTab(),
        LimitTab(),
      ],
    ),
  );
}
