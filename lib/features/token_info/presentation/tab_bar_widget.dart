import 'package:defy/features/token_info/providers/token_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(tokensControllerProvider.notifier);

    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  title: 'About',
                  isSelected:
                      ref.watch(tokensControllerProvider).selectedTab == 0,
                  onTap: () => controller.selectTab(0),
                ),
                TabButton(
                  title: 'Activity',
                  isSelected:
                      ref.watch(tokensControllerProvider).selectedTab == 1,
                  onTap: () => controller.selectTab(1),
                ),
                TabButton(
                  title: 'Analytics',
                  isSelected:
                      ref.watch(tokensControllerProvider).selectedTab == 2,
                  onTap: () => controller.selectTab(2),
                ),
              ],
            ),
            const Row()
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
