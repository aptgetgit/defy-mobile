import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../components/watchlist_nft_tab.dart';
import '../components/watchlist_token_tab.dart';
import '../../../../config/theme/colors.dart'; // Adjust the import path as needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WatchListScreen(),
    );
  }
}

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void changeTab(int i) {
    setState(() {
      tabIndex = i;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Watchlist",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add padding to the right
            child: Icon(
              PhosphorIcons.star(PhosphorIconsStyle.bold),
              color: Colors.black,
              size: 21,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the TabBar
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2),
                  ),
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
                    Tab(text: 'NFTs'),
                    Tab(text: 'Tokens'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the grey line
                child: Container(
                  height: 1,
                  color: AppColors.greyVeryLight, // Light grey line
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            WatchlistNFTTab(),
            WatchlistTokensTab(),
          ],
        ),
      ),
    );
  }
}