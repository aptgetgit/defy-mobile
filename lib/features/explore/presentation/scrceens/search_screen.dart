import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  String _searchQuery = "";

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
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar row with Hero widget
            Hero(
              tag: 'searchBar',
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(PhosphorIconsRegular.caretLeft, size: 24),
                      onPressed: () => Navigator.pop(context),
                      color: AppColors.greyDark,
                    ),
                    Expanded(
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(58),
                        ),
                        child: Row(
                          children: [
                            const Gap(12),
                            Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color: Color.fromARGB(255, 207, 210, 216),
                              size: 24,
                            ),
                            const Gap(8),
                            Expanded(
                              child: TextField(
                                autofocus: true,
                                controller: _searchController,
                                onChanged: (value) {
                                  setState(() {
                                    _searchQuery = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: AppColors.white,
                                  hintText: 'Search Something',
                                  hintStyle: TextStyle(
                                    color: AppColors.greyLight,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 11),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(PhosphorIconsFill.xCircle),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = "";
                                });
                              },
                              color: Color.fromARGB(255, 189, 189, 189),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(4),

            // Conditionally show TabBar
            if (_searchQuery.isNotEmpty)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColors.black,
                        ),
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: AppColors.greyLight,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      labelPadding: EdgeInsets.symmetric(horizontal: 10),
                      indicatorWeight: 1,
                      dividerHeight: 1,
                      dividerColor: AppColors.white,
                      tabAlignment: TabAlignment.start,
                      tabs: const [
                        Tab(text: "All"),
                        Tab(text: "Token"),
                        Tab(text: "NFT"),
                        Tab(text: "DeFi"),
                        Tab(text: "Dapp"),
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
                    children: [
                      _buildAllTab(),
                      _buildTokensTab(),
                      _buildEmptyContent(),
                      _buildEmptyContent(),
                      _buildEmptyContent(),
                    ],
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Search Something",
                            style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Gap(14),
                          Text(
                            "You can search tokens, NFTs, Defi Yields, Dapps or the browser.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.greyLight, fontSize: 16, fontWeight: FontWeight.w500),
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
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 17, top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_searchQuery.isNotEmpty)
              Text(
                'Google Search',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.greyLight),
              ),
            const Gap(8),
            Row(
              children: [
                Image.asset("assets/icons/google.png", width: 26, height: 26),
                const Gap(15),
                Text('Search "$_searchQuery"',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black)),
              ],
            ),
            const Gap(10),
            Text(
              'Tokens',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.greyLight),
            ),
          ],
        ),
      ),
      Expanded(child: _buildTokensTab()),
    ],
  );

  Widget _buildTokensTab() {
    final List<Map<String, String>> tokens = [
      {"name": "Ethereum", "price": "\$142.39", "value": "ETH", "change": "-1.02%"},
      {"name": "Ethereum", "price": "\$142.39", "value": "0.678 ETH", "change": "-1.02%"},
      {"name": "Ethereum", "price": "\$142.39", "value": "0.678 ETH", "change": "-1.02%"},
      {"name": "Ethereum", "price": "\$142.39", "value": "0.678 ETH", "change": "-1.02%"},
    ];

    return ListView.builder(
      itemCount: tokens.length,
      itemBuilder: (context, index) {
        final token = tokens[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          leading: Image.asset("assets/icons/aptos.png", width: 32, height: 32),
          title: Text(
            token["name"]!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.black),
          ),
          subtitle: Text(token["value"]!, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color.fromARGB(255, 151, 157, 170))),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                token["price"]!,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                token["change"]!,
                style: TextStyle(color: Color.fromARGB(255, 151, 157, 170), fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyContent() {
    return const Center(
      child: Text(
        "No content available",
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}