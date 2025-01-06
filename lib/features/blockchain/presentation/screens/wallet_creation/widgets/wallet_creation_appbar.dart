import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WalletCreationAppBar extends StatelessWidget {
  final int index;
  final bool walletCreated;
  const WalletCreationAppBar({
    super.key,
    required this.index,
    this.walletCreated = false,
  });

  @override
  Widget build(BuildContext context) {
    if (walletCreated) {
      return AppBar(
        centerTitle: true,
        leading: Container(),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Created Wallet ',
            ),
            const Icon(
              PhosphorIconsFill.checkCircle,
              color: Colors.green,
              size: 20,
            )
          ],
        ).animate().scale(duration: 600.microseconds),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 27),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(36),
                      Text(
                        'Discard Wallet',
                      ),
                      const Gap(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Are you sure you want stop Creating and Discard this wallet?',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Gap(25),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: colorFromHex('#F4F4F6'),
                                  // foregroundColor: colorFromHex('#646D80'),
                                ),
                                onPressed: () {},
                                child: const Text('Cancel'),
                              ),
                            ),
                            const Gap(25),
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorFromHex('#2071EE'),
                                ),
                                onPressed: () {
                                },
                                child: const Text('Discard'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(PhosphorIcons.x(PhosphorIconsStyle.bold), size: 20),
          ),
          const Gap(14),
        ],
      );
    }
    return AppBar(
      centerTitle: true,
      title: Consumer(builder: (context, ref, child) {
        final page = ref.watch(walletCreationStageProvider);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 1; i <= 3; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                height: index == i ? 6 : 4,
                width: index == i ? 65 : 40,
                decoration: BoxDecoration(
                  color: index >= i ? Colors.green : Colors.grey,
                  borderRadius:
                      BorderRadius.circular(page.stage.index + 1 == i ? 3 : 2),
                ),
              ),
          ],
        );
      }),
      actions: [
        Icon(PhosphorIcons.x(PhosphorIconsStyle.bold), size: 21),
        const Gap(16),
      ],
    );
  }
}
