// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/components/add_account_sheet.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/widgets/curve_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/core/utils/functions.dart';

// class CreatePersonaTile extends ConsumerWidget {
//   const CreatePersonaTile(this.personaName, {super.key});
//   final String personaName;

//   final bool isEndTile = true;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final width = context.width;
//     final isDarkMode = context.isDarkMode;
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const Gap(21.5),
//           Container(
//             height: 60,
//             alignment: Alignment.center,
//             child: CurveLine(isEndTile: isEndTile),
//           ),
//           const Gap(12),
//           Container(
//             height: 55,
//             width: width - 110,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             margin: const EdgeInsets.symmetric(vertical: 5),
//             decoration: BoxDecoration(
//               color: isDarkMode
//                   ? Colors.white.withOpacity(0.2)
//                   : colorFromHex('F4F4F6'),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: InkWell(
//               onTap: () => addBlockchainAccountBottomSheet(
//                 context,
//                 personaName,
//               ),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 15,
//                     backgroundColor: blackColor,
//                     child: Icon(
//                       PhosphorIconsBold.plus,
//                       color: whiteColor,
//                       size: 18,
//                     ),
//                   ),
//                   const Gap(10),
//                   Text(
//                     "Create / Import wallet",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: colorFromHex('#979DAA'),
//                     ),
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
