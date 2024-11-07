import 'dart:math';

import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchlistCollectionTile extends StatelessWidget {
  const WatchlistCollectionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.42,
            height: MediaQuery.of(context).size.width * 0.42,
            decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4)
            ),
            child: OverlappingImagesWidget(
              imageUrls : [
                "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
                "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
              ],
            )
          ),
          const Gap(12),
          Text(
            "Cute NFTs🐣",
          ),
          RichText(
              text: TextSpan(
                  text: "6 NFTs",
                  style: TextStyle(fontSize:14,fontWeight: FontWeight.w700,color: AppColors.grey),
                  children: [
                    TextSpan(
                        text: "   Jan 2 2024",
                    ),],
              )
          )
        ],
      ),
    );
  }
}

class OverlappingImagesWidget extends StatelessWidget {
  final List<String> imageUrls;

  OverlappingImagesWidget({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    int imageCount = imageUrls.length;

    // Define size and overlap factor
    double imageSize = 50;
    double overlapFactor = 0.3; // Adjust this to control overlap intensity

    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          // Layout for 1-4 images in a basic square layout
          if (imageCount <= 4)
            ...List.generate(imageCount, (index) {
              double offset = index * imageSize * overlapFactor;
              return Positioned(
                left: (index % 2) * offset,
                top: (index ~/ 2) * offset,
                child: buildImage(imageUrls[index], imageSize),
              );
            }),

          // Layout for 5 or more images in a circular pattern
          if (imageCount > 4)
            ...List.generate(imageCount, (index) {
              double angle = (2 * pi / imageCount) * index;
              double radius = 40 + (index / imageCount) * 20; // Expand with more images
              return Positioned(
                left: radius * cos(angle) + 50,  // Center and offset
                top: radius * sin(angle) + 50,   // Center and offset
                child: buildImage(imageUrls[index], imageSize),
              );
            }),
        ],
      ),
    );
  }

  Widget buildImage(String url, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

