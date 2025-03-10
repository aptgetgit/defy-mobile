import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

import '../widgets/trending_cards.dart';
import 'explore_token_info_screen.dart';

class ExploreTokensScreen extends StatefulWidget {
  const ExploreTokensScreen({super.key});

  @override
  State<ExploreTokensScreen> createState() => _ExploreTokensScreenState();
}

class _ExploreTokensScreenState extends State<ExploreTokensScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isToggled = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: _isToggled ? 2 : 4, // 2 tabs when toggled, 4 when not
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Tokens',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                // Search bar with toggle button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: <Widget>[
                      // Search Bar
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xfff4f4f6),
                            borderRadius: BorderRadius.circular(58),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Gap(16),
                              const Icon(
                                PhosphorIconsBold.magnifyingGlass,
                                color: AppColors.greyMedium,
                              ),
                              const Gap(8),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search or paste URL',
                                    hintStyle: TextStyle(
                                      color: AppColors.greyMedium,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                PhosphorIconsBold.cards,
                                color: AppColors.greyMedium,
                              ),
                              const Gap(16),
                            ],
                          ),
                        ),
                      ),

                      // Custom Toggle Button with Label
                      const Gap(8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isToggled = !_isToggled;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 46,
                              height: 26,
                              decoration: BoxDecoration(
                                color: _isToggled ? Colors.orange : AppColors.greyMedium,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    spreadRadius: -2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Align(
                                alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(2),
                            const Text(
                              '🚀 mode',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(12),

                // Trending Cards with conditional title
                TrendingCards(isToggled: _isToggled),

                const Gap(12),

                // Tab Bar with Sort Icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          dividerColor: AppColors.greyVeryLight,
                          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          tabs: _isToggled
                              ? const <Widget>[
                                  Tab(text: 'Emoji'),
                                  Tab(text: 'Tokens'),
                                ]
                              : const <Widget>[
                                  Tab(text: 'All'),
                                  Tab(text: 'Emoji'),
                                  Tab(text: 'Defi'),
                                  Tab(text: 'Meme'),
                                ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          PhosphorIconsBold.sortAscending,
                          color: AppColors.greyMedium,
                          size: 24,
                        ),
                        onPressed: () {
                          _showSortOptions(context);
                        },
                      ),
                    ],
                  ),
                ),

                // Tab View Content
                Expanded(
                  child: TabBarView(
                    children: _isToggled
                        ? <Widget>[
                            _buildCryptoList(), // Emoji
                            _buildCryptoList(), // Tokens
                          ]
                        : <Widget>[
                            _buildCryptoList(), // All
                            _buildCryptoList(), // Emoji
                            _buildCryptoList(), // Defi
                            _buildCryptoList(), // Meme
                          ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildCryptoList() => ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        _buildCryptoTile(
          name: 'Globe With Meridian',
          subtitle: '🌐 GLOBE',
          price: r'$0.12',
          percentage: '1.02%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/globe.png',
        ),
        _buildCryptoTile(
          name: 'Aptos',
          subtitle: 'APT',
          price: r'$6.05',
          percentage: '-0.02%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/aptos.png',
        ),
        _buildCryptoTile(
          name: 'Pancake',
          subtitle: 'CAKE',
          price: r'$5.05',
          percentage: '-1.02%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/pancake.png',
        ),
        _buildCryptoTile(
          name: 'Fire Coin',
          subtitle: 'FIRE',
          price: r'$2.75',
          percentage: '5.23%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/fire.png',
        ),
        _buildCryptoTile(
          name: 'Lucky Token',
          subtitle: 'LUCK',
          price: r'$8.90',
          percentage: '0.75%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/lucky.png',
        ),
        _buildCryptoTile(
          name: 'Rocket Coin',
          subtitle: 'ROCK',
          price: r'$12.30',
          percentage: '-0.45%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/rocket.png',
        ),
        _buildCryptoTile(
          name: 'Diamond Token',
          subtitle: 'DMD',
          price: r'$18.45',
          percentage: '3.89%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/diamond.png',
        ),
        _buildCryptoTile(
          name: 'Peach Coin',
          subtitle: 'PEACH',
          price: r'$0.89',
          percentage: '-2.34%',
          percentageColor: Colors.red,
          logoPath: 'assets/icons/peach.png',
        ),
        _buildCryptoTile(
          name: 'Unicorn Token',
          subtitle: 'UNI',
          price: r'$15.32',
          percentage: '4.21%',
          percentageColor: Colors.green,
          logoPath: 'assets/icons/unicorn.png',
        ),
      ],
    );

  Widget _buildCryptoTile({
    required String name,
    required String subtitle,
    required String price,
    required String percentage,
    required Color percentageColor,
    required String logoPath,
  }) => ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(logoPath),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.grey),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(percentage, style: TextStyle(color: percentageColor, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ExploreTokenInfoScreen(
              name: name,
              logoPath: logoPath,
              percentage: percentage,
              investors: '1,234', // Example data
              returnPeriod: '1Y', // Example data
            ),
          ),
        );
      },
    );

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Sort by Price (High to Low)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sort by Price (Low to High)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sort by Change (24h)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
    );
  }
}
