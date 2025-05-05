import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_tab_bar.dart';

class NFTDetailScreen extends StatefulWidget {
  const NFTDetailScreen({super.key});

  @override
  State<NFTDetailScreen> createState() => _NFTDetailScreenState();
}

class _NFTDetailScreenState extends State<NFTDetailScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 220.h,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                    stops: const [0.7, 1.0],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  'https://picsum.photos/800/1200',
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 200.h,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 200.h,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: NetworkImage('https://picsum.photos/800/1200'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'NFT Title',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      const Text(
                                        'Created by @artist',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.star_border, size: 24, color: AppColors.greyDark),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.more_vert, size: 24, color: AppColors.greyDark),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(16.h),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'Description of the NFT goes here. You can add more details about ',
                                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              TextSpan(
                                text: 'more',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        
                        Transform.translate(
                          offset: Offset(0, -30.h),
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 4.0,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 20.w,
                            children: [
                              _buildStatItem(
                                icon: Icons.account_balance_wallet_outlined,
                                label: 'Total Volume',
                                value: '5 ETH',
                              ),
                              _buildStatItem(
                                icon: Icons.local_offer_outlined,
                                label: 'Floor Price',
                                value: '0.0023 ETH',
                              ),
                              _buildStatItem(
                                icon: Icons.star_border_outlined,
                                label: 'Best Offer',
                                value: '--',
                              ),
                              _buildStatItem(
                                icon: Icons.arrow_downward,
                                label: 'See more',
                                value: '',
                                iconColor: Colors.green,
                                backgroundColor: Colors.green.withOpacity(0.1),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -30.h),
                          child: CustomTabBar(
                            tabController: _tabController,
                            tabs: const ['Items', 'Activity', 'Analytics'],
                            withPositionedIndicator: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -30.h),
                          child: SizedBox(
                            height: 550.h,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildItemsTabContent(),
                                Center(
                                  child: Text(
                                    'Activity content goes here',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Analytics content goes here',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildItemsTabContent() {
    final List<NFTItemData> nftItems = List.generate(
      6, 
      (index) => NFTItemData(
        id: 'NFT #${index + 1}',
        imageUrl: 'assets/images/nft_image1.png',
        price: '0.${(index + 1) * 5} ETH',
      ),
    );
    
    return Padding(
      padding: EdgeInsets.symmetric( vertical: 4.h),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 250.h,
        ),
        itemCount: nftItems.length,
        itemBuilder: (BuildContext context, int index) {
          final NFTItemData nft = nftItems[index];
          return NFTItemCard(nft: nft);
        },
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    Color iconColor = Colors.grey,
    Color backgroundColor = const Color(0xFFF5F5F5),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
        ),
        Gap(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NFTItemData {
  final String id;
  final String imageUrl;
  final String price;

  NFTItemData({
    required this.id,
    required this.imageUrl,
    required this.price,
  });
}

class NFTItemCard extends StatelessWidget {
  const NFTItemCard({
    required this.nft,
    super.key,
  });

  final NFTItemData nft;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      print('Tapped on NFT: ${nft.id}');
    },
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            nft.imageUrl,
            width: 168.h,
            height: 168.h,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 168.h,
                height: 168.h,
                color: Colors.grey[300],
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[500],
                    size: 40.r,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nft.id,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Gap(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Floor',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyLight,
                    ),
                  ),
                  Gap(6.w),
                  Text(
                    nft.price,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}