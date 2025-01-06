import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/shared/presentation/widgets/custom_search_bar.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'package:phosphor_flutter/phosphor_flutter.dart';


class NFTMarketplaceDropsTab extends StatefulWidget {
  const NFTMarketplaceDropsTab({super.key});

  @override
  State<NFTMarketplaceDropsTab> createState() => _NFTMarketplaceDropsTabState();
}

class _NFTMarketplaceDropsTabState extends State<NFTMarketplaceDropsTab> {
  int tabIndex = 0;

  void changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchBar(),
        const Gap(30),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/Drop-Tab-Slider.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white.withOpacity(0.24)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIcons.sparkle(PhosphorIconsStyle.fill),
                            color: AppColors.greenDark,
                            size: 20,
                          ),
                          const Gap(4),
                          Text(
                            "Minting",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/Nft-Placeholder.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "Get Minecrafts",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              "By Jerrold",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            const Gap(2),
                            const Image(
                              height: 18,
                              width: 18,
                              image:
                                  AssetImage("assets/images/White-Check.png"),
                            ),
                          ],
                        ),
                        Text(
                          "Open edition 0.22 APT",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(
                          "View Drop",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Gap(20),
        Wrap(
          spacing: MediaQuery.of(context).size.width *
              0.05, // gap between adjacent chips
          runSpacing: 24.0, // gap between lines
          children: [
             NFTCard(
              description: null,
              discordUrl: null,
              websiteUrl: null,
              twitterUrl: null,
              // collectionInfo: null,
              // listings: null,
              imageUrl: '',
              nftName: 'Cyberpunk Kid #68',
              collectionName: 'Chum Chum NFT',
              price: 100000000,
            ),
            NFTCard(
              description: null,
              discordUrl: null,
              websiteUrl: null,
              twitterUrl: null,
              // collectionInfo: null,
              // listings: null,
              imageUrl: '',
              nftName: 'Cyberpunk Kid #68',
              collectionName: 'Chum Chum NFT',
              price: 100000000,
            ), NFTCard(
              description: null,
              discordUrl: null,
              websiteUrl: null,
              twitterUrl: null,
              // collectionInfo: null,
              // listings: null,
              imageUrl: '',
              nftName: 'Cyberpunk Kid #68',
              collectionName: 'Chum Chum NFT',
              price: 100000000,
            ),
          ],
        )
      ],
    );
  }
}
