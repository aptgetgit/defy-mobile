import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/token_info/providers/price_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertBottomSheet extends ConsumerWidget {
  const AlertBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(priceAlertControllerProvider);

    return Container(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.025,
          vertical: context.screenHeight * 0.0125,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Limit',
              style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Choose any to set the limit to get notified if the\nselected criteria is satisfied",
              style: context.bodyMedium,
            ),
            ...[
              'Goes Over',
              'Goes Under',
              'Crosses',
              'Goes up more than',
              'Goes down more than'
            ].map(
              (type) => ListTile(
                title: Text(
                  type,
                  style: context.titleMedium,
                ),
                trailing: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    side: BorderSide(
                      width: 0.5,
                      style: BorderStyle.solid,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                    value: state.alertType == type,
                    shape: const CircleBorder(),
                    visualDensity: VisualDensity.compact,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.blue;
                      }
                      return Colors.white;
                    }),
                    checkColor: Colors.white,
                    onChanged: (bool? value) {
                      if (value == true) {
                        ref
                            .read(priceAlertControllerProvider.notifier)
                            .setAlertType(type);
                      }
                    },
                  ),
                ),
                onTap: () {
                  ref
                      .read(priceAlertControllerProvider.notifier)
                      .setAlertType(type);
                },
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Apply', style: context.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}