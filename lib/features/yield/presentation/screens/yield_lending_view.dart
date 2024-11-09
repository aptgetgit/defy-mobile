import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/yield/presentation/components/yield_chart.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:defy/features/yield/presentation/screens/yield_lending_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class YieldLendingView extends ConsumerWidget {
  final String poolId;
  final String poolName;
  final dynamic metadata;

  const YieldLendingView({
    required this.metadata,
    required this.poolId,
    required this.poolName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poolEither = ref.watch(getPoolProvider(poolId, poolName));

    return poolEither.when(
      data: (either) => either.fold(
        (error) => const Center(child: Text('Error')),
        (pool) => Scaffold(
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
                      const Gap(40),
                      _buildSupplyInfo(context, pool),
                      const Gap(30),
                      _buildInfoSection(context, pool),
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
        child: LottieBuilder.asset('assets/animations/loading-indicator.json'),
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
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
      actions: [_buildLendingBadge(context)],
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

  Widget _buildLendingBadge(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: context.screenWidth * 0.2,
      height: context.screenHeight * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffFFEFD4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "Lending",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.orange,
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

  Widget _buildSupplyInfo(BuildContext context, dynamic pool) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          _buildInfoContainer(context, pool, "3.85 ${pool.name}", "${pool.name} Supplied"),
          const Spacer(),
          _buildInfoContainer(context, pool, "3.85 ${pool.name}", "${pool.name} Supplied"),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(BuildContext context, dynamic pool, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: context.screenHeight * 0.1,
      width: context.screenWidth * 0.425,
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Icon(
                  PhosphorIconsBold.caretUpDown,
                  color: AppColors.black,
                  size: 14,
                ),
              ],
            ),
            const Gap(10),
            Text(
              subtitle,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.greyDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, dynamic pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Supply Info',
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(20),
        _buildInfoRow(context, '3.65', 'Total Supplied', '0.29%', 'Supply APY', '10 ${pool.name}', 'Supply Cap'),
        const Gap(30),
        _buildInfoRow(context, '23 Days', 'Utilisation', '60%', 'Max LTV', 'Aries', 'Platform'),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String value1, String label1, String value2, String label2, String value3, String label3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInfoItem(context, value1, label1, CrossAxisAlignment.start),
          _buildInfoItem(context, value2, label2, CrossAxisAlignment.center),
          _buildInfoItem(context, value3, label3, CrossAxisAlignment.end),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String value, String label, CrossAxisAlignment alignment) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(
            value,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Text(
            label,
            style: context.bodySmall.copyWith(
              color: AppColors.greyDark,
            ),
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
              style: context.titleLarge.copyWith(
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