// import 'package:defy/features/transaction/send/presentation/providers/send_ui_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// // import 'package:flutter_expandable/expandable.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// class SendScreen extends ConsumerStatefulWidget {
//   const SendScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SendScreenState();
// }

// class _SendScreenState extends ConsumerState<SendScreen>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     // final sendController = ref.watch(sendScreenProvider.notifier);
//     // final sendState = ref.watch(sendScreenProvider);
//     final expandableController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Icon(
//                 PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
//                 color: Colors.black,
//                 size: 18,
//               ),
//               Text(
//                 "Send",
//                 style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,),
//               ),
//               Icon(
//                 PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
//                 color: Colors.black,
//                 size: 21,
//               ),
//             ],
//           ),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>
//                     //         const SendSearchPage(), // Navigate to the search page
//                     //   ),
//                     // );
//                   },
//                   child: Consumer(
//                     builder: (ctx,ref,child) {
//                       final sendController = ref.watch(sendScreenProvider.notifier);
//                       final sendState = ref.watch(sendScreenProvider);
//                       return Container(
//                       width: double.infinity,
//                       height: 45,
//                       decoration: BoxDecoration(
//                         color: veryLightGrey,
//                         borderRadius: BorderRadius.circular(60),
//                       ),
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const Gap(16),
//                             Text(
//                               "To",
//                               style: NunitoFont.of(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const Gap(20),
//                             Expanded(
//                               child: TextField(
//                                 enabled: false,
//                                 cursorHeight: 18,
//                                 textAlign: TextAlign.start,
//                                 controller: sendState.searchController,
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 cursorColor: Colors.black,
//                                 decoration: const InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: "Enter Address",
//                                   hintStyle: TextStyle(
//                                     color: greyLight,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: sendController.pasteFromClipboard,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(7.0),
//                                 child: Container(
//                                   height: 42,
//                                   decoration: BoxDecoration(
//                                     color: blueColor,
//                                     borderRadius: BorderRadius.circular(60),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     child: Center(
//                                       child: Text(
//                                         "Paste",
//                                         style: NunitoFont.of(
//                                           fontSize: 14,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                     } 
//                   ),
//                 ),
//                 const Gap(30),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         width: MediaQuery.of(context).size.width * 0.130,
//                         height: MediaQuery.of(context).size.width * 0.130,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: const Color(0xfff4f4f6),
//                         ),
//                         child: const Icon(
//                           PhosphorIconsRegular.scan,
//                           size: 28,
//                           color: Color(0xff979DAA),
//                         ),
//                       ),
//                       const Gap(6),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Scan QR Code", style: AppFont.of(context)),
//                           Text("Tap to Scan QR address",
//                               style: AppFont.of(context, fontSize: 14)
//                                   .copyWith(color: const Color(0xff979DAA))),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Gap(20),
//                 Row(
//                   children: [
//                     Icon(
//                       PhosphorIcons.clockClockwise(PhosphorIconsStyle.bold),
//                       color: greyLight,
//                       size: 20,
//                     ),
//                     const Gap(4),
//                     Text(
//                       "Recent",
//                       style: NunitoFont.of(color: greyLight),
//                     ),
//                   ],
//                 ),
//                 const Gap(12),
//                 const Divider(
//                   thickness: 1.5,
//                   height: 1.5,
//                   color: Color(0xffF4F4F6),
//                 ),
//                 const Gap(16),
//                 Consumer(
//                   builder:(ctx,ref,child){
//                       final sendController = ref.watch(sendScreenProvider.notifier);
//                       final sendState = ref.watch(sendScreenProvider);
//                     return SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         _buildRecentContacts(context, sendState.seeMore,
//                             expandableController, sendController.toggleSeeMore),
//                       ],
//                     ),
//                   );
//                   }
//                 ),
//               const Spacer(),
//               ElevatedButton(onPressed: (){
//                 const SendAssetSelectionScreenRoute().push(context);
//               }, child: const Text('Continue'),),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRecentContacts(BuildContext context, bool seeMore,
//       AnimationController expandableController, Function() toggleSeeMore) {
//     return Consumer(builder: (ctx, ref, child) {
//       final recentTransactionProfiles = ref.read(sendRecentProfilesProvider);
//       const maxInRow = 4;
//       final displayedProfiles =
//           recentTransactionProfiles.take(maxInRow - 1).toList();
//       final sendTransferAssetsController =
//           ref.watch(sendTransferAssetsProvider.notifier);
//       return Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               for (var profile in displayedProfiles)
//                 _buildContactTile(
//                   context,
//                   imagePath: profile.assetUrl ?? 'N/A',
//                   label: profile.name ?? 'N/A',
//                   onTap: () {
//                     sendTransferAssetsController.addReceiver(profile);
//                     const SendAssetSelectionScreenRoute().push(context);
//                   },
//                 ),
//               Visibility(
//                 visible:
//                     !seeMore && recentTransactionProfiles.length > maxInRow,
//                 replacement: _buildContactTile(
//                   context,
//                   imagePath:
//                       recentTransactionProfiles[maxInRow - 1].assetUrl ?? 'N/A',
//                   label: recentTransactionProfiles[maxInRow - 1].name ?? 'N/A',
//                   onTap: () {
//                     sendTransferAssetsController
//                         .addReceiver(recentTransactionProfiles[maxInRow - 1]);
//                     const SendAssetSelectionScreenRoute().push(context);
//                   },
//                 ),
//                 child: _buildSeeMoreTile(context, toggleSeeMore),
//               ),
//             ],
//           ),
//           const Gap(16),
//           if (true)
//             AnimatedContainer(
//               height: MediaQuery.of(context).size.height * 0.225,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOutCubic,
//               child: Expandable(
//                 height: MediaQuery.of(context).size.height * 0.225,
//                 animateHeight: true,
//                 controller: expandableController,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOutCubic,
//                 child: _buildAdditionalContacts(context, toggleSeeMore)
//                     .animate()
//                     .slideY(begin: -0.05, end: 0),
//               ),
//             ),
//         ],
//       );

//     });
//   }

//   Widget _buildAdditionalContacts(
//       BuildContext context, Function() toggleSeeMore) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildContactTile(
//               context,
//               imagePath: "assets/images/avatar-1.png",
//               label: "Jane ",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SendAssetSelection(),
//                   ),
//                 );
//               },
//             ),
//             _buildContactTile(
//               context,
//               imagePath: "assets/gifs/star_face.gif",
//               label: "Family",
//               backgroundColor: const Color(0xffFA7AA2),
//             ),
//             _buildContactTile(
//               context,
//               imagePath: "assets/images/avatar-3.png",
//               label: "Thomas",
//             ),
//             _buildContactTile(
//               context,
//               imagePath: "assets/images/avatar-4.png",
//               label: "Chris",
//             ),
//           ],
//         ),
//         const Gap(20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildContactTile(
//               context,
//               imagePath: "assets/images/avatar-5.png",
//               label: "Ryan",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SendAssetSelection(),
//                   ),
//                 );
//               },
//             ),
//             _buildSeeLessTile(context, toggleSeeMore),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.135,
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.135,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildSeeMoreTile(BuildContext context, Function() toggleSeeMore) {
//     return GestureDetector(
//       onTap: toggleSeeMore,
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.width * 0.12,
//             width: MediaQuery.of(context).size.width * 0.12,
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: const Color(0xffD2E3FC),
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Icon(
//               PhosphorIcons.arrowCircleDown(PhosphorIconsStyle.regular),
//               size: 30,
//             ),
//           ),
//           const Gap(6),
//           Text(
//             "See More",
//             style: NunitoFont.of(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     ).animate().slideY(
//           begin: 0.075,
//           end: 0,
//         );
//   }

//   Widget _buildSeeLessTile(BuildContext context, Function() toggleSeeMore) {
//     return GestureDetector(
//       onTap: toggleSeeMore,
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.width * 0.12,
//             width: MediaQuery.of(context).size.width * 0.12,
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: const Color(0xffFFD2D2),
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Icon(
//               PhosphorIcons.arrowCircleUp(PhosphorIconsStyle.regular),
//               size: 30,
//               color: const Color(0xffFF4D4D),
//             ),
//           ),
//           const Gap(6),
//           Text(
//             "See Less",
//             style: NunitoFont.of(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactTile(BuildContext context,
//       {required String imagePath,
//       required String label,
//       VoidCallback? onTap,
//       Color backgroundColor = Colors.transparent}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width * 0.135,
//             height: MediaQuery.of(context).size.width * 0.135,
//             padding: backgroundColor == Colors.transparent
//                 ? null
//                 : const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: backgroundColor == Colors.transparent
//                   ? null
//                   : backgroundColor,
//             ),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const Gap(6),
//           Text(
//             label,
//             style: NunitoFont.of(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: greyLight),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WalletTile extends StatelessWidget {
//   final String title;
//   final String subTitle;
//   final IconData icon;
//   final Color backgroundColor;
//   final Color iconColor;
//   final void Function()? onTap;

//   const WalletTile({
//     super.key,
//     required this.title,
//     required this.subTitle,
//     required this.icon,
//     required this.backgroundColor,
//     required this.iconColor,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             width: MediaQuery.of(context).size.width * 0.135,
//             height: MediaQuery.of(context).size.width * 0.135,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: backgroundColor,
//             ),
//             child: Icon(
//               icon,
//               size: 30,
//               color: iconColor,
//             ),
//           ),
//           const Gap(6),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 subTitle,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
