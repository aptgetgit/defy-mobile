import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class SortSheet extends StatelessWidget {
  
  const SortSheet({
    super.key,
    required this.isSortPriceButtonSelected,
    required this.isSortBalanceButtonSelected,
    required this.isSortAlphabetButtonSelected,
    required this.isSort24hrButtonSelected,
    required this.onPriceToggled,
    required this.onBalanceToggled,
    required this.onAlphabetToggled,
    required this.on24hrToggled,
    required this.onDismiss,
  });
  final bool isSortPriceButtonSelected;
  final bool isSortBalanceButtonSelected;
  final bool isSortAlphabetButtonSelected;
  final bool isSort24hrButtonSelected;
  final VoidCallback onPriceToggled;
  final VoidCallback onBalanceToggled;
  final VoidCallback onAlphabetToggled;
  final VoidCallback on24hrToggled;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(20),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ), // Adjust for safe area
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Sort', 
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: onDismiss, 
                  icon: const Icon(
                    PhosphorIconsBold.x, 
                    color: AppColors.greyLight, 
                    size: 24,
                  ),
                ),
              ],
            ),
            _buildSortButtons(),
            const Gap(16),
            _buildFilterSection(),
            const Gap(20),
            _buildApplyButton(context),
          ],
        ),
      ),
    ),
  );

  Widget _buildSortButtons() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: <Widget>[
          _buildSortButton(
            'Price',
            isSortPriceButtonSelected,
            onPriceToggled,
            const Icon(
              PhosphorIconsBold.trendUp,
              size: 16,
            ),
          ),
          const Gap(12),
          _buildSortButton(
            'Balance',
            isSortBalanceButtonSelected,
            onBalanceToggled,
          ),
          const Gap(12),
          _buildSortButton(
            'Alphabet Order',
            isSortAlphabetButtonSelected,
            onAlphabetToggled,
          ),
        ],
      ),
      const Gap(10),
      _buildSortButton(
        '24 hr price change',
        isSort24hrButtonSelected,
        on24hrToggled,
        null,
        150,
      ),
    ],
  );

  Widget _buildSortButton(
    String label,
    bool isSelected,
    VoidCallback onToggled, [
    Widget? icon,
    double? fixedWidth,
  ]) => FilledButton(
    style: FilledButton.styleFrom(
      backgroundColor: isSelected ? AppColors.blue : AppColors.greyVeryLight,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      fixedSize: fixedWidth != null ? Size(fixedWidth, 36) : null,
    ),
    onPressed: onToggled,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.greyLight,
          ),
        ),
        if (icon != null) ...[
          const Gap(4),
          IconTheme(
            data: IconThemeData(
              color: isSelected ? AppColors.white : AppColors.greyLight,
            ),
            child: icon,
          ),
        ],
      ],
    ),
  );

  Widget _buildFilterSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Filter',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      _buildFilterOption(r'Hide small balances (0.1$)'),
      _buildFilterOption('Filter spam tokens'),
    ],
  );

  Widget _buildFilterOption(String label) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        label, 
        style: const TextStyle(color: AppColors.greyLight),
      ),
      Checkbox(
        value: false,
        side: const BorderSide(color: AppColors.greyLight, width: 2),
        onChanged: (bool? value) {},
      ),
    ],
  );

  Widget _buildApplyButton(BuildContext context) => ElevatedButton(
    onPressed: onDismiss,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      minimumSize: const Size(double.infinity, 54),
    ),
    child: const Text(
      'Apply',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}