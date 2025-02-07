import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchlistGridTile extends StatelessWidget {
  const WatchlistGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to WatchListNFTScreen
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 30, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage("assets/images/watchlist1.png"),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 30, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage("assets/images/watchlist2.png"),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 30, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage("assets/images/watchlist3.png"),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 30, top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage("assets/images/watchlist4.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Text(
            "Avatar NFTs🐣",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "6 NFTs",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: "   Jan 2 2024",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}