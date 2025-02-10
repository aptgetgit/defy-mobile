import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../components/nft_marketplace_nft_tab.dart';


class NFTMarketplaceScreen extends StatefulWidget {
  const NFTMarketplaceScreen({super.key});

  @override
  State<NFTMarketplaceScreen> createState() => _NFTMarketplaceScreenState();
}

class _NFTMarketplaceScreenState extends State<NFTMarketplaceScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
        title: const Text(
          'NFT Marketplace',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black,),
        ),
        actions: <Widget>[
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
