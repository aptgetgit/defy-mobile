import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/custom_check_box.dart';

class CategorySelectionPopup extends StatefulWidget {
  final List<Map<String, dynamic>> categories;
  final Function(Map<String, dynamic>) onCategorySelected;
  final VoidCallback onEnableNow;

  const CategorySelectionPopup({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.onEnableNow,
  });

  @override
  _CategorySelectionPopupState createState() => _CategorySelectionPopupState();
}

class _CategorySelectionPopupState extends State<CategorySelectionPopup> {
  int _selectedIndex = 0; // Track selected category index, default to 0

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Select Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(16), // Spacing

          // Category List with Custom Checkboxes
          ...widget.categories.map((category) {
            int index = widget.categories.indexOf(category);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(4), // Spacing
                  Text(
                    (category['items'] as List<dynamic>).join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              trailing: CustomCheckbox(
                isChecked: _selectedIndex == index,
                isRound: true,
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          }),
          const Gap(24), // Spacing

          // Enable Now Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Return the selected category through the navigator
                widget.onCategorySelected(widget.categories[_selectedIndex]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Enable Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Gap(16), // Spacing (for bottom padding)
        ],
      ),
    );
}