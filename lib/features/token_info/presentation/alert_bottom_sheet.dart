import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';
import '../providers/price_alert_controller.dart';

class AlertBottomSheet extends ConsumerWidget {
  const AlertBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PriceAlertState state = ref.watch(priceAlertControllerProvider);

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
          children: <Widget>[
            const Text(
              'Limit',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const Gap(4),
            const Text(
              'Choose any to set the limit to get notified if the\nselected criteria is satisfied',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.greyLight,
              ),
            ),
            ...<String>[
              'Goes Over',
              'Goes Under',
              'Crosses',
              'Goes up more than',
              'Goes down more than',
            ].map(
              (String type) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  type,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Transform.scale(
                  scale: 1.2,
                  child: CustomCheckbox(
                    isRound: true,
                    isChecked: state.alertType == type,
                    onTap: () {
                      ref
                          .read(priceAlertControllerProvider.notifier)
                          .setAlertType(type);
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
                Navigator.pop(context);
              },
              child: const Text('Apply', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
