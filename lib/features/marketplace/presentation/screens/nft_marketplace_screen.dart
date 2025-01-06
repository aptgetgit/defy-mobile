import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/components/nft_marketplace_drops_tab.dart';
import 'package:defy/features/marketplace/presentation/components/nft_marketplace_nft_tab.dart';
import 'package:defy/features/marketplace/presentation/components/vault_list_tab.dart';
import 'package:defy/features/marketplace/presentation/widgets/nft_marketplace/carousel_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import 'package:phosphor_flutter/phosphor_flutter.dart';


class NFTMarketplaceScreen extends StatefulWidget {
  const NFTMarketplaceScreen({super.key});

  @override
  State<NFTMarketplaceScreen> createState() => _NFTMarketplaceScreenState();
}

class _NFTMarketplaceScreenState extends State<NFTMarketplaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            PhosphorIconsBold.caretLeft,
            color: AppColors.greyDark,
          ),
        ),
        centerTitle: true,
        title: Text(
          "NFT Marketplace",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              PhosphorIconsBold.coin,
              color: AppColors.greyDark,
            ),
          ),
          const Gap(16),
        ],
      ),
      body: const NFTMarketplaceNFTTab(),
    );
  }
}
