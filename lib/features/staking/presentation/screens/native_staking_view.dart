import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:defy/features/staking/domain/entities/staking_pool_entity.dart';
import 'package:defy/features/staking/presentation/screens/staking_pool_view.dart';
import 'package:defy/features/staking/provider/staking_view_provider.dart';
import 'package:defy/features/transaction/presentation/screens/transaction_view.dart';
import 'package:defy/features/yield/domain/entities/pool_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NativeStakingView extends ConsumerStatefulWidget {
  final dynamic metadata;
  final String poolId;
  final String poolName;
  final dynamic pool;
  const NativeStakingView({
    super.key,
    required this.metadata,
    required this.poolId,
    required this.poolName,
    required this.pool,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NativeStakingViewState();
}

class _NativeStakingViewState extends ConsumerState<NativeStakingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  void _triggerShakeAnimation() {
    _shakeController.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stakingViewControllerProvider);
    final controller = ref.read(stakingViewControllerProvider.notifier);
    double fontSize = 54;
    String payAmount = state.isUsdAmount ? state.usdAmount : state.aptosAmount;
    if (payAmount.length > 8) {
      fontSize = 48 - (payAmount.length - 8) * 2;
      fontSize = fontSize.clamp(16.0, 54.0);
    }

    bool isAmountExceeded() {
      return double.parse(state.aptosAmount) > 100.21;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
            SizedBox(width: 14.w),
            _buildPoolLogo(),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getPoolName(widget.pool),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '7.13 % APR',
                  style: TextStyle(
                    color: AppColors.greenLight,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 28.h,
              width: 56.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.greenLight.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'Stake',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.greenLight,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Text(
                    'Est Daily Returns',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '0.23 APT',
                    style: TextStyle(
                      color: AppColors.greenLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.toggleAmountType(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, -0.5),
                            end: Offset.zero,
                          ).animate(animation),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        state.isUsdAmount
                            ? '\$${state.usdAmount}'
                            : '${state.aptosAmount} APT',
                        key: ValueKey<bool>(state.isUsdAmount),
                        style: TextStyle(
                          fontSize: fontSize.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: !state.isUsdAmount
                              ? SizedBox.shrink()
                              : ClipOval(
                                  child: Image.asset('assets/icons/aptos.png',
                                      height: 16.h),
                                ),
                        ),
                        AnimatedSwitcher(
                            duration: Duration(milliseconds: 400),
                            child: !state.isUsdAmount
                                ? SizedBox.shrink()
                                : SizedBox(width: 10.w)),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.5),
                                end: Offset.zero,
                              ).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: Text(
                            state.isUsdAmount
                                ? '${state.aptosAmount} APT'
                                : '\$${state.usdAmount}',
                            key: ValueKey<bool>(!state.isUsdAmount),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Icon(PhosphorIconsRegular.caretUpDown,
                            size: 16.sp, color: AppColors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.greyVeryLight, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    ClipOval(
                        child: Image.asset('assets/icons/aptos.png',
                            height: 36.h)),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aptos',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          '100.21 APT',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue, width: 1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Max',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutQuart,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  _buildRowButtons(['1', '2', '3'], controller),
                  _buildRowButtons(['4', '5', '6'], controller),
                  _buildRowButtons(['7', '8', '9'], controller),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildButton('.', null, controller),
                      _buildButton('0', null, controller),
                      _buildButton(
                          'cancel', PhosphorIconsBold.backspace, controller),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
          showImageRow: false,
          showHoldersRow: false,
          dualButton: false,
          buttonText1: 'Continue',
          buttonColor1: AppColors.black,
          onTap1: () {
            if (isAmountExceeded()) {
              _shakeController.forward().then((_) {
                _shakeController.reverse();
              });
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionView(
                    heading: 'Staking',
                    image: 'assets/icons/staking-default.png',
                    name: _getPoolName(widget.pool),
                    value: state.isUsdAmount
                        ? '\$${state.usdAmount}'
                        : '${state.aptosAmount} APT',
                    onTransactionComplete: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => StakingPoolView()));
                    },
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget _buildRowButtons(
      List<String> items, StakingViewController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items
          .map(
            (e) => _buildButton(e, null, controller),
          )
          .toList(),
    );
  }

  Widget _buildButton(
      String label, IconData? icon, StakingViewController controller) {
    return Expanded(
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          controller.handleButtonPress(label, _triggerShakeAnimation);
        },
        onLongPress: label == 'cancel'
            ? () {
                controller.clearAmount();
              }
            : null,
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 16.w : 8.w,
              vertical: icon == null ? 16.h : 12.h),
          child: icon == null
              ? Center(
                  child: Text(
                    label,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                )
              : Icon(icon, size: 24.sp),
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
          innerDistance: -20.w,
          children: widget.metadata.map<Widget>((meta) {
            return meta['coin_logo_url'].endsWith('.svg')
                ? SvgPicture.network(
                    meta['coin_logo_url'],
                    height: small ? 24.0.h : 44.0.h,
                  )
                : Image.network(
                    meta['coin_logo_url'],
                    height: small ? 24.0.h : 44.0.h,
                  );
          }).toList(),
        );
      } else {
        final logoUrl = widget.metadata is List
            ? widget.metadata.first['coin_logo_url']
            : widget.metadata['coin_logo_url'];
        return logoUrl.endsWith('.svg')
            ? SvgPicture.network(
                logoUrl,
                height: small ? 24.0.h : 44.0.h,
              )
            : Image.network(
                logoUrl,
                height: small ? 24.0.h : 44.0.h,
              );
      }
    } else {
      return Image.asset(
        'assets/icons/staking-default.png',
        height: small ? 24.0.h : 44.0.h,
      );
    }
  }
}
