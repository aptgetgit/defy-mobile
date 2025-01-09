// import 'package:defy/config/theme/colors.dart';
// import 'package:flutter/material.dart';

// class SearchScreen extends StatelessWidget {
//   final List<String> dashboardItems;

//   const SearchScreen({super.key, required this.dashboardItems});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back,
//                         color: AppColors.black), // Back button
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search...",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: AppColors.greyVeryLight,
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 16),
//                       ),
//                       onChanged: (query) {
//                         // Implement search logic if using a StatefulWidget
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: dashboardItems.length,
//                 itemBuilder: (context, index) {
//                   final item = dashboardItems[index];
//                   return ListTile(
//                     title: Text(item),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:defy/config/theme/colors.dart';
// import 'package:flutter/material.dart';

// class SearchScreen extends StatelessWidget {
//   final List<String> dashboardItems;

//   const SearchScreen({super.key, required this.dashboardItems});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColors.greyVeryLight,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back, color: AppColors.black),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "Search...",
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                               ),
//                             ),
//                             onChanged: (query) {
//                               // Implement search logic if using a StatefulWidget
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: dashboardItems.length,
//                 itemBuilder: (context, index) {
//                   final item = dashboardItems[index];
//                   return ListTile(
//                     title: Text(item),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import for iOS-style icons

class SearchScreen extends StatelessWidget {
  final List<String> dashboardItems;

  const SearchScreen({super.key, required this.dashboardItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.back, // iOS-style back button
                            color: AppColors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            onChanged: (query) {
                              // Implement search logic if using a StatefulWidget
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return ListTile(
                    title: Text(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
