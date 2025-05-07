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
  final int _totalCards = 3;
  
  // This large number helps create the infinite scroll illusion
  final int _virtualItemCount = 10000; 

  @override
  void initState() {
    super.initState();
    // Start from the middle to allow scrolling both directions infinitely
    final initialPage = (_virtualItemCount ~/ 2);
    
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
    
    _currentPage = initialPage % _totalCards;

    // Auto-swipe timer
    _autoSwipeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _pageController.page!.toInt() + 1,
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
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page % _totalCards;
          });
        },
        itemCount: _virtualItemCount,
        itemBuilder: (context, index) {
          // Map the virtual index to actual item index (0, 1, 2)
          final actualIndex = index % _totalCards;
          
          return AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: _currentPage == actualIndex ? 0 : 10, // Add vertical spacing for non-active cards
            ),
            child: _buildNFTCard(actualIndex),
          );
        },
      ),
    );
  }

  Widget _buildNFTCard(int index) {
    // Define the card data
    final List<Map<String, String>> cardData = [
      {
        'title': 'Spiderman',
        'subtitle': 'Floor: 7.23 APT',
      },
      {
        'title': 'Batman',
        'subtitle': 'Floor: 5.10 APT',
      },
      {
        'title': 'Wonder Woman',
        'subtitle': 'Floor: 8.99 APT',
      },
    ];

    return NFTHeroCard(
      imagePath: 'assets/images/explore_nft.png',
      iconPath: 'assets/images/Nft-Placeholder.png',
      title: cardData[index]['title'] ?? '',
      subtitle: cardData[index]['subtitle'] ?? '',
    );
  }
}