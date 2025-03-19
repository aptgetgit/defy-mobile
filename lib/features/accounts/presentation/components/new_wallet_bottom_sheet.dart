import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/navigation/routes/router.dart';

class NewWalletBottomSheet extends ConsumerStatefulWidget {
  const NewWalletBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      NewWalletBottomSheetState();
}

class NewWalletBottomSheetState extends ConsumerState<NewWalletBottomSheet> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 8),
                      const Icon(PhosphorIconsBold.appWindow, size: 24),
                      const SizedBox(width: 20),
                      const Text(
                        'New Wallet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(PhosphorIconsBold.x),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      await const CreateWalletSelectSeedPhraseScreenRoute()
                          .push<void>(context);
                    },
                    child: const NewWalletTile(
                      color: AppColors.blue,
                      icon: PhosphorIconsRegular.plusSquare,
                      heading: 'Create wallet',
                      subheading: 'Click to create a new wallet',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const NewWalletTile(
                    color: AppColors.magenta,
                    icon: PhosphorIconsRegular.key,
                    heading: 'Import Private Key',
                    subheading: 'Import existing wallet using private key',
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      await const ImportWalletScreenRoute().push<void>(context);
                    },
                    child: const NewWalletTile(
                      color: AppColors.orangeWarning,
                      icon: PhosphorIconsRegular.password,
                      heading: 'Import Seed phrase',
                      subheading: 'Import existing wallet using Seed Phrase',
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
}

class NewWalletTile extends StatelessWidget {
  const NewWalletTile(
      {required this.color,
      required this.heading,
      required this.icon,
      required this.subheading,
      super.key});
  final Color color;
  final IconData icon;
  final String heading;
  final String subheading;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(heading,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              Text(subheading,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight)),
            ],
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(DiagnosticsProperty<IconData>('icon', icon));
  }
}
