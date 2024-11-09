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

class YieldStakingView extends ConsumerWidget {
  final dynamic metadata;
  final String poolId;
  final String poolName;

  const YieldStakingView({
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
                      const Gap(40),
                      _buildDetailsSection(context, pool),
                    ],
                  ),
                ),
              ),
              _buildStakeButton(context, pool),
            ],
          ),
        ),
      ),
      loading: () => Scaffold(
        body: Center(
          child: LottieBuilder.asset('assets/lotties/loading-indicator.json'),
        ),
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
      actions: [_buildStakingBadge(context)],
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

  Widget _buildStakingBadge(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: context.screenWidth * 0.2,
      height: context.screenHeight * 0.04,
      decoration: BoxDecoration(
        color: const Color(0xffDCEFD8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          "Staking",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF58BB47),
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
            '${pool.apr} APR',
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greenLight,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    PhosphorIconsBold.users,
                    color: AppColors.black,
                    size: 14,
                  ),
                  Text(
                    "25K+",
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
              Text(
                "Stakes",
                style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
          const Gap(10)
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context, dynamic pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: context.headlineSmall.copyWith(fontWeight: FontWeight.w600),
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDetailItem(
              context,
              icon: PhosphorIconsBold.handDeposit,
              title: '14.28M ${pool.name}',
              subtitle: '${pool.name} Supplied',
            ),
            _buildPlatformItem(context),
          ],
        ),
        const Gap(20),
        Row(
          children: [
            _buildDetailItem(
              context,
              icon: PhosphorIconsBold.users,
              title: '56.7M',
              subtitle: 'Total Stakers',
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context,
      {required IconData icon, required String title, required String subtitle}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.screenWidth * 0.1,
            height: context.screenHeight * 0.045,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: AppColors.greyDark,
              size: 20,
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: context.bodySmall.copyWith(
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

  Widget _buildPlatformItem(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/platform-aries.png',
            height: 40,
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aries',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Platform',
                style: context.bodySmall.copyWith(
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

  Widget _buildStakeButton(BuildContext context, dynamic pool) {
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
              "Stake",
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