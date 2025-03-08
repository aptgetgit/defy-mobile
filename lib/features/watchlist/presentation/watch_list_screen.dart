import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../components/watchlist_nft_tab.dart';
import '../components/watchlist_token_tab.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
      home: WatchListScreen(),
    );
}

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  int tabIndex = 0;

  void changeTab(int i) {
    setState(() {
      tabIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
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
          "Watchlist",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(
              PhosphorIcons.star(PhosphorIconsStyle.regular),
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Gap(24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      changeTab(0);
                    },
                    child: SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          "NFTs",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: tabIndex == 0 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeTab(1);
                    },
                    child: SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          "Tokens",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: tabIndex == 1 ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(2),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 160,
                  height: 1,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        left: tabIndex * 80,
                        child: Container(
                          color: Colors.black,
                          width: 80,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(32),
              if (tabIndex == 0) const WatchlistNFTTab(),
              if (tabIndex == 1) const WatchlistTokensTab(),
            ],
          ),
        ),
      ),
    );
}