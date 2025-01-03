import 'dart:ui';

import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/screens/nft_collections_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTCollectionItemDetailHeader extends StatelessWidget {
  final String? imageUrl;
  final String? nftName;

  const NFTCollectionItemDetailHeader({
    Key? key,
    required this.imageUrl,
    required this.nftName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300, // Adjust this value as needed
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          image: imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!) as ImageProvider
              : const AssetImage("assets/images/Cyborg.png") as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.star, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}