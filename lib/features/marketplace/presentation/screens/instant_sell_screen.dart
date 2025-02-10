import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_swipe_button.dart';
import '../../domain/entities/wallet_inventory_entity.dart';

class InstantSellScreen extends StatefulWidget {
  final List<NFTEntity> nfts;

  const InstantSellScreen({super.key, required this.nfts});

  @override
  _InstantSellScreenState createState() => _InstantSellScreenState();
}

class _InstantSellScreenState extends State<InstantSellScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double boughtPrice = 210.12;
    double sellingPrice = 2112.12;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(PhosphorIconsBold.caretLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Instant Sell',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsBold.tag),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildNFTCarousel(),
            const SizedBox(height: 20),
            _buildTopContainer(),
            const SizedBox(height: 10),
            _buildStatContainers(boughtPrice, sellingPrice),
            // const SizedBox(height: 20),
            // _buildProfitText(boughtPrice, sellingPrice),
            const Spacer(),
            _buildSwipeButton(),
          ],
        ),
      ),
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
                'Total PnL',
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
                  '+550.10',
                  style: TextStyle(
                      color: AppColors.greenDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/icons/aptos.png',
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

  Widget _buildNFTCarousel() {
    return AspectRatio(
      aspectRatio: 1.1,
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
                    fit: BoxFit.fill,
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
                    Text(currentNFT.collection.title ?? 'Unnamed Collection',
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
                      Text('0.23',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(width: 4),
                      Image.asset('assets/icons/aptos.png',
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

  Widget _buildStatContainers(double boughtPrice, double sellingPrice) {
    return Row(
      children: [
        Expanded(
            child: _buildStatContainer(
                'Bought At', '$boughtPrice\$', PhosphorIconsBold.shoppingCart)),
        const SizedBox(width: 16),
        Expanded(
            child: _buildStatContainer(
                'Selling At', '$sellingPrice\$', PhosphorIconsBold.tag)),
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

  // Widget _buildProfitText(double boughtPrice, double sellingPrice) {
  //   double difference = sellingPrice - boughtPrice;
  //   bool isProfit = difference >= 0;
  //   double absDifference = difference.abs();

  //   String message;
  //   TextStyle style;

  //   if (isProfit) {
  //     message = 'Congratulations! Your profit will be ';
  //     style = NunitoFont.of().SubHeadingBold.copyWith(color: Colors.black);
  //   } else {
  //     message = 'BRUHHH! Your losses would be ';
  //     style = NunitoFont.of().SubHeadingBold.copyWith(color: Colors.black);
  //   }

  //   return RichText(
  //     text: TextSpan(
  //       style: style,
  //       children: [
  //         TextSpan(text: message),
  //         TextSpan(
  //           text: isProfit ? '$absDifference APT' : '\$$absDifference',
  //           style: style.copyWith(
  //             color: isProfit ? Colors.green : Colors.red,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSwipeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: CustomSwipeButton(
        onSwipeCompleted: () {
          // Handle swipe completion
          print('Swipe completed');
        },
      ),
    );
  }
}
