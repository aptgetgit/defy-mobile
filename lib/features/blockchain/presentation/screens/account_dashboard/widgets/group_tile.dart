// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:defy_mobile/src/features/blockchain/domain/entities/account_entities/group_entity.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/provider/account_provider/new_wallet_data_provider.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/widgets/curve_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/core/utils/functions.dart';

// class GroupTile extends ConsumerWidget {
//   final Group group;
//   final String personaName;
//   final bool last;
//   final bool active;
//   const GroupTile({
//     super.key,
//     required this.group,
//     required this.personaName,
//     this.last = false,
//     this.active = false,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final showBalance = ref.watch(showBalanceProvider);
//     final width = context.width;
//     final appFont = context.appFont;
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const Gap(21.5),
//           Container(
//             alignment: Alignment.center,
//             child: CurveLine(isEndTile: last),
//           ),
//           GestureDetector(
//             onTap: () {
//               if (!active) return;
//               WalletUiScreenRoute(
//                 group,
//                 personaName: personaName,
//               ).push(context);
//             },
//             child: Container(
//               height: 55,
//               width: width - 110,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               padding: EdgeInsets.only(bottom: last ? 0 : 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 16,
//                     backgroundColor: colorFromHex(group.backgroundHexColor),
//                     child: CachedNetworkImage(
//                       height: 20,
//                       imageUrl: group.animatedIconUrl,
//                       fit: BoxFit.contain,
//                       errorWidget: (context, url, error) => const SizedBox(),
//                     ),
//                   ),
//                   const Gap(10),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         group.groupName,
//                         style: appFont.GeneralSemibold,
//                       ),
//                       Visibility(
//                         visible: showBalance,
//                         child: const Text(
//                           "\$0.678 ETH",
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w500,
//                             color: greyColor,
//                           ),
//                         ).animate().fadeIn(duration: 1000.milliseconds),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
