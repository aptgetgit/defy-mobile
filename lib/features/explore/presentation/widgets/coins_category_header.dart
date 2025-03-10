import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CategoryHeader extends StatelessWidget {

  const CategoryHeader(this.title, this.onTap, {super.key});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 14, top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(PhosphorIcons.caretRight(), color: AppColors.blue, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
}
