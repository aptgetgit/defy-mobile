// import 'package:defy_mobile/src/core/core.dart';
// import 'package:defy_mobile/src/features/common/presentation/widget/custom_button.dart';
// import 'package:defy_mobile/src/features/transaction/receive/presentation/components/request_sheet.dart';
// import 'package:defy_mobile/src/features/transaction/receive/presentation/widgets/qr_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class ReceiveScreen extends StatefulWidget {
//   const ReceiveScreen({super.key});

//   @override
//   State<ReceiveScreen> createState() => _ReceiveScreenState();
// }

// class _ReceiveScreenState extends State<ReceiveScreen> {
//   final PageController controller = PageController();
//   late DraggableScrollableController _receiveSheetController;

//   bool isSheetScrolled = false;
//   double pageIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _receiveSheetController = DraggableScrollableController();
//     controller.addListener(() {
//       setState(() {
//         pageIndex = controller.page!;
//       });
//       logger.d(pageIndex);
//     });

//     _receiveSheetController.addListener(() {
//       logger.d(_receiveSheetController.size);
//       if (_receiveSheetController.size > 0.6) {
//         setState(() {
//           isSheetScrolled = true;
//         });
//       } else {
//         setState(() {
//           isSheetScrolled = false;
//         });
//       }
//     });
//   }

//   void openSheet() {
//     _receiveSheetController.animateTo(0.95,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOutBack);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final (width, height) = context.screenSize;
//     return Scaffold(
//       body: Stack(children: [
//         Container(
//           // color: context.themeData.scaffoldBackgroundColor,
//           color: const Color.fromARGB(102, 0, 0, 0),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Gap(0),
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(61, 255, 255, 255),
//                           shape: BoxShape.circle,
//                         ),
//                         child: IconButton(
//                           visualDensity:
//                               const VisualDensity(horizontal: -4, vertical: -4),
//                           onPressed: () {},
//                           icon: const Icon(
//                             PhosphorIconsBold.caretLeft,
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Allan Jerrold',
//                             style:
//                                 AppFont.of(context).PrioritySemibold.copyWith(
//                                       color: whiteColor,
//                                     ),
//                           ),
//                           Text(
//                             'Aj_22.avex',
//                             style: AppFont.of(context).GeneralSemibold.copyWith(
//                                   color: const Color(0xffcfd2d8),
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 const QrCard(data: 'Sunil kumar'),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       PhosphorIconsBold.vibrate,
//                       color: whiteColor,
//                     ),
//                     const Gap(6),
//                     Text(
//                       'Shake to copy address',
//                       style: AppFont.of(context).GeneralBold.copyWith(
//                             color: whiteColor,
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 TextButton.icon(
//                   onPressed: () {
//                     Clipboard.setData(
//                       const ClipboardData(text: "Address"),
//                     );
//                   },
//                   label: Text(
//                     'Copy address',
//                     style: AppFont.of(context).DescriptionBold.copyWith(
//                           color: whiteColor,
//                         ),
//                   ),
//                   icon: const Icon(PhosphorIconsBold.copy, color: whiteColor),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 22,
//                   ),
//                   child: SizedBox(
//                     height: height * .09,
//                     width: width,
//                     child: Stack(
//                       children: [
//                         PageView.builder(
//                             controller: controller,
//                             scrollDirection: Axis.vertical,
//                             itemCount: 4,
//                             itemBuilder: (ctx, index) {
//                               return Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 4),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 8),
//                                 height: height * .09,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(61, 255, 255, 255),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     const CircleAvatar(radius: 22),
//                                     const Gap(8),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Business',
//                                           style: AppFont.of(context)
//                                               .GeneralBold
//                                               .copyWith(
//                                                 color: whiteColor,
//                                               ),
//                                         ),
//                                         Text('Primary',
//                                             style: AppFont.of(context)
//                                                 .DescriptionSemibold
//                                                 .copyWith(
//                                                   color:
//                                                       const Color(0xfff4f4f6),
//                                                 )),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                         Positioned(
//                           right: 12,
//                           top: 1,
//                           bottom: 1,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               for (int i = 0; i < 3; i++)
//                                 Container(
//                                   height: pageIndex == i ? 12 : 12 - i * 3,
//                                   width: pageIndex == i ? 12 : 12 - i * 3,
//                                   margin: const EdgeInsets.all(2),
//                                   decoration: BoxDecoration(
//                                     color:
//                                         pageIndex == i ? blueColor : whiteColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                 )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 0),
//               child: Text(
//                 textAlign: TextAlign.center,
//                 'Scan to Receive Token/NFT on\nBusiness Wallet',
//                 style: AppFont.of(context).GeneralSemibold.copyWith(
//                       color: whiteColor,
//                     ),
//               ),
//             ),
//             SizedBox(height: height * .1),
//           ],
//         ),
//         Stack(children: [
//           DraggableScrollableSheet(
//             controller: _receiveSheetController,
//             initialChildSize: 0.12,
//             snap: true,
//             minChildSize: 0.12,
//             maxChildSize: 0.95,
//             builder: (BuildContext context, ScrollController controller) {
//               return ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         spreadRadius: 3,
//                         blurRadius: 22,
//                       ),
//                     ],
//                     color: whiteColor,
//                   ),
//                   child: Stack(children: [
//                     RequestSheet(
//                       scrollController: controller,
//                     ),
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 12),
//                         height: 5,
//                         width: width * 0.15,
//                         decoration: BoxDecoration(
//                           color: const Color(0xffcfd2d8),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//               );
//             },
//           ),
//           Visibility(
//             visible: !isSheetScrolled,
//             child: Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: height * .12 - 24,
//                 color: whiteColor,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Expanded(
//                             child: OutlinedButton(
//                           onPressed: () {},
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Share',
//                                   style:
//                                       AppFont.of(context).DescriptionSemibold),
//                               Gap(6),
//                               Icon(PhosphorIconsRegular.shareNetwork,
//                                   color: blackColor)
//                             ],
//                           ),
//                         )),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Expanded(
//                           child: ActiveButton(
//                             label: 'Request',
//                             onTap: openSheet,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ]),
//     );
//   }
// }
