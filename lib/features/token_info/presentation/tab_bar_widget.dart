import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/token_info_controller.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TokensController controller = ref.read(tokensControllerProvider.notifier);

    return Material(
      color: Colors.white,
      child: ColoredBox(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            const Row(),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {

  const TabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
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
