// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:defy_mobile/src/features/blockchain/domain/entities/account_entities/persona_entity.dart';
// import 'package:defy_mobile/src/features/blockchain/presentation/screens/account/account_dashboard/widgets/group_tile.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/core/utils/functions.dart';

// class PersonaExpansionTile extends ConsumerStatefulWidget {
//   const PersonaExpansionTile(this.data, {super.key});
//   final Persona data;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       PersonaExpansionTileState();
// }

// class PersonaExpansionTileState extends ConsumerState<PersonaExpansionTile> {
//   bool expanded = true;
//   @override
//   Widget build(BuildContext context) {
//     final appFont = context.appFont;
//     // ignore: prefer_const_declarations
//     final showBalance = false;
//     // ?? ref.watch(showBalanceProvider);
//     return Theme(
//       data: ThemeData(
//         splashColor: transparentColor,
//         hoverColor: transparentColor,
//         highlightColor: transparentColor,
//         dividerColor: transparentColor,
//         expansionTileTheme: const ExpansionTileThemeData(
//           backgroundColor: transparentColor,
//           collapsedBackgroundColor: transparentColor,
//         ),
//       ),
//       child: ExpansionTile(
//         enabled: false,
//         initiallyExpanded: true,
//         tilePadding: const EdgeInsets.only(left: 20, right: 20),
//         shape: const Border(),
//         leading: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Visibility(visible: expanded, child: const Gap(5)),
//             CircleAvatar(
//               radius: 24,
//               child: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: CachedNetworkImage(
//                   imageUrl: widget.data.avatar,
//                   errorWidget: (context, url, error) {
//                     return CachedNetworkImage(
//                       imageUrl:
//                           'https://api.multiavatar.com/${widget.data.personaName}.png',
//                       errorWidget: (context, url, error) => const SizedBox(),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: expanded,
//               child: Container(
//                 height: kDebugMode ? 0 : 15,
//                 width: 1,
//                 color: colorFromHex('#CFD2D8'),
//               ),
//             )
//           ],
//         ),
//         // onExpansionChanged: (v) => setState(() => expanded = true),
//         enableFeedback: false,
//         title: Text(
//           widget.data.personaName,
//           style: appFont.GeneralSemibold,
//         ),
//         subtitle: Visibility(
//           visible: showBalance,
//           child: Text(
//             '\$345.3',
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 14,
//               color: colorFromHex('646D80'),
//             ),
//           ),
//         ),
//         trailing: const SizedBox(),
//         children: [
//           for (int i = 0; i < widget.data.groups.length - 1; i++)
//             GroupTile(
//               group: widget.data.groups.elementAt(i),
//               personaName: widget.data.personaName,
//             ),
//           GroupTile(
//             group: widget.data.groups.last,
//             personaName: widget.data.personaName,
//             last: true,
//           ),
//         ],
//       ),
//     );
//   }
// }
