
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
import '../provider/choose_wallet_screen_provider.dart';

class WalletPaginationIndicator extends ConsumerWidget {
  const WalletPaginationIndicator({required this.accounts, super.key});
  final List<AptosAccountWithMetadata> accounts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(walletNotifierProvider).currentIndex;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          accounts.length < 5 ? accounts.length : 5,
          (int index) {
            final int totalItems = accounts.length;
            const int middle = 2;

            int visibleIndex = currentIndex + index - middle;

            if (totalItems < 5) {
              visibleIndex = index;
            } else {
              if (currentIndex < middle) {
                visibleIndex = index;
              } else if (currentIndex > totalItems - middle - 1) {
                visibleIndex = totalItems - 5 + index;
              }
            }

            final bool isCurrent = visibleIndex == currentIndex;
            final bool isFaded = visibleIndex < 0 || visibleIndex >= totalItems;
            final double opacity = isFaded
                ? 0.0
                : (index == 0 || index == 4) && totalItems >= 5
                    ? 0.5
                    : 1.0;

            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: opacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: EdgeInsets.all(isCurrent ? 7 : 5),
                decoration: BoxDecoration(
                  color: isCurrent ? AppColors.white : const Color(0xffe3e6ec),
                  shape: BoxShape.circle,
                ),
                child: isCurrent
                    ? Text(
                        '${visibleIndex + 1}',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(IterableProperty<AptosAccountWithMetadata>('accounts', accounts));
  }
}


