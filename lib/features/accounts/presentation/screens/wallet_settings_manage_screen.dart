import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class WalletSettingsManageScreen extends ConsumerStatefulWidget {
  const WalletSettingsManageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletSettingsManageScreenState();
}

class _WalletSettingsManageScreenState
    extends ConsumerState<WalletSettingsManageScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(PhosphorIconsRegular.caretLeft),
          ),
          centerTitle: true,
          title: const Text('Manage'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(PhosphorIconsRegular.gear),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Icon(
                    PhosphorIconsRegular.lockOpen,
                    color: AppColors.greyLight,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Manage Wallet',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: AppColors.divider,
                thickness: 3,
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Receiving NFTs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    HookBuilder(
                      builder: (BuildContext context) {
                        final ValueNotifier<bool> isSwitched = useState(false);

                        return Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: isSwitched.value,
                            onChanged: (bool value) {
                              isSwitched.value = value;
                            },
                            activeColor: const Color(0xffe9e9ea),
                            inactiveTrackColor: const Color(0xffe9e9ea),
                            thumbColor:
                                WidgetStateProperty.all(AppColors.white),
                            trackOutlineColor:
                                WidgetStateProperty.all(Colors.transparent),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: <Widget>[
                    Text(
                      'Apps Connected',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      PhosphorIconsRegular.caretRight,
                      color: AppColors.greyLight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: <Widget>[
                    Text(
                      'Notifications ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      PhosphorIconsRegular.caretRight,
                      color: AppColors.greyLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
