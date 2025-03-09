import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchlistCuteTile extends StatelessWidget {
  const WatchlistCuteTile({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        // Navigate to WatchListNFTScreen
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 30, bottom: 30),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist1.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 30, bottom: 30),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist2.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 30, top: 20),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist3.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 30, top: 20),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist4.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 15, top: 40),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist1.png'),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(left: 15, top: 40),
                    child: const Center(
                      child: Image(
                        height: 36,
                        width: 36,
                        image: AssetImage('assets/images/watchlist3.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Cute NFTs🐣',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(6),
              Container(
                width: 16.25,
                height: 16.25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child:  Icon(
                  PhosphorIcons.minus(PhosphorIconsStyle.bold),
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: '6 NFTs',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: '   Jan 2 2024',
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
