import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getNftAsset({
  required BuildContext context,
  required String? imageUrl,
  required bool isTitle,
}) {
  final width = MediaQuery.of(context).size.width;
  final double imageSize = isTitle ? width * .11 : width * .5;

  if (imageUrl == null) {
    return CircleAvatar(radius: imageSize / 2, backgroundColor: Colors.amber);
  }

  imageUrl = imageUrl.replaceAll('ipfs://', 'https://ipfs.io/ipfs/');

  return ClipRRect(
    borderRadius: BorderRadius.circular(12.0),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      width: imageSize,
      height: imageSize,
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        width: imageSize,
        height: imageSize,
        color: Colors.grey[300],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (ctx, url, error) => Container(
        width: imageSize,
        height: imageSize,
        color: Colors.amber,
        child: const Icon(Icons.error),
      ),
      memCacheWidth:
          (imageSize * MediaQuery.of(context).devicePixelRatio).round(),
      memCacheHeight:
          (imageSize * MediaQuery.of(context).devicePixelRatio).round(),
    ),
  );
}
