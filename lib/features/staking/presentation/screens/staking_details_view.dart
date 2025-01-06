import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:defy/features/shared/presentation/widgets/custom_slider.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/presentation/screens/staking_chart.dart';
import 'package:defy/features/staking/presentation/screens/native_staking_view.dart';
import 'package:defy/features/staking/presentation/screens/third_party_staking_view.dart';
import 'package:defy/features/yield/domain/entities/pool_data_entity.dart';
import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'staking_widget.dart';

class StakingDetailsView extends ConsumerStatefulWidget {
  final dynamic metadata;
  final String poolId;
  final String poolName;
  final dynamic pool;

  const StakingDetailsView({
    super.key,
    required this.metadata,
    required this.poolId,
    required this.poolName,
    required this.pool,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StakingDetailsViewState();
}

class _StakingDetailsViewState extends ConsumerState<StakingDetailsView> {
  double _value = 5.0;
  late ScrollController _scrollController;
  bool _showTitle = false;
  bool isLocked = true;
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
    bool isInvested = true;
    if (widget.pool is PoolResponseEntity) {
      final poolEither =
          ref.watch(getPoolProvider(widget.poolId, widget.poolName));
      return poolEither.when(
        data: (either) => either.fold(
          (error) => _buildErrorScaffold(context, error),
          (pool) => _buildCustomScrollView(context, pool, isInvested),
        ),
        loading: () => _buildLoadingScaffold(),
        error: (error, stackTrace) => _buildErrorScaffold(context, error),
      );
    } else if (widget.pool is StakingPoolEntity) {
      return _buildCustomScrollView(context, widget.pool, isInvested);
    } else {
      return _buildErrorScaffold(context, 'Invalid pool type');
    }
  }

  Widget _buildLoadingScaffold() {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('assets/animations/loading-indicator.json'),
      ),
    );
  }

  Widget _buildErrorScaffold(BuildContext context, dynamic error) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child:
              const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
        ),
        title: Text('Error',
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(PhosphorIconsBold.warning, size: 48, color: AppColors.red),
            const SizedBox(height: 16),
            Text(
              'Failed to load pool data',
              style: context.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomScrollView(
      BuildContext context, dynamic pool, bool isInvested) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(context, pool),
          SliverToBoxAdapter(
            child: _buildBody(context, pool, isInvested),
          ),
        ],
      ),
      bottomNavigationBar: _buildStakeButton(
          context, pool, widget.metadata, widget.poolId, widget.poolName),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, dynamic pool) {
    return SliverAppBar(
      expandedHeight: 188.h,
      elevation: 4,
      shadowColor: AppColors.black,
      surfaceTintColor: AppColors.black,
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
            _buildPoolLogo(small: false),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getPoolName(pool),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '7.12\%',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPoolLogo(),
                SizedBox(height: 11.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _getPoolName(pool),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${_getAPR(pool)}%',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenLight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11.h),
                Row(
                  children: [
                    Icon(PhosphorIconsBold.users,
                        color: AppColors.greyLight, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${_getStakersCount(pool)} investors',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      '1Y Returns',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight),
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

  String _getPoolName(dynamic pool) {
    if (pool is PoolDataEntity) {
      return pool.nameId;
    } else if (pool is StakingPoolEntity) {
      return pool.operatorAddress != null
          ? '${pool.operatorAddress!.substring(0, 4)}...${pool.operatorAddress!.substring(pool.operatorAddress!.length - 4)}'
          : 'Unknown';
    } else {
      return 'Unknown';
    }
  }

  Widget _buildPoolLogo({bool small = false}) {
    if (widget.pool is PoolDataEntity) {
      if (widget.metadata is List && widget.metadata.length > 1) {
        return RowSuper(
          innerDistance: -20,
          children: widget.metadata.map<Widget>((meta) {
            return meta['coin_logo_url'].endsWith('.svg')
                ? SvgPicture.network(meta['coin_logo_url'],
                    height: small ? 24.0 : 32.0)
                : Image.network(meta['coin_logo_url'],
                    height: small ? 24.0 : 32.0);
          }).toList(),
        );
      } else {
        final logoUrl = widget.metadata is List
            ? widget.metadata.first['coin_logo_url']
            : widget.metadata['coin_logo_url'];
        return logoUrl.endsWith('.svg')
            ? SvgPicture.network(logoUrl, height: small ? 24.0 : 32.0)
            : Image.network(logoUrl, height: small ? 24.0 : 32.0);
      }
    } else {
      return Image.asset('assets/icons/staking-default.png',
          height: small ? 24.0 : 32.0);
    }
  }

  Widget _buildBody(BuildContext context, dynamic pool, bool isInvested) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.greyVeryLight),
          SizedBox(height: 300, child: LiveStockChart()),
          Divider(color: AppColors.greyVeryLight),
          const Gap(30),
          if (isInvested) ...[
            Text('Investments', style: context.headlineSmall),
            const Gap(20),
            _buildInvestmentsRow(context, pool),
            const Gap(30),
          ],
          Text('Details', style: context.headlineSmall),
          const Gap(20),
          if (!isLocked) ...[
            Text('You will receive staked Aptos',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue)),
            const Gap(20),
          ],
          _buildDetailsRow(context, pool),
          const Gap(20),
          _buildStakersRow(context, pool),
          const Gap(30),
          Text('Return Calculator', style: context.headlineSmall),
          const Gap(20),
          _buildReturnSection(context, pool),
          const Gap(30),
          Text('More Details', style: context.headlineSmall),
          const Gap(16),
          _buildMoreDetailsRow('Creator Address', context, pool),
          const Gap(16),
          _buildMoreDetailsRow('King Pool Address', context, pool),
          const Gap(16),
          _buildMoreDetailsRow('Total Network Share', context, pool),
          const Gap(16),
          _buildMoreDetailsRow('Performance', context, pool),
          const Gap(20),
        ],
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

  Widget _buildInvestmentsRow(BuildContext context, dynamic pool) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/aptos-logo.png', height: 46),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('100 APT',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600)),
                  Text('Staked',
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.greyLight)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '\$3.02',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.greenLight,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('Returns',
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.greyLight)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  String _getAPR(dynamic pool) {
    if (pool is PoolDataEntity) {
      return pool.apr ?? 'N/A';
    } else if (pool is StakingPoolEntity) {
      return pool.rewardsGrowthPercentage?.toStringAsFixed(2) ?? 'N/A';
    } else {
      return 'N/A';
    }
  }

  String _getStakersCount(dynamic pool) {
    if (pool is PoolDataEntity) {
      return _formatLargeNumber(pool.stakers ?? "0");
    } else if (pool is StakingPoolEntity) {
      return _formatLargeNumber(pool.activeDelegators?.toString() ?? "0");
    } else {
      return 'N/A';
    }
  }

  Widget _buildDetailsRow(BuildContext context, dynamic pool) {
    return Row(
      children: [
        Expanded(
          child: _buildDetailItem(
            context,
            icon: PhosphorIconsBold.handDeposit,
            value: _getPoolValue(pool),
            label: _getPoolValueLabel(pool),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildPlatformItem(context),
        ),
      ],
    );
  }

  Widget _buildPlatformItem(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset('assets/icons/aries.png', height: 24),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aries',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Commission',
                style: context.bodySmall.copyWith(color: AppColors.greyDark),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStakersRow(BuildContext context, dynamic pool) {
    return Row(
      children: [
        Expanded(
          child: _buildDetailItem(
            context,
            icon: PhosphorIconsBold.users,
            value: _getStakersCount(pool),
            label: 'Total APT Staked',
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: isLocked
              ? _buildDetailItem(
                  context,
                  icon: PhosphorIconsBold.lockOpen,
                  value: '12:05:03',
                  label: 'Next Unlock',
                )
              : SizedBox(height: 0.0, width: 0.0),
        ),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context,
      {required IconData icon, required String value, required String label}) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: AppColors.greyDark, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                label,
                style: context.bodySmall.copyWith(color: AppColors.greyDark),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getPoolValue(dynamic pool) {
    if (pool is PoolDataEntity) {
      String formattedTVL = _formatLargeNumber(pool.totalValueLocked);
      return '$formattedTVL ${pool.name}';
    } else if (pool is StakingPoolEntity) {
      String formattedVotingPower = _formatLargeNumber(pool.votingPower);
      return '$formattedVotingPower APT';
    } else {
      return 'N/A';
    }
  }

  String _formatLargeNumber(String? value) {
    if (value == null) return 'N/A';
    double? number = double.tryParse(value);
    if (number == null) return value;

    if (number >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(1)}B';
    } else if (number >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(1)}M';
    } else if (number >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(1)}K';
    } else {
      return number.toStringAsFixed(0);
    }
  }

  String _getPoolValueLabel(dynamic pool) {
    if (pool is PoolDataEntity) {
      return '${pool.name} Supplied';
    } else if (pool is StakingPoolEntity) {
      return 'Rewards Given';
    } else {
      return 'N/A';
    }
  }

  Widget _buildMoreDetailsRow(
      String label, BuildContext context, dynamic pool) {
    return Row(
      children: [
        Text(label,
            style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.greyLight)),
        const Spacer(),
        Text(_getPoolAddress(pool),
            style: context.bodyMedium
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.black)),
      ],
    );
  }

  _getPoolAddress(dynamic pool) {
    if (pool is PoolDataEntity) {
      return pool.stakeToken;
    } else if (pool is StakingPoolEntity) {
      return '${pool.stakePoolAddress!.substring(0, 4)}...${pool.stakePoolAddress!.substring(pool.stakePoolAddress!.length - 4)}';
    } else {
      return 'N/A';
    }
  }

  Widget _buildReturnSection(BuildContext context, dynamic pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('\$18', style: context.headlineSmall),
            const Gap(6),
            Text(
              "Invested",
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.greyDark,
              ),
            ),
            const Spacer(),
            Text(
              '<per month>',
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
        const Gap(20),
        CustomSlider(
          min: 0,
          max: 10,
          value: _value,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
          activeColor: AppColors.blue,
          inactiveColor: AppColors.greyLight,
          thumbColor: AppColors.greyVeryLight,
          trackHeight: 4,
          thumbSize: 16,
          showLabel: false,
          label: '\$${_value.toStringAsFixed(2)}',
          animateOnChange: true,
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.easeInOut,
        ),
        const Gap(20),
        _buildTimePeriodButtons(context),
        const Gap(20),
        Text(
          "Would Have Become",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyDark,
          ),
        ),
        const Gap(20),
        Row(
          children: [
            Text(
              '\$432.23',
              style: context.headlineSmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Gap(10),
            Icon(PhosphorIconsFill.caretUp, color: AppColors.greenLight),
            Text(
              "2.12\%",
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.greenLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildTimePeriodButtons(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildTimeButton(context, '1M', true),
      _buildTimeButton(context, '3M', false),
      _buildTimeButton(context, '6M', false),
      _buildTimeButton(context, '1Y', false),
      _buildTimeButton(context, 'ALL', false),
    ],
  );
}

Widget _buildTimeButton(BuildContext context, String label, bool isSelected) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.greyVeryLight,
      border: Border.all(color: isSelected ? AppColors.blue : AppColors.white),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: context.bodySmall.copyWith(
        fontWeight: FontWeight.w600,
        color: isSelected ? AppColors.blue : AppColors.greyDark,
      ),
    ),
  );
}

Widget _buildStakeButton(BuildContext context, dynamic pool, dynamic metadata,
    String poolId, String poolName) {
  return CustomBottomNavBarWithHolders(
    image1: 'rocket.png',
    image2: 'rocket.png',
    image3: 'rocket.png',
    headerText: 'James, Jane and 14+ hold >',
    buttonText1: 'Stake',
    buttonColor1: AppColors.black,
    onTap1: () {
      if (pool is PoolDataEntity) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NativeStakingView(
                  metadata: metadata,
                  poolId: poolId,
                  poolName: poolName,
                  pool: pool)),
        );
      } else if (pool is StakingPoolEntity) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NativeStakingView(
                  metadata: metadata,
                  poolId: poolId,
                  poolName: poolName,
                  pool: pool)),
        );
      }
    },
  );
}
