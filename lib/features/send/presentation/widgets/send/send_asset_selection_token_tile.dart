// import 'package:defy_mobile/src/config/config.dart';
// import 'package:defy_mobile/src/features/transaction/send/domain/models/selectable_item_model.dart';
// import 'package:defy_mobile/src/features/transaction/send/domain/models/token_model.dart';
// import 'package:defy_mobile/src/features/transaction/send/presentation/screens/send_token.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class SendAssetSelectionTokenTile<T extends SelectableItem>
//     extends StatelessWidget {
//   final bool isMulti;
//   final List<T> selectedItems;
//   final List<Token> token;
//   const SendAssetSelectionTokenTile(
//       {required this.selectedItems,
//       required this.token,
//       super.key,
//       this.isMulti = false});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (isMulti) {
//           const MultiSendTokenScreenRoute().push(context);
//         } else {
//           Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SendToken(
//                       selectedItems: selectedItems,
//                       selectedToken: token,
//                     ),
//                   ),
//                 );
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 32),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Image(
//               height: 40,
//               width: 40,
//               image: AssetImage("assets/images/Aptos-Logo.png"),
//             ),
//             const Gap(12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Aptos",
//                   style:
//                       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   "7 APTOS",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                       color: greyLight),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Text(
//               "\$22.12",
//               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
