import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/leverage_trading/domain/leverage_trading_view_state.dart';
import 'package:defy/features/leverage_trading/domain/trading_pair_model.dart';
import 'package:defy/features/leverage_trading/presentation/providers/leverage_trading_provider.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_pair_view.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_sell_view.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_pair_search_view.dart';
import 'package:defy/features/leverage_trading/presentation/screens/leverage_trading_sl_tp_view.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:defy/features/staking/presentation/screens/staking_chart.dart';
import 'package:defy/features/yield/presentation/components/yield_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradingView extends ConsumerStatefulWidget {
  const LeverageTradingView({super.key});

  @override
  ConsumerState<LeverageTradingView> createState() =>
      _LeverageTradingViewState();
}

class _LeverageTradingViewState extends ConsumerState<LeverageTradingView> {
  late ScrollController _scrollController;
  bool _showTitle = false;

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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(leverageTradingProvider);
    final controller = ref.watch(leverageTradingProvider.notifier);

    final List<TradingPairModel> tradingPair = [
      TradingPairModel(
          token1: 'ETH',
          token2: 'USDC',
          token1Asset: 'assets/icons/ethereum-circular.png',
          token2Asset: 'assets/icons/usdc.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'USDC',
          token2: 'ETH',
          token1Asset: 'assets/icons/usdc.png',
          token2Asset: 'assets/icons/ethereum-circular.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'MATIC',
          token2: 'DAI',
          token1Asset: 'assets/icons/polygon.png',
          token2Asset: 'assets/icons/dai.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'MATIC',
          token2: 'ETH',
          token1Asset: 'assets/icons/polygon.png',
          token2Asset: 'assets/icons/ethereum-circular.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
      TradingPairModel(
          token1: 'APT',
          token2: 'USDC',
          token1Asset: 'assets/icons/aptos.png',
          token2Asset: 'assets/icons/usdc.png',
          volume: '\$89M',
          value: '\$14900.84',
          change: '0.12%'),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(context, state, tradingPair),
          SliverToBoxAdapter(
            child: _buildMainContent(context, state),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        image1: 'rocket.png',
        image2: 'rocket.png',
        image3: 'rocket.png',
        headerText: 'James, Jane and 14+ trading > ',
        buttonText1: 'Sell',
        buttonColor1: AppColors.red,
        onTap1: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LeverageTradingSellView(
                selectedpair: state.selectedPair,
                tradingPair: tradingPair,
              ),
            ),
          );
        },
        buttonText2: 'Buy',
        buttonColor2: AppColors.blue,
        onTap2: () {
          // Implement buy action
        },
        dualButton: true,
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context,
      LeverageTradingViewState state, List<TradingPairModel> tradingPair) {
    return SliverAppBar(
      titleSpacing: 0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsRegular.star, color: AppColors.black),
          onPressed: () {
            // Handle share action
          },
        ),
        IconButton(
          icon: const Icon(PhosphorIconsRegular.bell, color: AppColors.black),
          onPressed: () {
            // Handle share action
          },
        ),
      ],
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LeverageTradingPairSearchView(tradingPair: tradingPair),
            ),
          );
        },
        child: AnimatedOpacity(
          opacity: _showTitle ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: Row(
            children: [
              RowSuper(
                innerDistance: -18,
                children: [
                  Image.asset(state.selectedPair.token1Asset, height: 36),
                  Image.asset(state.selectedPair.token2Asset, height: 36),
                ],
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "${state.selectedPair.token1}-${state.selectedPair.token2}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: context.screenWidth < 400 ? 18 : 20,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text('Leverage Trade',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w500,
                        )),
              ]),
            ],
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowSuper(
                  innerDistance: -20,
                  children: [
                    Image.asset(state.selectedPair.token1Asset, height: 35),
                    Image.asset(state.selectedPair.token2Asset, height: 35),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeverageTradingPairSearchView(
                                tradingPair: tradingPair),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${state.selectedPair.token1}${state.selectedPair.token2}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(5),
                            Icon(
                              PhosphorIconsFill.caretDown,
                              color: AppColors.black,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$2,212.21',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${state.selectedPair.token1} Coin - ${state.selectedPair.token2} Coin",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.greyLight),
                    ),
                    const Spacer(),
                    Text(
                      '3.16%',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.greenLight),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTradingPairSelector(BuildContext context,
      LeverageTradingViewState state, List<TradingPairModel> tradingPair) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LeverageTradingPairSearchView(tradingPair: tradingPair),
          ),
        );
      },
      child: Row(
        children: [
          RowSuper(
            innerDistance: -20,
            children: [
              Image.asset(state.selectedPair.token1Asset, height: 35),
              Image.asset(state.selectedPair.token2Asset, height: 35),
            ],
          ),
          const Gap(10),
          Text(
            "${state.selectedPair.token1}/${state.selectedPair.token2}",
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(10),
          Icon(
            PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
            color: AppColors.black,
            size: 21,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
      BuildContext context, LeverageTradingViewState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             LiveStockChart(),
            SizedBox(height: context.screenHeight * 0.05),
            _buildHeading(context, 'Trade Stats'),
            const Gap(20),
            _buildPositionItem(context),
            const Gap(20),
            _buildHeading(context, 'More Details'),
            const Gap(20),
            _buildMoreDetailsRow('Index Price', context, '3956.3'),
            const Gap(10),
            _buildMoreDetailsRow('Funding Rate', context, '0.0024\%/hr'),
            const Gap(10),
            _buildMoreDetailsRow('Market Skew', context, '-14.74K'),
            // const Gap(20),
            // _buildTradeStatItems(context),
            // const Gap(20),
            // _buildHeading(context, 'Other Details'),
            // const Gap(20),
            // _buildOtherDetailsItems(context),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreDetailsRow(
      String label, BuildContext context, String value) {
    return Row(
      children: [
        Text(label,
            style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.greyLight)),
        const Spacer(),
        Text(value,
            style: context.bodyMedium
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.black)),
      ],
    );
  }

  Widget _buildHeading(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _buildPositionItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          RowSuper(
            innerDistance: -20,
            children: [
              Image.asset('assets/icons/aptos-logo.png', height: 30),
              Image.asset('assets/icons/usdc.png', height: 30),
            ],
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('APTUSDC',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  const Gap(10),
                  Text('100x sell',
                      style: TextStyle(
                          color: AppColors.red, fontWeight: FontWeight.w600)),
                ],
              ),
              Text('100 USDC @8.00',
                  style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greyLight)),
            ],
          ),
          const Spacer(),
          Text('+142.39',
              style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.greenLight)),
        ],
      ),
    );
  }

  Widget _buildTradeStatItems(BuildContext context) {
    return Column(
      children: [
        _buildTradeStatItem(context,
            title1: 'Fees',
            value1: '1.0x',
            title2: 'Leverage',
            value2: '1.0x',
            color1: AppColors.greyVeryLight,
            color2: AppColors.greyVeryLight,
            textColor1: AppColors.black,
            textColor2: AppColors.black),
        const Gap(10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LeverageTradingSlTpView(),
              ),
            );
          },
          child: _buildTradeStatItem(context,
              title1: 'Stop Loss',
              value1: '90.02',
              title2: 'Take Profit',
              value2: '90.02',
              color1: AppColors.red.withOpacity(0.1),
              color2: AppColors.greenLight.withOpacity(0.1),
              textColor1: AppColors.red,
              textColor2: AppColors.greenLight),
        ),
        const Gap(10),
      ],
    );
  }

  Widget _buildTradeStatItem(BuildContext context,
      {String? title1,
      String? value1,
      String? title2,
      String? value2,
      required Color color1,
      required Color color2,
      required Color textColor1,
      required Color textColor2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(value1!,
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.w600, color: textColor1)),
                Text(title1!,
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor1,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(value2!,
                    style: context.titleMedium.copyWith(
                        fontWeight: FontWeight.w600, color: textColor2)),
                Text(title2!,
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor2,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOtherDetailsItems(BuildContext context) {
    return Column(
      children: [
        _buildOtherDetailsItem(context, 'Volume', '\$ 89M'),
        const Gap(10),
        _buildOtherDetailsItem(context, 'Value', '\$ 14900.84'),
        const Gap(10),
        _buildOtherDetailsItem(context, 'Change', '0.12%'),
      ],
    );
  }

  Widget _buildOtherDetailsItem(
      BuildContext context, String title, String value) {
    return Row(
      children: [
        Text(title,
            style: context.titleMedium.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.greyLight)),
        const Spacer(),
        Text(value,
            style: context.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
