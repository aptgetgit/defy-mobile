// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:defy_mobile/src/core/core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

// class ReceivingNFTScreen extends StatefulWidget {
//   const ReceivingNFTScreen({super.key});

//   @override
//   State<ReceivingNFTScreen> createState() => _ReceivingNFTScreenState();
// }

// class _ReceivingNFTScreenState extends State<ReceivingNFTScreen> {
//   bool enabled = false;
//   @override
//   Widget build(BuildContext context) {
//     final appFont = context.appFont;
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () => context.pop(),
//           child: const Icon(PhosphorIconsBold.caretLeft),
//         ),
//         title: const Text('Receiving NFT'),
//         centerTitle: true,
//         titleTextStyle: appFont.SubHeadingSemibold,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             ListTile(
//               splashColor: transparentColor,
//               contentPadding: EdgeInsets.zero,
//               title: const Text('Automatically Receive NFT'),
//               titleTextStyle: appFont.SubHeadingMedium,
//               subtitle: const Text('Let people airdrop NFTs into your wallet.'),
//               subtitleTextStyle: appFont.DescriptionRegular.hexColor('#979DAA'),
//               trailing: CupertinoSwitch(
//                 value: enabled,
//                 onChanged: (_) async {
//                   final bool? value = await showModalBottomSheet(
//                     isScrollControlled: true,
//                     elevation: 0,
//                     context: context,
//                     backgroundColor: colorFromHex('f4f4f6'),
//                     builder: (context) {
//                       return _ConfirmReceivingNftBottomSheet(active: enabled);
//                     },
//                   );
//                   setState(() => enabled = value ?? enabled);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ConfirmReceivingNftBottomSheet extends StatefulWidget {
//   final bool? active;
//   // ignore: unused_element
//   const _ConfirmReceivingNftBottomSheet({this.active = false});

//   @override
//   State<_ConfirmReceivingNftBottomSheet> createState() =>
//       __ConfirmReceivingNftBottomSheetState();
// }

// class __ConfirmReceivingNftBottomSheetState
//     extends State<_ConfirmReceivingNftBottomSheet> {
//   late bool active;
//   bool confirmed = false;

//   @override
//   void initState() {
//     active = widget.active!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appFont = context.appFont;
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Gap(20),
//               Text(
//                 'Confirm',
//                 style: AppFont.of(context,fontSize: AppFont.size18,fontWeight: AppFont.bold),
//               ),
//               GestureDetector(
//                 onTap: () => context.pop(),
//                 child: const Icon(
//                   PhosphorIconsBold.x,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           const Gap(20),
//           ListTile(
//             tileColor: whiteColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 12,
//               horizontal: 20,
//             ),
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: CachedNetworkImage(
//                 imageUrl:
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5awrRMjYQ68AihQwDAuNbPmAJC_TZ_DpS5w&s',
//                 height: 55,
//                 width: 55,
//               ),
//             ),
//             title: Text('Auto Receive NFTs', style: AppFont.of(context,fontSize: AppFont.size18,fontWeight: AppFont.bold),),
//             subtitle: const Text('Let people airdrop NFTs into your wallet'),
//             subtitleTextStyle: AppFontLight.of(context,fontSize: AppFontLight.size14,fontWeight: AppFontLight.semibold),
//           ),
//           Visibility(
//             visible: !confirmed,
//             child: Container(
//               width: double.maxFinite,
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: whiteColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Address Used',
//                         style: AppFontLight.of(context,fontSize: AppFontLight.size16,fontWeight: AppFontLight.bold),
//                       ),
//                       Text(
//                         'Aptos',
//                         style: AppFont.of(context,fontSize: AppFont.size16,fontWeight: AppFont.bold),
//                       ),
//                     ],
//                   ),
//                   const Gap(16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Network',
//                         style: AppFontLight.of(context,fontSize: AppFontLight.size16,fontWeight: AppFontLight.bold),
//                       ),
//                       Text(
//                         'Aptos',
//                         style: AppFont.of(context,fontSize: AppFont.size16,fontWeight: AppFont.bold),
//                       ),
//                     ],
//                   ),
//                   const Gap(16),
//                   Row(
//                     children: [
//                       Text(
//                         'Network Fee',
//                         style: AppFontLight.of(context,fontSize: AppFontLight.size16,fontWeight: AppFontLight.bold),
//                       ),
//                       const Spacer(),
//                       Assets.blockchains.ethereum.image(height: 18, width: 18),
//                       const Gap(5),
//                       Text(
//                         '0000.2APT',
//                         style: AppFont.of(context,fontSize: AppFont.size16,fontWeight: AppFont.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Visibility(
//             visible: !confirmed,
//             child: ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: ClipOval(
//                 child: CircleAvatar(
//                   radius: 18,
//                   backgroundColor: colorFromHex('#FA7AA2'),
//                   child: Assets.images.avatar01.image(height: 32, width: 32),
//                 ),
//               ),
//               title: const Text('Business'),
//               titleTextStyle: AppFont.of(context,fontSize: AppFont.size16,fontWeight: AppFont.bold),
//               subtitle: const Text('Shirakawa Ayane'),
//               subtitleTextStyle: AppFontLight.of(context,fontSize: AppFontLight.size12,fontWeight: AppFontLight.semibold),
              
//             ),
//           ),
//           const Gap(20),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: const Size.fromHeight(55),
//             ),
//             onPressed: () async {
//               active = !active;
//               setState(() => confirmed = true);
//               await Future.delayed(1200.milliseconds);
//               if (!context.mounted) return;
//               context.pop(active);
//             },
//             child: Visibility(
//               visible: confirmed,
//               replacement: const Text('Confirm request'),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     PhosphorIconsFill.checkCircle,
//                     color: Colors.green,
//                     size: 16,
//                   ).animate().scale(duration: 0.5.seconds),
//                   const Gap(6),
//                   const Text('Done')
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
