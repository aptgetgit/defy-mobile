// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/core/utils/functions.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/components/add_account_sheet.dart';
// import 'package:flutter/material.dart';

// class CreateExternalWallet extends StatelessWidget {
//   const CreateExternalWallet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = context.isDarkMode;
//     return Container(
//       height: 55,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color:
//             isDarkMode ? Colors.white.withOpacity(0.2) : colorFromHex('F4F4F6'),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: InkWell(
//         onTap: () => addBlockchainAccountBottomSheet(context, ""),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             const CircleAvatar(
//               radius: 16,
//               backgroundColor: blackColor,
//               child: Icon(PhosphorIconsBold.plus, color: whiteColor, size: 18),
//             ),
//             const Gap(10),
//             Text(
//               "Create / Import wallet",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: colorFromHex('#979DAA'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
