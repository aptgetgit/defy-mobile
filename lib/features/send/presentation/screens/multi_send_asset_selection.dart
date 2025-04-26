// import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
// import 'package:defy_mobile/src/config/config.dart';
// import 'package:defy_mobile/src/features/transaction/send/domain/models/selectable_item_model.dart';
// import 'package:defy_mobile/src/features/transaction/send/presentation/providers/send_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// import '../components/send_asset_selection_nfts_tab.dart';
// import '../components/send_asset_selection_tab_bar.dart';
// import '../components/send_asset_selection_tokens_tab.dart';

// class MultiSendAssetSelectionScreen<T extends SelectableItem>
//     extends StatefulWidget {
//   final List<T> selectedItems;

//   const MultiSendAssetSelectionScreen({
//     required this.selectedItems,
//     super.key,
//   });

//   @override
//   State<MultiSendAssetSelectionScreen> createState() =>
//       _MultiSendAssetSelectionScreenState<T>();
// }

// class _MultiSendAssetSelectionScreenState<T extends SelectableItem>
//     extends State<MultiSendAssetSelectionScreen> with TickerProviderStateMixin {
//   bool _isSelectionMode = false;
//   bool tileSelected = false;
//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//   }

//   void selectTile() {
//     setState(() {
//       tileSelected = !tileSelected;
//     });
//   }

//   void onTap() {
//     setState(() {
//       _isSelectionMode = !_isSelectionMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
//                     color: Colors.black,
//                     size: 18,
//                   ),
//                   Text(
//                     "Send",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600, fontSize: 20),
//                   ),
//                   Icon(
//                     PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
//                     color: Colors.black,
//                     size: 21,
//                   ),
//                 ],
//               ),
//               const Gap(20),
//               Container(
//                 width: double.infinity,
//                 height: 45,
//                 decoration: BoxDecoration(
//                     color: veryLightGrey,
//                     borderRadius: BorderRadius.circular(60)),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       const Gap(16),
//                       Text(
//                         "To",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       const Gap(20),
//                       RowSuper(
//                         innerDistance: -24,
//                         children: [
//                           ...widget.selectedItems.asMap().entries.map((entry) {
//                             final index = entry.key;
//                             final selectableItem = entry.value;

//                             if (selectableItem is Wallet) {
//                               return Image(
//                                 height: 32,
//                                 width: 32,
//                                 image: AssetImage(selectableItem.asset),
//                               );
//                             } else {
//                               return const SizedBox.shrink();
//                             }
//                           }),
//                         ],
//                       ),
//                       const Gap(4),
//                       Text(
//                         widget.selectedItems.length > 1
//                             ? "${(widget.selectedItems.first as Wallet).walletName} +${widget.selectedItems.length - 1} others"
//                             : (widget.selectedItems.first as Wallet).walletName,
//                         style: TextStyle(fontSize: 16, color: greyLight),
//                       ),
//                       const Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(11.0),
//                         child: Container(
//                           height: 24,
//                           width: 24,
//                           decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(24)),
//                           child: Center(
//                             child: Icon(
//                               PhosphorIcons.plus(PhosphorIconsStyle.bold),
//                               color: Colors.white,
//                               size: 15,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const Gap(18),
//               Expanded(
//                 child: DefaultTabController(
//                   length: 2,
//                   child: Column(
//                     children: [
//                       SendAssetSelectionTabBar(
//                         controller: tabController,
//                         isMulti: true,
//                         isSelectionMode: _isSelectionMode,
//                         onTap: onTap,
//                       ),
//                       Expanded(
//                         child: TabBarView(
//                           children: ['Tokens', 'NFTs'].map((t) {
//                             if (t == "Tokens") {
//                               return SendAssetSelectionTokensTab(
//                                 tokens: [],
//                                 selectedToItems: widget.selectedItems,
//                                 isSelectionMode: _isSelectionMode,
//                               );
//                             } else {
//                               return const SendAssetSelectionNFTsTab(nfts: []);
//                             }
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
