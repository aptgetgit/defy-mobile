// --- Data Models (Place in separate files or at the top) ---

import 'package:flutter/material.dart';

import '../../../config/theme/colors.dart';

class Bid {
  final String userAvatarUrl; // Placeholder for image URL/asset
  final String userName;
  final String userSubtitle; // e.g., "abv flr", "+ more"
  final String bidAmount;    // e.g., "0.061 APT"
  final String equivalentValue; // e.g., "$2.90"

  Bid({
    required this.userAvatarUrl,
    required this.userName,
    required this.userSubtitle,
    required this.bidAmount,
    required this.equivalentValue,
  });
}

enum HistoryEventType { minted, burned, transfer, sale }

class HistoryItem {
  final String imageUrl; // Placeholder for image URL/asset
  final String title;    // e.g., "Minted", "Alienator 5243", "Voidman 73"
  final HistoryEventType eventType;
  final String timeAgo;  // e.g., "20s ago", "1 min ago"
  final String details;  // e.g., "From: 0x00...", "To: allan.avex"
  final String value;    // e.g., "$80.00", "$72.03"
  final String? secondaryValue; // e.g., "-$85" (Optional)

  HistoryItem({
    required this.imageUrl,
    required this.title,
    required this.eventType,
    required this.timeAgo,
    required this.details,
    required this.value,
    this.secondaryValue,
  });

  // Helper to get event text and color
  Map<String, dynamic> getEventDisplay() {
    switch (eventType) {
      case HistoryEventType.minted:
        return {'text': 'Minted', 'color': AppColors.green};
      case HistoryEventType.burned:
        return {'text': 'Burned', 'color': AppColors.orange};
      case HistoryEventType.transfer:
        return {'text': 'Transfer', 'color': AppColors.blue};
      case HistoryEventType.sale:
        return {'text': 'Sale', 'color': AppColors.red};
      default:
        return {'text': '', 'color': Colors.grey};
    }
  }
}

// --- End Data Models ---