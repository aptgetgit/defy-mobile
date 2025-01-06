import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:defy/features/staking/presentation/screens/staking_chart.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TokensInfoScreen extends ConsumerStatefulWidget {
  const TokensInfoScreen({super.key});

  @override
  ConsumerState<TokensInfoScreen> createState() => _TokensInfoScreenState();
}

class _TokensInfoScreenState extends ConsumerState<TokensInfoScreen> {
  String coinLogoUrl = '';
  String coinName = '';
  String coinSymbol = '';
  String priceUsd = '';
  bool _showTitle = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    } else if (_scrollController.offset <= 100 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tokensControllerProvider);
    final controller = ref.read(tokensControllerProvider.notifier);
    final client = ref.read(defyGraphQlClientProvider);

    void showWatchlistBottomSheet() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(context.screenWidth * 0.04)),
        ),
        builder: (context) {
          return const WatchlistBottomSheet();
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ColoredBox(
        color: Colors.white,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildSliverAppBar(context),
            SliverToBoxAdapter(
              child: ColoredBox(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LiveStockChart(),
                    ),
                    SizedBox(height: 44),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoContainer("14.85 APT", "COST"),
                          _buildInfoContainer("\$14.85", "LAST BID"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ColoredBox(
                      color: Colors.white,
                      child: const TabBarWidget(),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        color: AppColors.greyLight,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: PageView(
                        controller: controller.horizontalPageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ColoredBox(
                              color: Colors.white, child: const AboutPage()),
                          ColoredBox(
                              color: Colors.white, child: ActivityPage()),
                          ColoredBox(
                              color: Colors.white, child: AnalyticsPage()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Buy',
        buttonColor1: AppColors.black,
        onTap1: () {},
        showHoldersRow: true,
        showImageRow: true,
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );
  }

  Widget _buildInfoContainer(String value, String label) {
    return Container(
      height: 65.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.greyLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final client = ref.read(defyGraphQlClientProvider);

    return SliverAppBar(
      expandedHeight: 188.h,
      elevation: 4,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.black,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          PhosphorIconsBold.caretLeft,
          color: AppColors.black,
          size: 26,
        ),
      ),
      collapsedHeight: 60,
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsRegular.shareNetwork,
              color: AppColors.black),
          onPressed: () {},
        ),
      ],
      titleSpacing: 0,
      title: AnimatedOpacity(
        opacity: _showTitle ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Row(
          children: [
            _buildPoolLogo(small: true),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coinName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '7.12%',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 64, 16.0, 16.0),
            child: GraphQLProvider(
              client: ValueNotifier(client),
              child: Query(
                options: QueryOptions(
                  document: documentNodeQueryFetchTokenInfo,
                  variables: const {
                    'coin_id': '0x1::aptos_coin::AptosCoin',
                  },
                ),
                builder: (result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final data = result.data?['coins']?.first;
                  if (data == null) {
                    return Text('No data available');
                  }

                  coinLogoUrl = data['coin_logo_url'] ?? '';
                  coinName = data['coin_name'] ?? '';
                  coinSymbol = data['coin_defyapp_symbol'] ?? '';
                  final coinMetric = data['coin_metric'] ?? {};
                  priceUsd = coinMetric['price_usd']?.toStringAsFixed(2) ?? '';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPoolLogo(),
                      SizedBox(height: 11.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              coinName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$$priceUsd',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        children: [
                          Text(
                            coinSymbol,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.greyLight,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            '3.16%',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greenLight),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPoolLogo({bool small = false}) {
    if (coinLogoUrl.isNotEmpty) {
      if (coinLogoUrl.endsWith('.svg')) {
        return SvgPicture.network(
          coinLogoUrl,
          height: small ? 24.h : 32.h,
          placeholderBuilder: (BuildContext context) => Container(
            height: small ? 24.h : 32.h,
            width: small ? 24.h : 32.h,
            color: Colors.grey[300],
          ),
        );
      } else {
        return Image.network(
          coinLogoUrl,
          height: small ? 24.h : 32.h,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/icons/staking-default.png',
              height: small ? 24.h : 32.h,
            );
          },
        );
      }
    } else {
      return Image.asset(
        'assets/icons/staking-default.png',
        height: small ? 24.h : 32.h,
      );
    }
  }

  String getChainName(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.split(' ').first.toUpperCase();
  }
}
