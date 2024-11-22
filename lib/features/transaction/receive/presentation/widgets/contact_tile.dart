// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/features/transaction/common/widgets/check_box.dart';
// import 'package:flutter/material.dart';

// class ContactListTile extends StatefulWidget {
//   const ContactListTile({super.key});


//   @override
//   State<ContactListTile> createState() => _ContactListTileState();
// }

// class _ContactListTileState extends State<ContactListTile> {
//   bool tokenSelected = false;

//   void selectToken() {
//     setState(() {
//       tokenSelected = !tokenSelected;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final (width,_) = context.screenSize;
//     return InkWell(
//       onTap: selectToken,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 12,),
//         decoration : const BoxDecoration(
//           color: transparentColor,
//         ),
//         width: width,
//         child: Row(
//           children: [
//             Assets.blockchains.bitcoin.image(
//           width: width*0.12,
//         ),
//         const Gap(16),
//         Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Space Warroior",
//                   style: AppFont.of(context).GeneralBold,
//                 ),
//                  Text('spacex10',style: AppFont.of(context).DescriptionBold.copyWith(
//                   color: const Color(0xff979daa),),),
//               ],
//             ),
         
//             const Spacer(),
            
        
//             CustomCheckbox(
//               isChecked: tokenSelected,
//               isRound: true,
//               onTap : selectToken,
//             )
          
//           ],
//         ),
//       ),
//     );
//   }
// }