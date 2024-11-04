import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchlistNFTTab extends StatefulWidget {
  const WatchlistNFTTab({super.key});

  @override
  State<WatchlistNFTTab> createState() => _WatchlistNFTTabState();
}

class _WatchlistNFTTabState extends State<WatchlistNFTTab> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WatchlistGridTile(),
            WatchlistGridTile(),
          ],
        )
      ],
    );
  }
}

class WatchlistGridTile extends StatelessWidget {
  const WatchlistGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.4)
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
                        image: AssetImage("assets/images/aj_avatar.png"),
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
                        image: AssetImage("assets/images/aj_avatar.png"),
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
                        image: AssetImage("assets/images/aj_avatar.png"),
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
                        image: AssetImage("assets/images/aj_avatar.png"),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const Gap(12),
          Text(
            "Cute NFTs🐣",
          ),
          RichText(
              text: TextSpan(
                  text: "6 NFTs",
                  children: [
                    TextSpan(
                        text: "   Jan 2 2024",
                    )]
              )
          )
        ],
      ),
    );
    ;
  }
}
