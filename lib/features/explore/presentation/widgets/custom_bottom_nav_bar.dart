import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            label: 'Sell',
            icon: PhosphorIcons.shoppingCart(),
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          _buildNavItem(
            label: 'Cart',
            icon: PhosphorIcons.tag(),
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          _buildNavItem(
            label: 'Orders',
            icon: PhosphorIcons.clipboardText(),
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          _buildNavItem(
            label: 'Spins',
            icon: PhosphorIcons.wallet(),
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.blue : Colors.white,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.greyDark,
              size: 24.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}