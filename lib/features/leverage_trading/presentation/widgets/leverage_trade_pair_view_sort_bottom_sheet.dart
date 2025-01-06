import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LeverageTradePairViewSortBottomSheet extends ConsumerStatefulWidget {
  const LeverageTradePairViewSortBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LeverageTradePairViewSortBottomSheetState();
}

class _LeverageTradePairViewSortBottomSheetState
    extends ConsumerState<LeverageTradePairViewSortBottomSheet> {
  String selectedSortBy = '24h';
  bool isAscending = true;

  final List<Map<String, dynamic>> sortOptions = [
    {'key': 'price', 'name': 'Price'},
    {'key': '24h', 'name': '24h Change'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: sortOptions
                .map((option) => _buildSortOptionButton(option))
                .toList(),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop({
                  'sortBy': selectedSortBy,
                  'isAscending': isAscending,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              child: Text(
                'Apply',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortOptionButton(Map<String, dynamic> option) {
    bool isSelected = selectedSortBy == option['key'];

    return GestureDetector(
      onTap: () => _toggleSortOption(option['key']),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffe9f1fd) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              option['name'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Icon(
                isAscending
                    ? PhosphorIconsRegular.trendUp
                    : PhosphorIconsRegular.trendDown,
                size: 16,
                color: const Color(0xff2071ee),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _toggleSortOption(String key) {
    setState(() {
      if (selectedSortBy == key) {
        isAscending = !isAscending;
      } else {
        selectedSortBy = key;
        isAscending = true;
      }
    });
  }
}
