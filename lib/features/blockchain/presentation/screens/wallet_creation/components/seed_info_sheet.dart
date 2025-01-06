// import 'package:defy_mobile/src/features/blockchain/domain/entities/account_entities/group_entity.dart';
// import 'package:defy_mobile/src/features/blockchain/domain/entities/account_entities/persona_entity.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/provider/account_provider/new_wallet_data_provider.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/widgets/persona_expension_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:defy_mobile/src/core/constants/animated_emoji.dart';
// import 'package:defy_mobile/src/core/core.dart';

// void openSeedInfoBottonSheet(BuildContext context, {required String seedId}) {
//   showModalBottomSheet(
//     context: context,
//     sheetAnimationStyle: AnimationStyle(
//       duration: 600.milliseconds,
//       reverseDuration: 600.milliseconds,
//     ),
//     isScrollControlled: true,
//     builder: (context) {
//       return _SeedInfoSheet(seedId);
//     },
//   );
// }

// class _SeedInfoSheet extends StatefulWidget {
//   final String seedId;
//   const _SeedInfoSheet(this.seedId);

//   @override
//   State<_SeedInfoSheet> createState() => _SeedInfoSheetState();
// }

// class _SeedInfoSheetState extends State<_SeedInfoSheet> {
//   int selected = 0;
//   @override
//   Widget build(BuildContext context) {
//     final appFont = context.appFont;
//     final height = context.height;
//     return SafeArea(
//       child: Container(
//         constraints: BoxConstraints(
//           maxHeight: height * .9,
//           minHeight: height * .5,
//         ),
//         width: context.width,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Gap(20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Seedphase 1',
//                     style: appFont.SubHeadingSemibold,
//                   ),
//                   InkWell(
//                     borderRadius: BorderRadius.circular(9),
//                     onTap: () => context.pop(),
//                     child: const Icon(
//                       Icons.close,
//                       size: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   '3 Wallets',
//                   style: appFont.DescriptionMedium.copyWith(
//                     color: colorFromHex('#979DAA'),
//                   ),
//                 ),
//               ),
//             ),
//             const Gap(10),
//             Container(
//               constraints: BoxConstraints(maxHeight: height * .6),
//               child: Consumer(
//                 builder: (context, ref, child) {
//                   final accountCore = [
//                     Persona(
//                       givenName: 'Deepak',
//                       familyName: "Kumar",
//                       avatar: AnimatedEmoji.ColdFace.getEmoji,
//                       personaName: 'deepakkk',
//                       groups: [
//                         Group(
//                           groupName: 'Business',
//                           animatedIconUrl: AnimatedEmoji.RelievedFace.getEmoji,
//                           backgroundHexColor: colorToHex(Colors.green),
//                           isPrimary: true,
//                           blockchainAccounts: [],
//                         ),
//                         Group(
//                           groupName: 'Saving',
//                           animatedIconUrl:
//                               AnimatedEmoji.BeamingFacewithSmilingEyes.getEmoji,
//                           backgroundHexColor: colorToHex(Colors.yellow),
//                           isPrimary: true,
//                           blockchainAccounts: [],
//                         )
//                       ],
//                       isPrimary: true,
//                     ),
//                     Persona(
//                       givenName: 'Sunil',
//                       familyName: "Kividor",
//                       avatar: AnimatedEmoji.StarStruck.getEmoji,
//                       personaName: 'sunil.kividor',
//                       groups: [
//                         Group(
//                           groupName: 'Saving',
//                           animatedIconUrl: AnimatedEmoji.ConfusedFace.getEmoji,
//                           backgroundHexColor: colorToHex(Colors.blue),
//                           isPrimary: true,
//                           blockchainAccounts: [],
//                         ),
//                         Group(
//                           groupName: 'Fixed',
//                           animatedIconUrl:
//                               AnimatedEmoji.SkullandCrossbones.getEmoji,
//                           backgroundHexColor: colorToHex(Colors.indigo),
//                           isPrimary: false,
//                           blockchainAccounts: [],
//                         ),
//                         Group(
//                           groupName: 'x93....2c34',
//                           animatedIconUrl: AnimatedEmoji.PoutingCat.getEmoji,
//                           backgroundHexColor: colorToHex(Colors.pinkAccent),
//                           isPrimary: false,
//                           blockchainAccounts: [],
//                         )
//                       ],
//                       isPrimary: false,
//                     )
//                   ];
//                   return ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: accountCore.length,
//                     itemBuilder: (context, index) {
//                       final persona = accountCore.elementAt(index);
//                       return GestureDetector(
//                         onTap: () => setState(() {
//                           selected = index;
//                         }),
//                         child: Opacity(
//                           opacity: selected == index ? 1 : .4,
//                           child: SizedBox(
//                               width: double.maxFinite,
//                               child: PersonaExpansionTile(persona)
//                                   .animate()
//                                   .fadeIn()),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             const Gap(20),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Consumer(builder: (context, ref, child) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     ref
//                         .read(newWalletDataStateProvider.notifier)
//                         .setShareId(widget.seedId);
//                     const WalletCreationScreenRoute().push(context);
//                   },
//                   child: Text(
//                     'Create new',
//                     style: appFont.GeneralMedium.copyWith(
//                       color: colorFromHex('#F4F4F6'),
//                     ),
//                   ),
//                 );
//               }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
