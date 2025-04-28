import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nft_hero_card.dart';

class NFTHeroCarousel extends StatefulWidget {
  const NFTHeroCarousel({Key? key}) : super(key: key);

  @override
  State<NFTHeroCarousel> createState() => _NFTHeroCarouselState();
}

class _NFTHeroCarouselState extends State<NFTHeroCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoSwipeTimer;

  @override
  void initState() {
    super.initState();
    // Start at the middle card (index 1)
    _pageController = PageController(
      viewportFraction: 0.85,
      initialPage: 1,
    );

    // Auto-swipe timer
    _autoSwipeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % 3;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSwipeTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .20,
      child: PageView(
        controller: _pageController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const NFTHeroCard(
              imagePath: 'assets/images/explore_nft.png',
              iconPath: 'assets/images/Nft-Placeholder.png',
              title: 'Spiderman',
              subtitle: 'Floor: 7.23 APT',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const NFTHeroCard(
              imagePath: 'assets/images/explore_nft.png',
              iconPath: 'assets/images/Nft-Placeholder.png',
              title: 'Batman',
              subtitle: 'Floor: 5.10 APT',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const NFTHeroCard(
              imagePath: 'assets/images/explore_nft.png',
              iconPath: 'assets/images/Nft-Placeholder.png',
              title: 'Wonder Woman',
              subtitle: 'Floor: 8.99 APT',
            ),
          ),
        ],
      ),
    );
  }
}