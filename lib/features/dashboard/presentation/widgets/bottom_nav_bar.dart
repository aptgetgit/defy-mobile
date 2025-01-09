import 'dart:ui';
import 'package:defy/features/dashboard/presentation/screens/more_options_screen.dart';
import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  final Function(int) onItemSelected;

  const FloatingNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: MediaQuery.of(context).size.width / 2 - 172.5,
      child: Container(
        width: 345,
        height: 58,
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
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.explore, 1),
            _buildCenterNavItem(Icons.keyboard_double_arrow_up, 2, context),
            _buildNavItem(Icons.wallet, 3),
            _buildNavItem(Icons.question_answer, 4),
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

  Widget _buildCenterNavItem(IconData icon, int index, BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalSheet(context),
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white30,
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6, // Adjusted size to move it upwards
              maxChildSize: 0.8, // Maximum size when fully expanded
              minChildSize: 0.4,
              builder: (context, scrollController) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 16.0),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOptionItem(
                              context, 'assets/icons/Buy-logo.png', 'Buy'),
                          const SizedBox(height: 10),
                          _buildOptionItem(
                              context, 'assets/icons/send-logo.png', 'Send'),
                          const SizedBox(height: 10),
                          _buildOptionItem(context,
                              'assets/icons/receive-logo.png', 'Receive'),
                          const SizedBox(height: 10),
                          _buildOptionItem(
                              context, 'assets/icons/swap-logo.png', 'Swap'),
                          const SizedBox(height: 10),
                          _buildOptionItem(
                              context, 'assets/icons/more-logo.png', 'More'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
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
