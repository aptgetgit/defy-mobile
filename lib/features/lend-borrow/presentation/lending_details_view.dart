import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/lend-borrow/presentation/lending_chart.dart';
import 'package:defy/features/shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:defy/features/lend-borrow/domain/entities/lend_pool_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:defy_graphql/defy_graphql.dart';

class LendingDetailsView extends ConsumerStatefulWidget {
  final LendPoolEntity selectedTile;
  const LendingDetailsView({
    super.key,
    required this.selectedTile,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LendingDetailsViewState();
}

class _LendingDetailsViewState extends ConsumerState<LendingDetailsView> {
  Map<String, dynamic>? coinMetadata;
  late ScrollController _scrollController;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _fetchCoinMetadata();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchCoinMetadata() async {
    final client = ref.read(defyGraphQlClientProvider);
    final metadata =
        await getCoinsMetaData(client, [widget.selectedTile.marketCoin ?? '']);
    if (metadata != null &&
        metadata['coins'] != null &&
        metadata['coins'].isNotEmpty) {
      setState(() {
        coinMetadata = metadata['coins'][0];
      });
    }
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
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: _buildBody(context),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Supply',
        buttonColor1: AppColors.black,
        onTap1: () {},
        showHoldersRow: true,
        showImageRow: true,
        image1: 'rocket.png',
        image2: 'rocket.png',
        image3: 'rocket.png',
        headerText: 'James, Jane and 14+ hold',
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180.h,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(PhosphorIconsBold.caretLeft, color: Colors.black),
      ),
      title: AnimatedOpacity(
        opacity: _showTitle ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Row(
          children: [
            _buildCoinImage(),
            const SizedBox(width: 10),
            Text(
              coinMetadata?['coin_defyapp_symbol'] ?? 'Unknown',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 56.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCoinImage(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      coinMetadata?['coin_defyapp_symbol'] ?? 'Unknown',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${((widget.selectedTile.supplyApr ?? 0) * 100).toStringAsFixed(2)}% APR',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.greenLight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  '25k+ users',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final pool = widget.selectedTile;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LendingChart(),
          const SizedBox(height: 30),
          _buildGeneralSection(pool),
          const SizedBox(height: 30),
          _buildDetailsSection(pool),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildGeneralSection(LendPoolEntity pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildInfoTile(
                icon: PhosphorIconsRegular.drop,
                title: formatNumber(
                    double.tryParse(pool.totalReserve ?? '0') ?? 0),
                subtitle: 'Total Reserve',
              ),
            ),
            Expanded(
              child: _buildInfoTile(
                icon: PhosphorIconsRegular.arrowElbowRight,
                title: '${((pool.borrowApr ?? 0) * 100).toStringAsFixed(2)}%',
                subtitle: 'Borrow APR',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildInfoTile(
                icon: PhosphorIconsRegular.drop,
                title: formatNumber(
                    double.tryParse(pool.totalReserve ?? '0') ?? 0),
                subtitle: 'Total Reserve',
              ),
            ),
            Expanded(
              child: _buildInfoTile(
                icon: PhosphorIconsRegular.arrowElbowRight,
                title: '${((pool.borrowApr ?? 0) * 100).toStringAsFixed(2)}%',
                subtitle: 'Borrow APR',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailsSection(LendPoolEntity pool) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetailItem(
                '${((pool.supplyApr ?? 0) * 100).toStringAsFixed(2)}%',
                'Supply APR'),
            _buildDetailItem(
                formatNumber(double.tryParse(pool.totalShares ?? '0') ?? 0),
                'Total Shares'),
            _buildDetailItem(
                pool.collateralFactorBps ?? 'N/A', 'Collateral Factor'),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetailItem(pool.assetMantissa ?? 'N/A', 'Asset Mantissa'),
            _buildDetailItem(
                pool.efficiencyModeId?.toString() ?? 'N/A', 'Efficiency Mode'),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }

  Widget _buildCoinImage() {
    if (coinMetadata != null && coinMetadata!['coin_logo_url'] != null) {
      return coinMetadata!['coin_logo_url'].toString().endsWith('.svg')
          ? SvgPicture.network(
              coinMetadata!['coin_logo_url'],
              height: 35,
              width: 35,
              placeholderBuilder: (context) =>
                  const Icon(Icons.money, size: 35),
            )
          : Image.network(
              coinMetadata!['coin_logo_url'],
              height: 35,
              width: 35,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.money, size: 35),
            );
    } else {
      return const Icon(Icons.money, size: 35);
    }
  }

  Widget _buildInfoTile(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(icon, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ],
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
