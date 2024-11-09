import 'package:defy/config/assets.gen.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/token_info/presentation/about_page.dart';
import 'package:defy/features/token_info/presentation/activity_page.dart';
import 'package:defy/features/token_info/presentation/analytics_page.dart';
import 'package:defy/features/token_info/presentation/graph_view.dart';
import 'package:defy/features/token_info/presentation/tab_bar_widget.dart';
import 'package:defy/features/token_info/presentation/watchlist_bottom_sheet.dart';
import 'package:defy/features/token_info/providers/token_info_controller.dart';
import 'package:defy_graphql/defy_graphql.dart';
import 'package:defy/features/token_info/presentation/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TokensInfoScreen extends ConsumerWidget {
  const TokensInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tokensControllerProvider);
    final controller = ref.read(tokensControllerProvider.notifier);
    final client = ref.read(defyGraphQlClientProvider);

    void showWatchlistBottomSheet() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(context.screenWidth * 0.04)),
        ),
        builder: (context) {
          return const WatchlistBottomSheet();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GraphQLProvider(
          client: ValueNotifier(client),
          child: Query(
            options: QueryOptions(
              document: documentNodeQueryFetchTokenInfo,
              variables: const {
                'coin_id': '0x1::aptos_coin::AptosCoin',
              },
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return Center(
                  child: Lottie.asset(Assets.animations.loadingIndicator),
                );
              }
              if (result.data == null) {
                return const Center(
                  child: Text("No data found!"),
                );
              }

              final data = result.data!['coins']?.first;
              if (data == null) {
                return const Center(
                  child: Text("No valid data found!"),
                );
              }

              final coinLogoUrl = data['coin_logo_url'] ?? '';
              final coinName = data['coin_name'] ?? '';
              final coinSymbol = data['coin_defyapp_symbol'] ?? '';
              final coinMetric = data['coin_metric'] ?? {};
              final priceUsd = coinMetric['price_usd']?.toStringAsFixed(2) ?? '';

              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(PhosphorIconsBold.caretLeft),
                  ),
                  SvgPicture.network(
                    coinLogoUrl,
                    height: context.screenHeight * 0.05,
                  ),
                  SizedBox(width: context.screenWidth * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getChainName(coinName),
                        style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        coinSymbol,
                        style: context.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (!state.isSecondPage)
                    IconButton(
                      onPressed: showWatchlistBottomSheet,
                      icon: const Icon(PhosphorIconsBold.star),
                    ),
                  if (!state.isSecondPage)
                    IconButton(
                      onPressed: () {
                        context.go('/token-info/price-alert');
                      },
                      icon: const Icon(PhosphorIconsBold.bell),
                    ),
                  if (state.isSecondPage)
                    GestureDetector(
                      onTap: () => controller.goToFirstPage(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
                        child: Text(
                          '\$ $priceUsd',
                          style: context.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) => controller.onPageChanged(index),
              scrollDirection: Axis.vertical,
              controller: controller.verticalPageController,
              children: [
                const GraphView(),
                SafeArea(
                  child: Column(
                    children: [
                      const TabBarWidget(),
                      Expanded(
                        child: PageView(
                          controller: controller.horizontalPageController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            const AboutPage(),
                            ActivityPage(),
                            AnalyticsPage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  String getChainName(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.split(' ').first.toUpperCase();
  }
}