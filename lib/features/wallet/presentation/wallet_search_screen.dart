import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WalletSearchScreen extends StatefulWidget {
  const WalletSearchScreen({super.key});

  @override
  State<WalletSearchScreen> createState() => _WalletSearchScreenState();
}

class _WalletSearchScreenState extends State<WalletSearchScreen> with SingleTickerProviderStateMixin {
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
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Search bar row
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(PhosphorIconsBold.caretLeft, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right:22),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 244, 246),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            const Gap(12),
                            const Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color:  AppColors.greyLight,
                              size: 20,
                            ),
                            const Gap(8),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  autofocus: true,
                                  controller: _searchController,
                                  onChanged: (String value) {
                                    setState(() {
                                      _searchQuery = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.white,
                                    hintText: 'Search in business wallet',
                                    hintStyle: TextStyle(
                                      color: AppColors.greyLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 11),
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(4),

            // Conditionally show TabBar
            if (_searchQuery.isNotEmpty)
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorWeight: 0,
                      indicatorColor: Colors.white,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 0,
                          color: AppColors.white,
                        ),
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: AppColors.greyLight,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                      dividerHeight: 1,
                      dividerColor: AppColors.white,
                      tabAlignment: TabAlignment.start,
                      tabs: const <Widget>[
                        Tab(text: 'All(98)'),
                        Tab(text: 'Token(23)'),
                        Tab(text: 'NFT(20)'),
                        Tab(text: 'DeFi(2)'),
                      ],
                    ),
                  ),
                  const Gap(16),
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
                      _buildNFTsTab(),
                      _buildEmptyContent(),
                    ],
                  )
                : _buildRecentTab(),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildRecentTab() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:17, top: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_searchQuery.isNotEmpty)
              const Gap(8),
              const Text(
                'Recent History',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:AppColors.greyLight),
              ),
          ],
        ),
      ),
      SizedBox(height: 145, child: _buildTokensTab()),
      SizedBox(height: 150, child: _buildNFTsTab()),
    ],
  );

  Widget _buildAllTab() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_searchQuery.isNotEmpty)
              const Text(
                'Tokens',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:AppColors.greyLight),
              ),
          ],
        ),
      ),
      SizedBox(height: 150, child: _buildTokensTab()),
      Padding(
        padding: const EdgeInsets.only(left:17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_searchQuery.isNotEmpty)
              const Gap(8),
              const Text(
                'NFTs',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:AppColors.greyLight),
              ),
          ],
        ),
      ),
      SizedBox(height: 150, child: _buildNFTsTab()),

    ],
  );

  Widget _buildTokensTab() {
    final List<Map<String, String>> tokens = <Map<String, String>>[
      <String, String>{'name': 'Ethereum', 'price': r'$142.39', 'value': 'ETH', 'change': '-1.02%', 'imagePath': 'assets/icons/aptos.png'},
      <String, String>{'name': 'USD Coin', 'price': r'$142.39', 'value': '12,760.34 USDC', 'change': '-1.02%', 'imagePath': 'assets/icons/gui-inu.png'},
    ];

    return ListView.builder(
      itemCount: tokens.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, String> token = tokens[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          leading: Image.asset(token['imagePath']!, width: 40, height: 40),
          title: Text(
            token['name']!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.black),
          ),
          subtitle: Text(token['value']!,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color.fromARGB(255, 151, 157, 170)),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                token['price']!,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                token['change']!,
                style: const TextStyle(color: Color.fromARGB(255, 151, 157, 170), fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildNFTsTab() {
    final List<Map<String, String>> tokens = <Map<String, String>>[
      <String, String>{'name': 'Cyberpunk kid...', 'price': r'$142.39', 'value': 'Chum Chums NFT', 'change': '-1.02%', 'imagePath': 'assets/images/Mask group.png'},
      <String, String>{'name': 'Cyberpunk kid...', 'price': r'$142.39', 'value': 'Chum Chums NFT', 'change': '-1.02%', 'imagePath': 'assets/images/Mask group.png'},
    ];

    return ListView.builder(
      itemCount: tokens.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, String> token = tokens[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          leading: Image.asset(token['imagePath']!, width: 40, height: 40),
          title: Text(
            token['name']!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.black),
          ),
          subtitle: Text(token['value']!,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color.fromARGB(255, 151, 157, 170)),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                token['price']!,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                token['change']!,
                style: const TextStyle(color: Color.fromARGB(255, 151, 157, 170), fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyContent() => const Center(
      child: Text(
        'No content available',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
}
