import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/presentation/components/yield_chart.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:defy/features/yield/presentation/screens/yield_lending_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class YieldAddLiquidityView extends ConsumerWidget {
  final String poolId;
  final String poolName;
  final dynamic metadata;

  const YieldAddLiquidityView({
    Key? key,
    required this.poolId,
    required this.poolName,
    required this.metadata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poolEither = ref.watch(getPoolProvider(poolId, poolName));

    return poolEither.when(
      data: (either) => either.fold(
        (error) => const Center(child: CircularProgressIndicator()),
        (pool) => _buildScaffold(context, pool),
      ),
      loading: () => Center(
        child: LottieBuilder.asset('assets/lotties/loading-indicator.json'),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildScaffold(BuildContext context, PoolDataResponse pool) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, pool),
      body: Stack(
        children: [
          _buildScrollableContent(context, pool),
          _buildSupplyButton(context, pool),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, PoolDataResponse pool) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: const Icon(PhosphorIconsBold.caretLeft, color: Colors.black),
      ),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          _buildPoolLogo(),
          const Gap(10),
          Text(
            pool.name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ),
      actions: [
        _buildAddLiquidityButton(context),
        const Gap(20),
      ],
    );
  }

  Widget _buildPoolLogo() {
    if (metadata is List && metadata.length > 1) {
      return RowSuper(
        innerDistance: -20,
        children: metadata.map<Widget>((data) => _buildLogoImage(data['coin_logo_url'])).toList(),
      );
    } else {
      return _buildLogoImage(metadata['coin_logo_url']);
    }
  }

  Widget _buildLogoImage(String url) {
    return url.endsWith('.svg')
        ? SvgPicture.network(url, height: 35)
        : Image.network(url, height: 35);
  }

  Widget _buildAddLiquidityButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffD2E3FC),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Center(
        child: Text(
          "Add Liquidity",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF2071EE),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContent(BuildContext context, PoolDataResponse pool) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoolStats(pool),
            const Gap(100),
            YieldChart(data: pool.tvlAprChartData),
            const Gap(70),
            _buildPoolMetrics(),
            const Gap(30),
            _buildPlatformsSection(),
            const Gap(30),
            _buildPoolRatioSection(pool),
            const Gap(100),
          ],
        ),
      ),
    );
  }

  Widget _buildPoolStats(PoolDataResponse pool) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          Text(
            "\$70.28K",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const Spacer(),
          Text(
            '${pool.apr!} APR',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          const Gap(10)
        ],
      ),
    );
  }

  Widget _buildPoolMetrics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMetricColumn('56.3%', 'TVL'),
          _buildMetricColumn('\$2.05k', 'Volume (24h)'),
          _buildMetricColumn('\$2.05', 'Fees (24h)'),
        ],
      ),
    );
  }

  Widget _buildMetricColumn(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Platforms',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPlatformContainer('Aries', 'assets/icons/aries.png'),
            _buildPlatformContainer('Amnis', 'assets/icons/amnis.png'),
            _buildPlatformContainer('Aries', 'assets/icons/ries.png'),
            Container(),
            Container(),
          ],
        ),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(color: Colors.black.withOpacity(0.5), thickness: 0.5),
        ),
      ],
    );
  }

  Widget _buildPlatformContainer(String name, String imagePath) {
    return Container(
      height: 32,
      width: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imagePath, height: 20),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoolRatioSection(PoolDataResponse pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pool Ratio',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const Gap(30),
        Stack(
          children: [
            _buildPoolRatioBackground(),
            _buildPoolRatioForeground(pool),
          ],
        ),
      ],
    );
  }

  Widget _buildPoolRatioBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xffd2e3fc),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                poolName.split('/')[0],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                '51.78',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Gap(10),
          _buildLogoImage(metadata is List ? metadata.last['coin_logo_url'] : metadata['coin_logo_url']),
        ],
      ),
    );
  }

  Widget _buildPoolRatioForeground(PoolDataResponse pool) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        width: 150,
        decoration: const BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogoImage(metadata is List ? metadata.first['coin_logo_url'] : metadata['coin_logo_url']),
            const Gap(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pool.name.split('/').length > 1 ? pool.name.split('/')[1] : pool.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '48.23%',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupplyButton(BuildContext context, PoolDataResponse pool) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YieldLendingTransactionView(
                selectedTile: pool,
                metadata: metadata,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
            border: const Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          height: 60,
          child: const Center(
            child: Text(
              "Supply",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}