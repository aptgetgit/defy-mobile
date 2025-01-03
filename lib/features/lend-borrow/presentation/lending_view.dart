import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/shared/presentation/widgets/black_button.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:defy_graphql/defy_graphql.dart';
import 'package:defy/features/lend-borrow/domain/entities/lend_pool_entity.dart';
import 'package:defy/features/lend-borrow/presentation/lending_details_view.dart';
import 'package:defy/features/lend-borrow/provider/lend_pool_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LendBorrowView extends ConsumerStatefulWidget {
  const LendBorrowView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LendBorrowViewState();
}

class _LendBorrowViewState extends ConsumerState<LendBorrowView> {
  Map<String, dynamic>? coinsMetadata;
  bool light = false;

  @override
  void initState() {
    super.initState();
    _fetchCoinsMetadata();
  }

  Future<void> _fetchCoinsMetadata() async {
    final client = ref.read(defyGraphQlClientProvider);
    final lendPools = await ref.read(getLendPoolsProvider.future);

    lendPools.fold(
      (error) => AppLogger.error('Error fetching lend pools: $error'),
      (pools) async {
        final coinIdList =
            pools.values.map((pool) => pool?.marketCoin ?? '').toList();
        final metadata = await getCoinsMetaData(client, coinIdList);
        setState(() {
          coinsMetadata = metadata;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lendPoolsAsyncValue = ref.watch(getLendPoolsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(PhosphorIconsBold.caretLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Lend',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsFill.handCoins, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Normal',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Isolated',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        PhosphorIconsBold.trendUp,
                        color: AppColors.greyLight,
                        size: 16.h,
                      ),
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        PhosphorIconsBold.funnelSimple,
                        color: AppColors.greyLight,
                        size: 16.h,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'E-mode',
                      style: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        trackOutlineWidth: WidgetStateProperty.all(1),
                        trackOutlineColor: light
                            ? WidgetStateProperty.all(
                                AppColors.blue.withOpacity(0.1),
                              )
                            : WidgetStateProperty.all(AppColors.grey),
                        inactiveThumbColor: AppColors.greyLight,
                        value: light,
                        activeColor: AppColors.blue,
                        onChanged: (bool value) {
                          if (!light && value) {
                            _showEModeDialog();
                          } else {
                            setState(() {
                              light = value;
                            });
                          }
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Earn APY',
                      style: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              lendPoolsAsyncValue.when(
                data: (eitherResult) {
                  return eitherResult.fold(
                    (error) => Text('Error: ${error.message}'),
                    (lendPools) => ListView.builder(
                      itemExtent: 68.h,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lendPools.length,
                      itemBuilder: (context, index) {
                        final entry = lendPools.entries.elementAt(index);
                        final pool = entry.value;
                        return _buildLendPoolTile(context, pool);
                      },
                    ),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        height: 92.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('\$4.12B',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 4.h),
              Text('Total Lent >',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('5.23%',
                  style: TextStyle(
                      color: AppColors.greenLight,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 4.h),
              Text('Net APY',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('5.23%',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 4.h),
              Text('Net LTV',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ]),
      ),
    );
  }

  void _showEModeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Efficiency Mode',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Enabling E-Mode increases the LTV for a selected category of assets.',
                  style: TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      'Select Category',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: _showSelectCategoryDialog,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'APT Collateral',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              PhosphorIconsBold.caretDown,
                              color: AppColors.grey,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      light = true;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(45)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16),
                      child: Center(
                        child: Text(
                          'Enable Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSelectCategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Category',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildCategoryOption(
                    'APT Collateral', 'APT, stAPT, sthAPT, tAPT', true),
                _buildCategoryOption(
                    'Stablecoins', 'USDC, USDT, DAI, MOD', false),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(45)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.h, vertical: 16),
                      child: Center(
                        child: Text(
                          'Enable Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryOption(String title, String subTitle, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          if (isSelected) CustomCheckbox(isChecked: isSelected)
        ],
      ),
    );
  }

  Widget _buildLendPoolTile(BuildContext context, LendPoolEntity pool) {
    final coinMetadata = coinsMetadata?['coins']?.firstWhere(
      (coin) => coin['coin_id'] == pool.marketCoin,
      orElse: () => null,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LendingDetailsView(selectedTile: pool),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: coinMetadata != null
              ? coinMetadata['coin_logo_url'].toString().endsWith('.svg')
                  ? SvgPicture.network(
                      coinMetadata['coin_logo_url'] ?? '',
                      height: 44,
                      width: 44,
                      placeholderBuilder: (context) => Image.asset(
                          'assets/icons/aptos.png',
                          height: 44,
                          width: 44),
                    )
                  : Image.network(
                      coinMetadata['coin_logo_url'] ?? '',
                      height: 44,
                      width: 44,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                          'assets/icons/aptos.png',
                          height: 44,
                          width: 44),
                    )
              : Image.asset('assets/icons/aptos.png', height: 44, width: 44),
          title: Text(
            coinMetadata?['coin_name'] ?? pool.assetName ?? 'Unknown',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            '${formatNumber(double.tryParse(pool.borrowCap ?? '') ?? 0)} LTV',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Text('${((pool.supplyApr ?? 0) * 100).toStringAsFixed(1)}%',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  String formatNumber(double number) {
    if (number >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(1)}B';
    } else if (number >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(1)}M';
    } else if (number >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(1)}K';
    } else {
      return NumberFormat('#,##0.00').format(number);
    }
  }
}

Future<Map<String, dynamic>?> getCoinsMetaData(
    GraphQLClient client, List<String> coinIdList) async {
  final QueryOptions options = QueryOptions(
    document: documentNodeQueryFetchCoinMetadata,
    variables: {
      "coin_id_list": coinIdList,
    },
  );
  final QueryResult result = await client.query(options);

  if (result.hasException) {
    AppLogger.error('GraphQL error: ${result.exception}');
    return null;
  }

  var responseBody = result.data;
  return responseBody;
}
