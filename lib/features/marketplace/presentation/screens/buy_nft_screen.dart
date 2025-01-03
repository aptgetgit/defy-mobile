import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/shared/presentation/widgets/custom_swipe_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'dart:math' as math;

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuyNFTScreen extends StatefulWidget {
  final List<NFTMarketplaceCartEntity> nfts;

  const BuyNFTScreen({Key? key, required this.nfts}) : super(key: key);

  @override
  _BuyNFTScreenState createState() => _BuyNFTScreenState();
}

class _BuyNFTScreenState extends State<BuyNFTScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  late Animation<double> _animation;
  late AnimationController _animationController;
  Timer? _autoScrollTimer;
  final int _autoScrollDuration = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer =
        Timer.periodic(Duration(seconds: _autoScrollDuration), (timer) {
      if (_currentPage < widget.nfts.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  void _resetAutoScroll() {
    _stopAutoScroll();
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Buy NFT',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsRegular.shoppingCart,
                color: Colors.black),
            onPressed: () {
              // Implement cart action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildNFTCarousel(),
            const SizedBox(height: 16),
            _buildTopContainer(),
            const SizedBox(height: 16),
            _buildStatContainers('210.12', '+2.12%'),
            const SizedBox(height: 16),
            _buildBuyerInfo(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                'Total Cost',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Gap(100),
            Row(
              children: [
                const Text(
                  '550.10',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/icons/aptos-logo.png',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(
          color: Color(0xffE5E5E5),
          thickness: 1,
        ),
        const SizedBox(height: 8),
        if (widget.nfts.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.nfts.length} Items',
                style: const TextStyle(
                  color: Color(0xff979DAA),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: widget.nfts.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  type: WormType.thin,
                  activeDotColor: AppColors.blue,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ],
          )
      ],
    );
  }

  Widget _buildTopContainer() {
    final currentNFT = widget.nfts[_currentPage];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Details',
          style: TextStyle(
            color: Color(0xff979daa),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: currentNFT.mediaUrl!
                          .replaceAll('ipfs://', 'https://ipfs.io/ipfs/') ??
                      '',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentNFT.name ?? 'Unnamed NFT',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(currentNFT.collectionName ?? 'Unnamed Collection',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xff979DAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text('0.23',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(width: 4),
                      Image.asset('assets/icons/aptos-logo.png',
                          width: 16, height: 16),
                    ],
                  ),
                  const Text('Floor ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff979DAA),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNFTCarousel() {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return PageView.builder(
            controller: _pageController,
            itemCount: widget.nfts.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    imageUrl: widget.nfts[index].mediaUrl
                            ?.replaceAll('ipfs://', 'https://ipfs.io/ipfs/') ??
                        '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildStatContainers(String boughtPrice, String sellingPrice) {
    return Row(
      children: [
        Expanded(
            child: _buildStatContainer(
                'Buying For', '$boughtPrice\$', PhosphorIconsBold.money)),
        const SizedBox(width: 16),
        Expanded(
            child: _buildStatContainer(
                'Floor Change', '$sellingPrice\$', PhosphorIconsBold.coin)),
      ],
    );
  }

  Widget _buildStatContainer(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xff979daa)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(title,
                    style: const TextStyle(
                        color: Color(0xff979daa),
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyerInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar-1.png'),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mutual Holders',
                  style: TextStyle(
                      color: Color(0xff979DAA),
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Text('James, Jane ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Text('+2 others hold',
                      style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xffF4F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/upi.png',
                            width: 32,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pay Using',
                                    style: TextStyle(
                                        color: Color(0xff979daa),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 4),
                                Text('maharsi@upi',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Buy 20.79',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
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

  Widget _buildPaymentOptions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pay Using', style: Theme.of(context).textTheme.labelLarge),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text('UPI', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Icon(PhosphorIconsRegular.caretDown, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: CustomSwipeButton(
        onSwipeCompleted: () {
          // Handle swipe completion
          print('Swipe completed');
        },
      ),
    );
  }

  double getPriceInAPT(int price) {
    return price / math.pow(10, 8);
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
