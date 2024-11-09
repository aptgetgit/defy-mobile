import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/presentation/screens/staking_chart.dart';
import 'package:defy/features/yield/data/models/pool_data_response.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:defy/features/yield/presentation/screens/yield_lending_transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StakingDetailsView extends ConsumerWidget {
  final dynamic metadata;
  final String poolId;
  final String poolName;
  final dynamic pool;

  const StakingDetailsView({
    Key? key,
    required this.metadata,
    required this.poolId,
    required this.poolName,
    required this.pool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (pool is PoolResponse) {
      final poolEither = ref.watch(getPoolProvider(poolId, poolName));
      return poolEither.when(
        data: (either) => either.fold(
          (error) => const Center(child: Text('Error')),
          (pool) => _buildScaffold(context, pool),
        ),
        loading: () => _buildLoadingScaffold(),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      );
    } else if (pool is StakingPoolEntity) {
      return _buildScaffold(context, pool);
    } else {
      return const Center(child: Text('Invalid pool type'));
    }
  }

  Widget _buildLoadingScaffold() {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('assets/lotties/loading-indicator.json'),
      ),
    );
  }

  Widget _buildScaffold(BuildContext context, dynamic pool) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context, pool),
      body: Stack(
        children: [
          _buildBody(context, pool),
          _buildStakeButton(context, pool),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, dynamic pool) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
      ),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          _buildPoolLogo(),
          const Gap(10),
          Text(
            _getPoolName(pool),
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: [
        AnimatedContainer(
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
        ),
        const Gap(20),
      ],
    );
  }

  String _getPoolName(dynamic pool) {
    if (pool is PoolDataResponse) {
      return pool.nameId;
    } else if (pool is StakingPoolEntity) {
      return pool.operatorAddress != null
          ? '${pool.operatorAddress!.substring(0, 4)}...${pool.operatorAddress!.substring(pool.operatorAddress!.length - 4)}'
          : 'Unknown';
    } else {
      return 'Unknown';
    }
  }

  Widget _buildPoolLogo() {
    if (pool is PoolDataResponse) {
      if (metadata is List && metadata.length > 1) {
        return RowSuper(
          innerDistance: -20,
          children: metadata.map<Widget>((meta) {
            return meta['coin_logo_url'].endsWith('.svg')
                ? SvgPicture.network(meta['coin_logo_url'], height: 35)
                : Image.network(meta['coin_logo_url'], height: 35);
          }).toList(),
        );
      } else {
        final logoUrl = metadata is List
            ? metadata.first['coin_logo_url']
            : metadata['coin_logo_url'];
        return logoUrl.endsWith('.svg')
            ? SvgPicture.network(logoUrl, height: 35)
            : Image.network(logoUrl, height: 35);
      }
    } else {
      return Image.asset('assets/images/staking-default.png', height: 35);
    }
  }

  Widget _buildBody(BuildContext context, dynamic pool) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoolInfo(context, pool),
            const Gap(100),
            const StakingChart(),
            const Gap(40),
            Text('Details', style: context.headlineSmall),
            const Gap(20),
            _buildDetailsRow(context, pool),
            const Gap(20),
            _buildStakersRow(context, pool),
          ],
        ),
      ),
    );
  }

  Widget _buildPoolInfo(BuildContext context, dynamic pool) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: [
          Text(
            '${_getAPR(pool)}% APR',
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
                  const Icon(PhosphorIconsBold.users,
                      color: AppColors.black, size: 14),
                  Text(
                    _getStakersCount(pool),
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

String _getAPR(dynamic pool) {
  if (pool is PoolDataResponse) {
    return pool.apr ?? 'N/A';
  } else if (pool is StakingPoolEntity) {
    return pool.rewardsGrowthPercentage?.toStringAsFixed(2) ?? 'N/A';
  } else {
    return 'N/A';
  }
}


  String _getStakersCount(dynamic pool) {
    if (pool is PoolDataResponse) {
      return "25K+";
    } else if (pool is StakingPoolEntity) {
      return pool.activeDelegators?.toString() ?? 'N/A';
    } else {
      return 'N/A';
    }
  }

  Widget _buildDetailsRow(BuildContext context, dynamic pool) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: _buildDetailItem(
            context,
            icon: PhosphorIconsBold.handDeposit,
            value: _getPoolValue(pool),
            label: _getPoolValueLabel(pool),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/platform-aries.png', height: 40),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aries', style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
                  Text(
                    'Platform',
                    style: context.bodySmall.copyWith(color: AppColors.greyDark),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context, {required IconData icon, required String value, required String label}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth * 0.1,
          height: context.screenHeight * 0.045,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, color: AppColors.greyDark, size: 20),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
            Text(
              label,
              style: context.bodySmall.copyWith(color: AppColors.greyDark),
            ),
          ],
        ),
      ],
    );
  }


String _getPoolValue(dynamic pool) {
  if (pool is PoolDataResponse) {
    String formattedTVL = _formatValue(pool.totalValueLocked);
    return '$formattedTVL ${pool.name}';
  } else if (pool is StakingPoolEntity) {
    String formattedVotingPower = _formatValue(pool.votingPower);
    return '$formattedVotingPower ${pool.operatorAptosName ?? "APT"}';
  } else {
    return 'N/A';
  }
}

String _formatValue(String? value) {
  if (value == null) return 'N/A';
  double? parsedValue = double.tryParse(value);
  if (parsedValue == null) return value;
  return parsedValue.toStringAsFixed(2);
}

  String _getPoolValueLabel(dynamic pool) {
    if (pool is PoolDataResponse) {
      return '${pool.name} Supplied';
    } else if (pool is StakingPoolEntity) {
      return 'Voting Power';
    } else {
      return 'N/A';
    }
  }

  Widget _buildStakersRow(BuildContext context, dynamic pool) {
    return Row(
      children: [
        Expanded(
          child: _buildDetailItem(
            context,
            icon: PhosphorIconsBold.users,
            value: _getStakersCount(pool),
            label: 'Total Stakers',
          ),
        ),
        const Expanded(child: SizedBox())
      ],
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
            border: Border(top: BorderSide(color: AppColors.grey, width: 0.5)),
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