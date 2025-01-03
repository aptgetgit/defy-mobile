import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/shared/data/sources/remote/coin_metadata_service.dart';
import 'package:defy/features/shared/presentation/providers/coin_metadata_provider.dart';
import 'package:defy/features/shared/presentation/widgets/blue_chip_bottom_sheet.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/presentation/screens/staking_details_view.dart';
import 'package:defy/features/staking/provider/staking_pool_provider.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class StakingPoolView extends ConsumerStatefulWidget {
  const StakingPoolView({Key? key}) : super(key: key);

  @override
  ConsumerState<StakingPoolView> createState() => _StakingPoolViewState();
}

class _StakingPoolViewState extends ConsumerState<StakingPoolView> {
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
          const SizedBox(height: 20),
          _buildTabBar(context),
          _buildHeaderDivider(context),
          const SizedBox(height: 16),
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
      centerTitle: true,
      title: Text(
        'Stake',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildTabButton(context, "All", 0),
              const SizedBox(width: 16),
              _buildTabButton(context, "Third Party", 1),
              const SizedBox(width: 16),
              _buildTabButton(context, "Native", 2),
            ],
          ),
          Row(
            children: [
              _buildIconButton(PhosphorIcons.trendUp(PhosphorIconsStyle.bold)),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  openBottomSheet();
                },
                child: _buildIconButton(
                    PhosphorIcons.funnelSimple(PhosphorIconsStyle.bold)),
              ),
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
          fontWeight:
              _selectedTabIndex == index ? FontWeight.w600 : FontWeight.w500,
          color: _selectedTabIndex == index
              ? AppColors.black
              : AppColors.greyLight,
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          icon,
          color: AppColors.grey,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildHeaderDivider(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(color: AppColors.greyVeryLight, thickness: 1.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Provider",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
              ),
              Text(
                "APY",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: AppColors.greyLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStakingPoolsList(
    BuildContext context,
    AsyncValue<Either<Exception, List<StakingPoolEntity>>>
        nativePoolsAsyncValue,
    AsyncValue<Either<Exception, List<PoolResponseEntity>>>
        thirdPartyPoolsAsyncValue,
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
                    final filteredThirdPartyPools =
                        thirdPartyPools.where((pool) {
                      return pool.strategyType?.trim().toLowerCase() ==
                              "staking" &&
                          pool.stakeToken?.length == 1;
                    }).toList();

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
    } else if (pool is PoolResponseEntity) {
      name = pool.nameId ?? 'Unknown';
      fee = 'Fee ${pool.depositFee ?? 'N/A'}';
      apy =
          pool.apr != null ? '${double.tryParse(pool.apr!) ?? 0}%' : 'N/A% APY';
      state = (pool.isEnabled ?? false) ? 'Active' : 'Inactive';
      stakeTokenId = pool.stakeToken?.firstOrNull;
    } else {
      return const SizedBox.shrink();
    }

    return FutureBuilder<Map<String, dynamic>?>(
      future: coinMetadataService.getCoinsMetaData([stakeTokenId!]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data == null) {
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
          height: 44,
          width: 44,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            height: 44,
            width: 44,
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        leadingWidget = CachedNetworkImage(
          imageUrl: logoUrl,
          height: 44,
          width: 44,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/icons/staking-default.png',
            height: 44,
            width: 44,
            fit: BoxFit.cover,
          ),
        );
      }
    } else {
      leadingWidget = Image.asset(
        'assets/icons/staking-default.png',
        // 'assets/icons/aptos-logo.png',
        //TODO: Replace with the correct image
        height: 44,
        width: 44,
        fit: BoxFit.cover,
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StakingDetailsView(
              pool: pool,
              metadata: pool is PoolResponseEntity
                  ? {'coin_logo_url': logoUrl}
                  : null,
              poolId:
                  pool is PoolResponseEntity ? pool.id : pool.operatorAddress,
              poolName: name,
            ),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 22.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: leadingWidget,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Liquid',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyDark,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${double.parse(apy.replaceAll('%', '')).round()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          )),
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FractionallySizedBox(
              heightFactor:
                  MediaQuery.of(context).size.height > 800 ? 0.8 : 0.9,
              child: BlueChipBottomSheet());
        });
  }
}


// ListTile(
//           contentPadding:
//               EdgeInsets.only(left: 20.w, right: 20.w, top: 0, bottom: 0),
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: leadingWidget,
//           ),
//           title: Text(
//             name,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//           subtitle: Text(
//             fee,
//             style: context.bodyMedium?.copyWith(
//                 color: AppColors.greyDark, fontWeight: FontWeight.w600),
//           ),
//           trailing: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
              
//               Text(
//                 state,
//                 style: context.bodySmall?.copyWith(color: AppColors.greyDark),
//               ),
//             ],
//           ),
//         ),