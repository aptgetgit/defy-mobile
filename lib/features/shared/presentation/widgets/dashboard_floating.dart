// import 'package:flutter/material.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

//  List<MenuItem> dataSet = [
//   MenuItem(text: 'Home', icon: PhosphorIcons.home),
//   MenuItem(text: 'Search', icon: PhosphorIcons.magnifyingGlass),
//   MenuItem(text: 'Profile', icon: PhosphorIcons.user),
//   MenuItem(text: 'Settings', icon: PhosphorIcons.gear),
// ]

// class BottomBarActionMenuRow extends StatefulWidget {
//   const BottomBarActionMenuRow({super.key});

//   @override
//   State<BottomBarActionMenuRow> createState() => _BottomBarActionMenuRowState();
// }

// class _BottomBarActionMenuRowState extends State<BottomBarActionMenuRow> {
//   // @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       height: 180,
//       top: 500,
//       left: 0,
//       right: 0,
//       child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
//         colors: [
//           Colors.white,
//           Colors.white.withOpacity(0.8),
//           Colors.white.withOpacity(0.5),
//           Colors.white.withOpacity(0.35),
//           Colors.white.withOpacity(0.005),

//         ]
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//         stops: const [0.55, 0.65, 0.75, 0.85, 0.99],
//       )),
//       child: Row(
//         mainAxisAlignment: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,    
//         children: [
//           for(var i = 0; i < dataSet.length; i++)
//           PIconButton(item: dataSet[i]),
//         ],   )
      
//       ),
//     );
//   }
// }