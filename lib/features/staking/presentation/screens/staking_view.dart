import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/shared/data/sources/remote/coin_metadata_service.dart';
import 'package:defy/features/shared/presentation/providers/coin_metadata_provider.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/presentation/screens/staking_details_view.dart';
import 'package:defy/features/staking/provider/staking_pool_provider.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StakingView extends ConsumerStatefulWidget {
  const StakingView({Key? key}) : super(key: key);

  @override
  ConsumerState<StakingView> createState() => _StakingViewState();
}

class _StakingViewState extends ConsumerState<StakingView> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final nativeStakingPoolsAsyncValue = ref.watch(getStakingPoolsProvider);
    final thirdPartyStakingPoolsAsyncValue = ref.watch(getAllPoolsProvider);
    final coinMetadataService = ref.watch(coinMetadataServiceProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildTabBar(context),
          _buildHeaderDivider(context),
          Expanded(
            child: _buildStakingPoolsList(
              context,
              nativeStakingPoolsAsyncValue,
              thirdPartyStakingPoolsAsyncValue,
              coinMetadataService,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Staking',
        style: context.titleLarge.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsRegular.handshake,
              color: AppColors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildTabButton(context, "All", 0),
              const SizedBox(width: 24),
              _buildTabButton(context, "Third Party", 1),
              const SizedBox(width: 24),
              _buildTabButton(context, "Native", 2),
            ],
          ),
          Row(
            children: [
              _buildIconButton(PhosphorIcons.trendUp(PhosphorIconsStyle.bold)),
              const SizedBox(width: 20),
              _buildIconButton(
                  PhosphorIcons.funnelSimple(PhosphorIconsStyle.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Text(
        text,
        style: context.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: _selectedTabIndex == index
              ? AppColors.black
              : AppColors.greyMedium,
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          icon,
          color: AppColors.greyDark,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildHeaderDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Divider(color: AppColors.greyVeryLight, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Staking Pools",
                  style: context.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyLight,
                  ),
                ),
                Text(
                  "APY",
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStakingPoolsList(
    BuildContext context,
    AsyncValue<Either<Exception, List<StakingPoolEntity>>>
        nativePoolsAsyncValue,
    AsyncValue<Either<Exception, List<PoolResponse>>> thirdPartyPoolsAsyncValue,
    CoinMetadataService coinMetadataService,
  ) {
    return nativePoolsAsyncValue.when(
      data: (nativeEitherResult) {
        return thirdPartyPoolsAsyncValue.when(
          data: (thirdPartyEitherResult) {
            return nativeEitherResult.fold(
              (nativeError) => Text('Error: ${nativeError.toString()}'),
              (nativePools) {
                return thirdPartyEitherResult.fold(
                  (thirdPartyError) =>
                      Text('Error: ${thirdPartyError.toString()}'),
                  (thirdPartyPools) {
                    final filteredThirdPartyPools = thirdPartyPools
                        .where((pool) =>
                            pool.strategyType == "Staking" &&
                            pool.stakeToken.length == 1)
                        .toList();

                    List<dynamic> allPools = [
                      ...nativePools,
                      ...filteredThirdPartyPools
                    ];
                    List<dynamic> displayPools;

                    switch (_selectedTabIndex) {
                      case 0:
                        displayPools = allPools;
                        break;
                      case 1:
                        displayPools = filteredThirdPartyPools;
                        break;
                      case 2:
                        displayPools = nativePools;
                        break;
                      default:
                        displayPools = allPools;
                    }

                    return ListView.builder(
                      itemCount: displayPools.length,
                      itemBuilder: (context, index) {
                        final pool = displayPools[index];
                        return _buildPoolListItem(
                            context, pool, coinMetadataService);
                      },
                    );
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text('Error: $error'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error: $error'),
    );
  }

  Widget _buildPoolListItem(BuildContext context, dynamic pool,
      CoinMetadataService coinMetadataService) {
    String name;
    String fee;
    String apy;
    String state;
    String? stakeTokenId;

    if (pool is StakingPoolEntity) {
      name = (pool.operatorAptosName == ''
          ? '${pool.operatorAddress!.substring(0, 4)}...${pool.operatorAddress!.substring(pool.operatorAddress!.length - 4)}'
          : pool.operatorAptosName ?? 'Unknown')!;
      fee = 'Fee ${pool.commissionRate ?? 'N/A'}';
      apy = pool.rewardsGrowthPercentage != null
          ? '${pool.rewardsGrowthPercentage!.toStringAsFixed(2)}%'
          : 'N/A% APY';
      state = pool.state ?? 'Unknown';
      stakeTokenId = null;
      return _buildListTile(context, name, fee, apy, state, null, pool);
    } else if (pool is PoolResponse) {
      name = pool.nameId;
      fee = 'Fee ${pool.depositFee ?? 'N/A'}';
      apy = pool.apr != null
          ? '${double.parse(pool.apr).toStringAsFixed(2)}%'
          : 'N/A% APY';
      state = pool.isEnabled ? 'Active' : 'Inactive';
      stakeTokenId = pool.stakeToken.first;
    } else {
      return const SizedBox.shrink();
    }

    return FutureBuilder<Map<String, dynamic>?>(
      future: coinMetadataService.getCoinsMetaData([stakeTokenId!]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return _buildListTile(context, name, fee, apy, state, null, pool);
        } else if (!snapshot.hasData || snapshot.data == null) {
          return _buildListTile(context, name, fee, apy, state, null, pool);
        }

        final metadata = snapshot.data!['coins'];
        if (metadata == null || metadata.isEmpty) {
          return _buildListTile(context, name, fee, apy, state, null, pool);
        }

        final coinMetadata = metadata.first;
        final logoUrl = coinMetadata['coin_logo_url'] as String?;

        return _buildListTile(context, name, fee, apy, state, logoUrl, pool);
      },
    );
  }

  Widget _buildListTile(BuildContext context, String name, String fee,
      String apy, String state, String? logoUrl, dynamic pool) {
    Widget leadingWidget;

    if (logoUrl != null) {
      if (logoUrl.toLowerCase().endsWith('.svg')) {
        leadingWidget = SvgPicture.network(
          logoUrl,
          height: 40,
          width: 40,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        leadingWidget = CachedNetworkImage(
          imageUrl: logoUrl,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/icons/staking-default.png',
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      leadingWidget = Image.asset(
        'assets/icons/aptos-logo.png',
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StakingDetailsView(
                pool: pool,
                metadata:
                    pool is PoolResponse ? {'coin_logo_url': logoUrl} : null,
                poolId: pool is PoolResponse ? pool.id : pool.operatorAddress,
                poolName: name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: leadingWidget,
            ),
            title: Text(
              name,
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              fee,
              style: context.bodyMedium?.copyWith(color: AppColors.greyDark),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  apy,
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  state,
                  style: context.bodySmall?.copyWith(color: AppColors.greyDark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
