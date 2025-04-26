import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../models/info_model.dart';
// Import your data models if they are in separate files
// import 'models/bid.dart';
// import 'models/history_item.dart';

class OrderPage extends StatelessWidget {
  // --- End Placeholder Data ---


  OrderPage({super.key});
  // --- Placeholder Data (Replace with actual data passed to the widget) ---
  final String itemName = 'Wapal';
  final String expiryInfo = 'Ends on Nov 03, 2023 at 2:40 PM IST';
  final String hours = '01';
  final String minutes = '22';
  final String seconds = '02';
  final String price = '1221.34 APT';

  final List<Bid> bids = <Bid>[
    Bid(userAvatarUrl: '', userName: 'Jasmine', userSubtitle: 'abv flr', bidAmount: '0.061 APT', equivalentValue: r'$2.90'),
    Bid(userAvatarUrl: '', userName: 'Jasmine', userSubtitle: '+ more', bidAmount: '0.061 APT', equivalentValue: r'$2.90'),
    Bid(userAvatarUrl: '', userName: 'Jasmine', userSubtitle: '+ more', bidAmount: '0.061 APT', equivalentValue: r'$2.90'),
    Bid(userAvatarUrl: '', userName: 'Jasmine', userSubtitle: '+ more', bidAmount: '0.061 APT', equivalentValue: r'$2.90'),
  ];

  final List<HistoryItem> history = <HistoryItem>[
     HistoryItem(imageUrl: '', title: '', eventType: HistoryEventType.minted, timeAgo: '20s ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$80.00', secondaryValue: r'~$85'),
     HistoryItem(imageUrl: '', title: '', eventType: HistoryEventType.minted, timeAgo: '20s ago', details: 'By: 0x00...0902', value: r'$80.00'),
     HistoryItem(imageUrl: '', title: 'Mona Lizz 8231', eventType: HistoryEventType.minted, timeAgo: '20s ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$72.03'),
     HistoryItem(imageUrl: '', title: 'Alienator 5243', eventType: HistoryEventType.burned, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$90.00'),
     HistoryItem(imageUrl: '', title: 'Alienator 5243', eventType: HistoryEventType.burned, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$90.00'),
     HistoryItem(imageUrl: '', title: 'Voidman 73', eventType: HistoryEventType.transfer, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$200.09'),
     HistoryItem(imageUrl: '', title: 'Alienator 5243', eventType: HistoryEventType.burned, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$90'), // Note: Original image has inconsistent $ sign
     HistoryItem(imageUrl: '', title: 'Chad bad 329', eventType: HistoryEventType.transfer, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$240.20'),
     HistoryItem(imageUrl: '', title: 'Cheems 309', eventType: HistoryEventType.sale, timeAgo: '1 min ago', details: 'From: 0x00...0902\nTo: allan.avex', value: r'$70.23'),
  ]; // Add constructor parameters if passing data


  // --- Helper Build Methods ---

  Widget _buildSectionHeader(String title) => Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );

  Widget _buildTimerSegment(String value, String label) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.greyLight,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

  Widget _buildBidRow(Bid bid) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepPurple.shade100, // Placeholder color
            // backgroundImage: NetworkImage(bid.userAvatarUrl), // Use NetworkImage for URLs
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bid.userName,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                if (bid.userSubtitle.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 2),
                  Text(
                    bid.userSubtitle,
                    style: const TextStyle(fontSize: 14, color: AppColors.blue),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                bid.bidAmount,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: 2),
              Text(
                bid.equivalentValue,
                 style: const TextStyle(fontSize: 15, color: AppColors.greyLight),
              ),
            ],
          ),
        ],
      ),
    );

   Widget _buildHistoryRow(HistoryItem item) {
    final Map<String, dynamic> eventDisplay = item.getEventDisplay();
    
    // Define icons for each event type
    IconData getEventIcon(HistoryEventType type) {
      switch (type) {
        case HistoryEventType.minted:
          return PhosphorIconsFill.sparkle;
        case HistoryEventType.burned:
          return PhosphorIconsFill.flame;
        case HistoryEventType.transfer:
          return PhosphorIconsFill.arrowsLeftRight;
        case HistoryEventType.sale:
          return PhosphorIconsFill.tag;
        default:
          return PhosphorIconsFill.sparkle;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
             borderRadius: BorderRadius.circular(8),
             child: Container(
                width: 48,
                height: 48,
                color: Colors.grey.shade300, // Placeholder
                // child: Image.network(item.imageUrl, fit: BoxFit.cover), // Use NetworkImage
             ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 // Combine title and event type based on context
                Text.rich(
                   TextSpan(
                     children: <InlineSpan>[
                        // Show title prominently unless it's just Minted/Burned
                        if (item.eventType != HistoryEventType.minted && item.eventType != HistoryEventType.burned)
                            TextSpan(text: '${item.title}  ', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                        
                        // Icon for the event type
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              getEventIcon(item.eventType),
                              size: 14,
                              color: eventDisplay['color'] as Color,
                            ),
                          ),
                        ),
                        
                        // Event type with specific color
                        TextSpan(
                            text: eventDisplay['text'].toString(),
                            style: TextStyle(
                                color: eventDisplay['color'] as Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                            ),
                         ),
                     ],
                   ),
                ),

                const SizedBox(height: 4),
                Text(
                  item.details,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.3),
                ),
                 const SizedBox(height: 4),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                item.value,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              if (item.secondaryValue != null) ...<Widget>[
                const SizedBox(height: 2),
                Text(
                  item.secondaryValue!,
                   style: const TextStyle(fontSize: 14, color: AppColors.greyLight), // Example secondary color
                ),
              ],
                Text(
                  item.timeAgo,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
            ],
          ),
        ],
      ),
    );
  }


  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) =>
    // Using SingleChildScrollView allows content to scroll if it overflows
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // --- Top Section: Listed At ---
          _buildSectionHeader('LISTED AT'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded( // Allow text to wrap if needed
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 32,
                        height: 32,
                        color: Colors.grey.shade300, // Placeholder color
                        // child: Image.network(item.imageUrl, fit: BoxFit.cover), // Use NetworkImage
                      ),
                    ),
                    Gap(10.w),
                    Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           itemName,
                           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                         ),
                         Text(
                           expiryInfo,
                           style: const TextStyle(fontSize: 14, color: AppColors.greyLight),
                         ),
                       ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(PhosphorIconsRegular.share, size: 20), // External link icon
                color: AppColors.greyLight,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  // TODO: Implement action for the icon button (e.g., open link)
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 73.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row( // Group timer segments
                  children: <Widget>[
                    _buildTimerSegment(hours, 'Hours'),
                    const SizedBox(width: 15),
                    _buildTimerSegment(minutes, 'Minutes'),
                    const SizedBox(width: 15),
                    _buildTimerSegment(seconds, 'Seconds'),
                  ],
                ),
                Column( // Price Column
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                       Text(
                         price,
                         style: const TextStyle(
                           fontSize: 16, // Slightly smaller than timer numbers
                           fontWeight: FontWeight.w600,
                           color: Colors.black,
                         ),
                       ),
                       const SizedBox(height: 2),
                       const Text(
                         'PRICE',
                         style: TextStyle(
                           fontSize: 11,
                           color: AppColors.greyLight,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                    ],
                ),
              ],
            ),
          ),
      
          // --- Bids Section ---
          _buildSectionHeader('BIDS RECEIVED'),
          // Use Column for moderate lists, ListView.builder for potentially long lists
          Column(
            children: bids.map((Bid bid) => _buildBidRow(bid)).toList(),
          ),
      
      
          // --- History Section ---
          _buildSectionHeader('HISTORY'),
          Column(
            children: history.map(_buildHistoryRow).toList(),
          ),
      
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }
