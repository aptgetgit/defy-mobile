import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/data/sources/remote/coin_metadata_service.dart';
import 'package:defy/features/shared/presentation/providers/coin_metadata_provider.dart';
import 'package:defy/features/yield/data/models/pool_response.dart';
import 'package:defy/features/yield/domain/entities/pool_response_entity.dart';
import 'package:defy/features/yield/domain/yield_state_model.dart';
import 'package:defy/features/yield/presentation/components/yield_chart.dart';
import 'package:defy/features/yield/presentation/provider/yield_pool_provider.dart';
import 'package:defy/features/yield/presentation/provider/yield_view_provider.dart';
import 'package:defy/features/yield/presentation/screens/yield_lending_view.dart';
import 'package:defy/features/yield/presentation/screens/yield_staking_view.dart';
import 'package:defy/features/yield/presentation/screens/yield_add_liquidity_view.dart';
import 'package:defy/features/yield/presentation/screens/yield_multiply_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:ui' as ui;

class YieldView extends ConsumerWidget {
  const YieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(yieldViewProviderProvider);
    final controller = ref.watch(yieldViewProviderProvider.notifier);
    final allPoolEither = ref.watch(getAllPoolsProvider);
    final coinMetadataService = ref.watch(coinMetadataServiceProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: allPoolEither.when(
        data: (either) => either.fold(
          (error) => Center(child: Text('Error: $error')),
          (pools) => _buildBody(
              context, state, controller, pools, coinMetadataService),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(
        PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
        color: AppColors.black,
        size: 18,
      ),
      title: Text(
        "Yield",
        style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                const Offset(0, 0),
                const Offset(0, 24.0),
                [
                  const Color(0xffFA7AA2),
                  const Color(0xffC93E69),
                ],
              );
            },
            child: const Icon(
              PhosphorIconsFill.piggyBank,
              size: 24,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody(
      BuildContext context,
      YieldStateModel state,
      YieldViewProvider controller,
      List<PoolResponseEntity> pools,
      CoinMetadataService coinMetadataService) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          children: [
            _buildToggleButtons(context, state, controller),
            const Gap(20),
            _buildPoolList(context, state, pools, coinMetadataService),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons(BuildContext context, YieldStateModel state,
      YieldViewProvider controller) {
    return Row(
      children: [
        _buildToggleButton(
          context: context,
          isSelected: state.toggleSingleMulti,
          onTap: () => controller.toggleSingleMulti(),
          text: "Multiple 🤑",
          width: 0.25,
        ),
        const Gap(20),
        _buildToggleButton(
          context: context,
          isSelected: !state.toggleSingleMulti,
          onTap: () => controller.toggleSingleMulti(),
          text: "Single ☝🏻",
          width: 0.225,
        ),
        const Spacer(),
        _buildIconButton(
          icon: PhosphorIconsRegular.slidersHorizontal,
          onTap: () {
            // showFilterBottomSheet();
          },
        ),
        const Gap(10),
        _buildIconButton(
          icon: PhosphorIconsRegular.magnifyingGlass,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required bool isSelected,
    required VoidCallback onTap,
    required String text,
    required double width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: context.screenWidth * width,
        height: context.screenHeight * 0.04,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: context.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.greyDark,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.greyDark,
        ),
      ),
    );
  }

  Widget _buildPoolList(BuildContext context, YieldStateModel state,
      List<PoolResponseEntity> pools, CoinMetadataService coinMetadataService) {
    final filteredPools = pools
        .where((pool) => state.toggleSingleMulti
            ? pool.stakeToken!.length > 1
            : pool.stakeToken!.length == 1)
        .toList();

    return Column(
      children: filteredPools
          .map((pool) => _buildPoolItem(context, pool, coinMetadataService))
          .toList(),
    );
  }

  Widget _buildPoolItem(BuildContext context, PoolResponseEntity pool,
      CoinMetadataService coinMetadataService) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: coinMetadataService.getCoinsMetaData(pool.stakeToken ?? []),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data available'));
        }

        final metadata = snapshot.data!['coins'];
        if (metadata.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return GestureDetector(
          onTap: () => _navigateToPoolDetails(context, pool, metadata),
          child: pool.stakeToken!.length > 1
              ? _buildMultiToken(context, pool, metadata)
              : _buildSingleToken(context, pool, metadata.first),
        );
      },
    );
  }

  void _navigateToPoolDetails(
      BuildContext context, PoolResponseEntity pool, dynamic metadata) {
    Widget destination;
    switch (pool.strategyType) {
      case 'Lending':
        destination = YieldLendingView(
          metadata: metadata,
          poolId: pool.id!,
          poolName: pool.nameId!,
        );
        break;
      case 'Staking':
        destination = YieldStakingView(
          poolId: pool.id!,
          poolName: pool.nameId!,
          metadata: metadata,
        );
        break;
      case 'Liquidity':
        destination = YieldAddLiquidityView(
          poolId: pool.id!,
          poolName: pool.nameId!,
          metadata: metadata,
        );
        break;
      case 'Leverage':
        destination = YieldMultiplyView(
          metadata: metadata,
          poolId: pool.id!,
          poolName: pool.nameId!,
        );
        break;
      default:
        return;
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => destination));
  }

  Widget _buildMultiToken(
      BuildContext context, PoolResponseEntity pool, List<dynamic> metadata) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          RowSuper(
            innerDistance: -20,
            children: metadata
                .map((token) => _buildTokenLogo(token['coin_logo_url']))
                .toList(),
          ),
          const Gap(10),
          _buildPoolInfo(context, pool),
          const Spacer(),
          _buildPoolStats(context, pool),
        ],
      ),
    );
  }

  Widget _buildSingleToken(
      BuildContext context, PoolResponseEntity pool, dynamic metadata) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildTokenLogo(metadata['coin_logo_url']),
          const Gap(10),
          _buildPoolInfo(context, pool),
          const Spacer(),
          _buildPoolStats(context, pool),
        ],
      ),
    );
  }

  Widget _buildTokenLogo(String url) {
    return url.endsWith('.svg')
        ? SvgPicture.network(url, height: 35)
        : Image.network(url, height: 35);
  }

  Widget _buildPoolInfo(BuildContext context, PoolResponseEntity pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pool.name!,
          style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const Gap(5),
        Text(
          "${pool.totalValueLocked} TVL",
          style: context.bodyMedium.copyWith(color: AppColors.greyDark),
        ),
      ],
    );
  }

  Widget _buildPoolStats(BuildContext context, PoolResponseEntity pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: Text(
            "${pool.apr!.substring(0, 4)}% APR",
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        const Gap(5),
        Text(
          pool.strategyType!,
          style: context.bodyMedium.copyWith(color: AppColors.greyDark),
        ),
      ],
    );
  }
}
