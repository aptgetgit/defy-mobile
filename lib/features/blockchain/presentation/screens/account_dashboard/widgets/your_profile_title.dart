// import 'package:flutter/material.dart';

// import 'package:defy_mobile/src/core/core.dart';

// class YourProfileTitleBar extends StatelessWidget {
//   const YourProfileTitleBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 20),
//       child: Row(
//         children: [
//           const Icon(PhosphorIconsBold.appWindow, color: greyColor),
//           const Gap(5),
//           const Text(
//             'Your Profile',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               color: greyColor,
//             ),
//           ),
//           const Spacer(),
//           TextButton(
//             style: TextButton.styleFrom(
//               fixedSize: const Size.fromHeight(30),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 6,
//                 vertical: 3,
//               ),
//               foregroundColor: Colors.blue,
//               textStyle: const TextStyle(
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             onPressed: () => AddProfileImageScreenRoute().push(context),
//             child: const Text('add profile'),
//           ),
//         ],
//       ),
//     );
//   }
// }
