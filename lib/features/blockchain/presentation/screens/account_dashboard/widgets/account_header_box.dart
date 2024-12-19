// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/core/utils/functions.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/provider/account_provider/account_core_provider.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/provider/account_provider/new_wallet_data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AccountHeaderBox extends StatefulWidget {
//   const AccountHeaderBox({super.key});
//   @override
//   State<AccountHeaderBox> createState() => _AccountHeaderBoxState();
// }

// class _AccountHeaderBoxState extends State<AccountHeaderBox> {
//   bool showBalance = true;
//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = context.isDarkMode;
//     final width = context.width;
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 10,
//       ),
//       height: 135,
//       padding: const EdgeInsets.only(top: 5),
//       decoration: BoxDecoration(
//         color: isDarkMode ? colorFromHex('2071EE') : null,
//         borderRadius: BorderRadius.circular(20),
//         gradient: switch (isDarkMode) {
//           false => LinearGradient(
//               colors: [
//                 colorFromHex('010101'),
//                 colorFromHex('323232'),
//               ],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           _ => null,
//         },
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ListTile(
//             title: const Text('Total Balance'),
//             titleTextStyle: TextStyle(
//               fontSize: 12,
//               color: grey300,
//               fontWeight: FontWeight.w500,
//             ),
//             subtitle: Consumer(
//               builder: (context, ref, child) {
//                 final showBalance = ref.watch(showBalanceProvider);
//                 return Text.rich(
//                   TextSpan(
//                     text: showBalance ? '\$1,038' : '*******',
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w600,
//                       color: whiteColor,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: showBalance ? '.56' : '',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: grey300,
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//             trailing: Consumer(builder: (context, ref, child) {
//               final showBalance = ref.watch(showBalanceProvider);
//               return GestureDetector(
//                 onTap: () => ref.watch(showBalanceProvider.notifier).toggle(),
//                 child: Icon(
//                   showBalance
//                       ? PhosphorIcons.eyeSlash(PhosphorIconsStyle.fill)
//                       : PhosphorIcons.eye(PhosphorIconsStyle.fill),
//                   color: Colors.white54,
//                 ),
//               );
//             }),
//           ),
//           ListTile(
//             leading: Consumer(builder: (context, ref, child) {
//               final walletCount = ref.watch(walletCountProvider);
//               return walletCount.when(
//                 data: (d) => Text(
//                   '$d Wallets',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: whiteColor,
//                   ),
//                 ),
//                 error: (error, stackTrace) => const SizedBox(),
//                 loading: () => const Text(
//                   'Loading...',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: whiteColor,
//                   ),
//                 ),
//               );
//             }),
//             trailing: SizedBox(
//               width: width * .5,
//               child: Stack(
//                 children: [0, 1, 2].map((i) {
//                   return Positioned(
//                     right: i * 24,
//                     child: CircleAvatar(
//                       backgroundColor: [
//                         Colors.purple,
//                         Colors.yellow,
//                         Colors.green
//                       ][i],
//                       child: CachedNetworkImage(
//                         imageUrl: 'https://api.multiavatar.com/header$i.png',
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
