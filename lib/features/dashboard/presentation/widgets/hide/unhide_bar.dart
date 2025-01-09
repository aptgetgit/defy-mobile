import 'dart:ui';
import 'package:defy/features/dashboard/presentation/screens/more_options_screen.dart';
import 'package:flutter/material.dart';

class Hidebar extends StatelessWidget {
  final Function(int) onItemSelected;

  const Hidebar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: MediaQuery.of(context).size.width / 2 - 172.5,
      child: Container(
        width: 285,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF252525),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.sort, 0),
            _buildNavItem(Icons.star_border, 1),
            _buildNavItem(Icons.remove_red_eye_outlined, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildOptionItem(
      BuildContext context, String imagePath, String title) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth * 0.8;

    return Container(
      width: itemWidth,
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (title == 'More') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoreOptionsScreen(),
              ),
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
