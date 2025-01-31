// import 'package:defy/core/extensions/context_extensions.dart';
// import 'package:defy/core/logging/app_logger.dart';
// import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
// import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_cart_notifier.dart';
// import 'package:defy/features/marketplace/presentation/screens/nft_collection_item_detail_screen.dart';
// import 'package:defy/features/marketplace/presentation/screens/nft_marketplace_details_screen.dart';
// import 'package:defy/features/mint/presentation/nft_mint_details_view.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'dart:math' as math;

// class NFTCard extends ConsumerStatefulWidget {
//   final bool isCollectionItem;
//   String imageUrl;
//   final String nftName;
//   final String collectionName;
//   final int price;
//   final String? description;
//   final String? discordUrl;
//   final String? twitterUrl;
//   final String? websiteUrl;
//   final bool? nonRedirecting;
//   final bool? showCartButton;
//   final bool isMint;
//   final String? collectionImageUrl;
//   NFTCard({
//     super.key,
//     this.isMint = false,
//     this.isCollectionItem = false,
//     required this.imageUrl,
//     required this.nftName,
//     required this.collectionName,
//     required this.price,
//     required this.description,
//     required this.discordUrl,
//     required this.twitterUrl,
//     required this.websiteUrl,
//     this.collectionImageUrl,
//     this.nonRedirecting = false,
//     this.showCartButton = true,
//   });

//   @override
//   ConsumerState<NFTCard> createState() => _NFTCardState();
// }

// class _NFTCardState extends ConsumerState<NFTCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 100),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _toggleCart() {
//     final cartNotifier = ref.read(cartNotifierProvider.notifier);
//     final cartNFT = NFTMarketplaceCartEntity(
//       name: widget.nftName,
//       mediaUrl: widget.imageUrl,
//       collectionName: widget.collectionName,
//       price: widget.price,
//     );

//     if (cartNotifier.isInCart(cartNFT)) {
//       cartNotifier.removeFromCart(cartNFT);
//     } else {
//       cartNotifier.addToCart(cartNFT);
//     }
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     widget.imageUrl =
//         widget.imageUrl.replaceAll('ipfs://', 'https://ipfs.io/ipfs/');

//     final cartNotifier = ref.watch(cartNotifierProvider.notifier);
//     final cartNFT = NFTMarketplaceCartEntity(
//       name: widget.nftName,
//       mediaUrl: widget.imageUrl,
//       collectionName: widget.collectionName,
//       price: widget.price,
//     );
//     final isInCart = cartNotifier.isInCart(cartNFT);
//     return GestureDetector(
//       onTap: () {
//         if (widget.isCollectionItem) {
//           print('collection item tapped');
//           Navigator.of(context).push(
//             MaterialPageRoute(
//                 builder: (context) => NFTCollectionItemDetailScreen(
//                     collectionImageUrl: widget.collectionImageUrl,
//                     discordUrl: widget.discordUrl,
//                     twitterUrl: widget.twitterUrl,
//                     websiteUrl: widget.websiteUrl,
//                     description: widget.description,
//                     imageUrl: widget.imageUrl,
//                     nftName: widget.nftName)),
//           );
//           // )
//           // NFTCollectionsItemDetailScreenRoute(
//           //         // collectionInfo: widget.collectionInfo,
//           //         // listings: widget.listings,
//           //         discordUrl: widget.discordUrl,
//           //         twitterUrl: widget.twitterUrl,
//           //         websiteUrl: widget.websiteUrl,
//           //         description: widget.description,
//           //         imageUrl: widget.imageUrl,
//           //         nftName: widget.nftName)
//           //     .push(context);
//         } else if (widget.nonRedirecting == true) {
//           null;
//         } else if (widget.isMint) {
//           AppLogger.debug('NFT Mint Card Tapped');
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => NFTMintDetailsView(),
//             ),
//           );
//         } else {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => NFTMarketplaceDetailsScreen(),
//             ),
//           );
//           // NFTMarketplaceDetailsScreenRoute().push(context);
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 160,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               image: DecorationImage(
//                 image: widget.imageUrl.isNotEmpty
//                     ? NetworkImage(widget.imageUrl) as ImageProvider<Object>
//                     : AssetImage("assets/images/cyborg.png")
//                         as ImageProvider<Object>,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const Gap(6),
//           SizedBox(
//             height: 20,
//             child: Text(
//               widget.nftName,
//               style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           const Gap(2),
//           // Text(
//           //   widget.collectionName,
//           //   style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
//           //   maxLines: 1,
//           //   overflow: TextOverflow.ellipsis,
//           // ),
//           // const Gap(4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '${getPriceInAPT(widget.price).toStringAsFixed(2)} APT',
//                 style: context.bodyLarge.copyWith(fontWeight: FontWeight.w600),
//               ),
//               if (widget.showCartButton == true)
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: _toggleCart,
//                       child: AnimatedBuilder(
//                         animation: _animation,
//                         builder: (context, child) {
//                           return Transform.scale(
//                             scale: _animation.value,
//                             child: child,
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.8),
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             isInCart
//                                 ? PhosphorIconsFill.shoppingCart
//                                 : PhosphorIconsRegular.shoppingCart,
//                             size: 16,
//                             color: isInCart ? Colors.black : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   double getPriceInAPT(int price) {
//     return price / math.pow(10, 8);
//   }
// }
