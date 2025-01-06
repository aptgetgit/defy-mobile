// import 'package:defy/core/extensions/context_extensions.dart';
// import 'package:flutter/material.dart';

// class RequestSheet extends StatefulWidget {
//   const RequestSheet({super.key, required this.scrollController});

//   final ScrollController scrollController;
//   @override
//   State<RequestSheet> createState() => _RequestSheetState();
// }

// class _RequestSheetState extends State<RequestSheet> {
//   final TextEditingController controller = TextEditingController();
//   int contactsSelected = 1;

//   void continueToConfimation() {
//     // TransactionConfirmationScreenRoute(TransactionType.receive).push(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = context.screenWidth;
//     final height = context.screeHeight;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Stack(
//         children: [
//           CustomScrollView(
//             controller: widget.scrollController,
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//                   decoration: BoxDecoration(
//                     color: const Color(0xfff4f4f6),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         'From',
//                         style: AppFont.of(context).SubHeadingBold,
//                       ),
//                       const Gap(12),
//                       Expanded(
//                         child: SizedBox(
//                           // width: width / 3,
//                           child: TextField(
//                             controller: controller,
//                             showCursor: true,
//                             cursorColor: blackColor,
//                             decoration: InputDecoration(
//                               hintText: 'Enter address',
//                               hintStyle:
//                                   AppFont.of(context).DescriptionBold.copyWith(
//                                         color: const Color(0xff979daa),
//                                       ),
//                               border: InputBorder.none,
//                             ),
//                             style: AppFont.of(context).DescriptionBold.copyWith(
//                                   height: 1,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                           ),
//                         ),
//                       ),
//                       // const Spacer(),
//                       const Gap(6),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 22, vertical: 8),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: blueColor,
//                           ),
//                           child: Text(
//                             'Paste',
//                             style: AppFont.of(context).InfoSemibold.copyWith(
//                                   color: whiteColor,
//                                 ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     const Gap(6),
//                     Row(
//                       children: [
//                         const Icon(
//                           PhosphorIconsFill.userCircle,
//                           color: const Color(0xff979daa),
//                         ),
//                         const Gap(6),
//                         Text(
//                           'Contacts',
//                           style:
//                               AppFont.of(context).DescriptionSemibold.copyWith(
//                                     color: const Color(0xff979daa),
//                                   ),
//                         )
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3),
//                       child: Divider(
//                         color: Color(0xfff4f4f6),
//                         thickness: 2,
//                       ),
//                     ),
//                     const Gap(6),
//                   ],
//                 ),
//               ),
//               SliverList.builder(
//                   itemCount: 30, itemBuilder: (ctx, index) => ContactListTile())
//             ],
//           ),
//           Positioned(
//             bottom: height * 0.015,
//             left: 0,
//             right: 0,
//             child: GestureDetector(
//               onTap: continueToConfimation,
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   // vertical: 16,
//                 ),
//                 height: ButtonSize.large.height,
//                 width: width,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 22,
//                 ),
//                 decoration: BoxDecoration(
//                   color: contactsSelected > 0
//                       ? blackColor
//                       : const Color(0xffcfd2d8),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Continue',
//                         style: AppFont.of(context).GeneralBold.copyWith(
//                               color: contactsSelected > 0
//                                   ? whiteColor
//                                   : const Color(0xff979daa),
//                             ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           color: contactsSelected > 0
//                               ? blueColor
//                               : const Color(0xff979daa),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Text(contactsSelected.toString(),
//                             style: AppFont.of(context).DescriptionBold.copyWith(
//                                   color: whiteColor,
//                                 )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//     // return Container(
//     //     color: whiteColor,
//     //     child: Column(
//     //       children: [

//     //         Row(
//     //           children: [
//     //             const Icon(PhosphorIconsFill.userCircle,color: const Color(0xff979daa),),
//     //             const Gap(6),
//     //             Text('Contacts',style: AppFont.of(context).DescriptionSemibold.copyWith(
//     //               color: const Color(0xff979daa),
//     //             ),)
//     //           ],
//     //         ),
//     //         const Padding(
//     //           padding:  EdgeInsets.symmetric(vertical: 3),
//     //           child: Divider(color: Color(0xfff4f4f6),thickness: 2,),
//     //         ),

//     //         Expanded(
//     //           child: ListView.builder(
//     //             padding: EdgeInsets.all(0),
//     //               controller: widget.scrollController,
//     //               itemCount: 40,
//     //               itemBuilder: (ctx, index) => ContactListTile()),
//     //         ),
//     //       ],
//     //     ),
//     //     );
//   }
// }
