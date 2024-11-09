import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/features/yield/presentation/components/yield_chart.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:defy/features/yield/presentation/screens/yield_lending_transaction_view.dart';
import 'package:defy_graphql/defy_graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class YieldMultiplyView extends ConsumerWidget {
  final String poolId;
  final String poolName;
  final dynamic metadata;

  const YieldMultiplyView({
    Key? key,
    required this.metadata,
    required this.poolId,
    required this.poolName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poolEither = ref.watch(getPoolProvider(poolId, poolName));

    return poolEither.when(
      data: (either) => either.fold(
        (error) => const Center(child: Text('Error')),
        (pool) => Scaffold(
          backgroundColor: AppColors.white,
          appBar: _buildAppBar(context, pool),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, pool),
                      const Gap(100),
                      YieldChart(data: pool.tvlAprChartData),
                      const Gap(70),
                      _buildStats(context),
                      const Gap(30),
                      _buildPlatformsSection(context),
                      const Gap(30),
                      _buildDivider(context),
                      const Gap(30),
                      _buildPositionDetail(context, pool),
                      const Gap(30),
                      _buildDivider(context),
                      const Gap(30),
                      _buildVaultStats(context, pool),
                      const Gap(100),
                    ],
                  ),
                ),
              ),
              _buildSupplyButton(context, pool),
            ],
          ),
        ),
      ),
      loading: () => Center(
        child: LottieBuilder.asset('assets/lotties/loading-indicator.json'),
      ),
      error: (error, stackTrace) => const Center(child: Text('Error')),
    );
  }

  AppBar _buildAppBar(BuildContext context, dynamic pool) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
      ),
      automaticallyImplyLeading: false,
      title: _buildTitle(context, pool),
      actions: [_buildMultiplyBadge(context)],
    );
  }

  Widget _buildTitle(BuildContext context, dynamic pool) {
    return Row(
      children: [
        _buildTokenLogo(),
        const Gap(10),
        Text(
          pool.name,
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildTokenLogo() {
    if (metadata is List && metadata.length > 1) {
      return RowSuper(
        innerDistance: -20,
        children: [
          _buildTokenImage(metadata.first['coin_logo_url']),
          _buildTokenImage(metadata.last['coin_logo_url']),
        ],
      );
    } else {
      return _buildTokenImage(metadata['coin_logo_url']);
    }
  }

  Widget _buildTokenImage(String url) {
    return url.endsWith('.svg')
        ? SvgPicture.network(url, height: 35)
        : Image.network(url, height: 35);
  }

  Widget _buildMultiplyBadge(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: context.screenWidth * 0.25,
      height: context.screenHeight * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffDEDDFA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "Multiply",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5B53E6),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, dynamic pool) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          Text(
            "\$70.28K",
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark,
            ),
          ),
          const Spacer(),
          Text(
            '${pool.apr} APR',
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greenLight,
            ),
          ),
          const Gap(10)
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(context, '56.3%', 'MAX APY'),
          _buildStatItem(context, '9.5x', 'Max Multiply'),
          _buildStatItem(context, '\$23.5M', 'Available'),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: context.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Text(
            label,
            style: context.bodySmall?.copyWith(
              color: AppColors.greyDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Platforms',
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPlatformItem(context, 'Aries', 'assets/images/platform-aries.png'),
            _buildPlatformItem(context, 'Amnis', 'assets/images/platform-amnis.png'),
            _buildPlatformItem(context, 'Aries', 'assets/images/platform-aries.png'),
            Container(),
            Container(),
          ],
        ),
      ],
    );
  }

  Widget _buildPlatformItem(BuildContext context, String name, String imagePath) {
    return Container(
      height: context.screenHeight * 0.04,
      width: context.screenWidth * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imagePath, height: 20),
          Text(
            name,
            style: context.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: AppColors.greyDark,
        thickness: 0.5,
      ),
    );
  }

  Widget _buildPositionDetail(BuildContext context, dynamic pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Position Detail',
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(30),
        _buildPositionRow(context, pool, '0', 'My Position', '0', 'My Supply', '0', 'Total'),
        const Gap(30),
        _buildPositionRow(context, pool, '1.5x', 'My Multiply', '+12.63%', 'Net APY', '14.65%', 'Lend APY'),
        const Gap(30),
        _buildPositionRow(context, pool, '2.01%', 'Borrow APY', '', '', '', ''),
      ],
    );
  }

  Widget _buildPositionRow(BuildContext context, dynamic pool, String value1, String label1, String value2, String label2, String value3, String label3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPositionItem(context, '$value1 ${pool.name.split(' ')[0]}', label1, CrossAxisAlignment.start),
          _buildPositionItem(context, '$value2 ${pool.name.split(' ')[0]}', label2, CrossAxisAlignment.center),
          _buildPositionItem(context, '$value3 ${pool.name.split(' ')[0]}', label3, CrossAxisAlignment.end),
        ],
      ),
    );
  }

  Widget _buildPositionItem(BuildContext context, String value, String label, CrossAxisAlignment alignment) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(
            value,
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Text(
            label,
            style: context.bodySmall?.copyWith(
              color: AppColors.greyDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVaultStats(BuildContext context, dynamic pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vault Stats',
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(30),
        _buildVaultStatRow(context, 'Total ${pool.name.split(' ')[0]} Supplied', '56.3M', '\$50.09M'),
        const Gap(30),
        _buildVaultStatRow(context, 'Total ${pool.name.split(' ')[0]} Borrowed', '2.91M', '\$26.85M'),
        const Gap(30),
        _buildVaultStatRow(context, 'AVG Multiplier', '1.54x', ''),
      ],
    );
  }

  Widget _buildVaultStatRow(BuildContext context, String label, String value1, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            label,
            style: context.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value1,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              if (value2.isNotEmpty)
                Text(
                  value2,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyDark,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSupplyButton(BuildContext context, dynamic pool) {
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
            color: AppColors.black,
            border: Border(
              top: BorderSide(color: AppColors.grey, width: 0.5),
            ),
          ),
          height: 60,
          child: Center(
            child: Text(
              "Supply",
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

