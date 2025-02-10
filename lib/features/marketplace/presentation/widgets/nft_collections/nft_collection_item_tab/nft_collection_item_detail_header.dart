
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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