// import 'package:defy/src/core/core.dart';
// import 'package:defy/src/features/common/presentation/widget/custom_button.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_risk_filter.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_sort_filter.dart';
// import 'package:defy/src/features/yield/presentation/enums/yield_type_filter.dart';
// import 'package:defy/src/features/yield/presentation/provider/filter_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:googleapis/drive/v3.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// // Helper function to capitalize the first letter
// String capitalize(String text) {
//   if (text.isEmpty) {
//     return text;
//   }
//   return text[0].toUpperCase() + text.substring(1).toLowerCase();
// }

// class FilterBottomSheet extends ConsumerWidget {
//   const FilterBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//   //   final state = ref.watch(filterProvider);
//   //   final controller = ref.watch(filterProvider.notifier);

//     // // Filter out the "None" option
//     // final filteredTypes = YieldTypeFilter.values
//     //     .where((type) => type != YieldTypeFilter.none)
//     //     .toList();
//     // final filteredRisk = YieldRiskFilter.values
//     //     .where((risk) => risk != YieldRiskFilter.none)
//     //     .toList();
//     // final filteredSort = YieldSortFilter.values
//     //     .where((sort) => sort != YieldSortFilter.none)
//     //     .toList();

//     return Container(
//         padding: const EdgeInsets.all(16),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     'Yield Filter',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(PhosphorIconsBold.x),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//               const Text(
//                 'Types',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 3,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: filteredTypes.length,
//                 itemBuilder: (context, index) {
//                   final type = filteredTypes[index];
//                   final isSelected = state.typeFilter == type;

//                   return GestureDetector(
//                     // onTap: () {
//                     //   if (isSelected) {
//                     //     controller.updateTypeFilter(YieldTypeFilter.none);
//                     //     return;
//                     //   }
//                     //   controller.updateTypeFilter(type);
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? const Color(0xffe9f1fd)
//                             : Colors.grey[200],
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: isSelected
//                             ? [
//                                 BoxShadow(
//                                     color: Colors.blue.withOpacity(0.2),
//                                     blurRadius: 6,
//                                     spreadRadius: 1)
//                               ]
//                             : [],
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             capitalize(type.name),
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: isSelected
//                                   ? const Color(0xff2071ee)
//                                   : Colors.black.withOpacity(0.5),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           if (isSelected)
//                             Container(
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xff2071ee),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: const Icon(
//                                 PhosphorIconsBold.x,
//                                 size: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const Text(
//                 'Risk',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 3,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: filteredRisk.length,
//                 itemBuilder: (context, index) {
//                   final risk = filteredRisk[index];
//                   final isSelected = state.riskFilter == risk;

//                   return GestureDetector(
//                     onTap: () {
//                       // if (isSelected) {
//                       //   controller.updateRiskFilter(YieldRiskFilter.none);
//                       //   return;
//                       // }
//                       // controller.updateRiskFilter(risk);
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? const Color(0xffe9f1fd)
//                             : Colors.grey[200],
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: isSelected
//                             ? [
//                                 BoxShadow(
//                                     color: Colors.blue.withOpacity(0.2),
//                                     blurRadius: 6,
//                                     spreadRadius: 1)
//                               ]
//                             : [],
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             capitalize(risk.name),
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: isSelected
//                                   ? const Color(0xff2071ee)
//                                   : Colors.black.withOpacity(0.5),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           if (isSelected)
//                             Container(
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xff2071ee),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: const Icon(
//                                 PhosphorIconsBold.x,
//                                 size: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const Text(
//                 'Total Value Log (TVL)',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       '\$${state.tvlFilter}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                     ),
//                     const Spacer(),
//                     Icon(
//                       PhosphorIconsBold.arrowRight,
//                       size: 20,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Sort by APY',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 4,
//                   crossAxisSpacing: 15,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: filteredSort.length,
//                 itemBuilder: (context, index) {
//                   final sort = filteredSort[index];
//                   final isSelected = state.sortFilter == sort;
//                   return GestureDetector(
//                     onTap: () {
//                       if (isSelected) {
//                         controller.updateSortFilter(YieldSortFilter.none);
//                       } else {
//                         controller.updateSortFilter(sort);
//                       }
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? const Color(0xffe9f1fd)
//                             : Colors.grey[200],
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: isSelected
//                             ? [
//                                 BoxShadow(
//                                     color: Colors.blue.withOpacity(0.2),
//                                     blurRadius: 6,
//                                     spreadRadius: 1)
//                               ]
//                             : [],
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             sort == YieldSortFilter.highToLow
//                                 ? PhosphorIconsBold.trendDown
//                                 : sort == YieldSortFilter.lowToHigh
//                                     ? PhosphorIconsBold.trendUp
//                                     : null,
//                             size: 20,
//                             color: Colors.black,
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             capitalize(sort.name),
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: isSelected
//                                   ? const Color(0xff2071ee)
//                                   : Colors.black.withOpacity(0.5),
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           if (isSelected)
//                             Container(
//                               padding: const EdgeInsets.all(3),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xff2071ee),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: const Icon(
//                                 PhosphorIconsBold.x,
//                                 size: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Dapps',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                     ),
//                     const Spacer(),
//                     Icon(
//                       PhosphorIconsBold.arrowRight,
//                       size: 20,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ActiveButton(
//                 label: 'Apply',
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 active: true,
//                 size: ButtonSize.large,
//               ),
//             ],
//           ),
//         ));
//   }
// }
