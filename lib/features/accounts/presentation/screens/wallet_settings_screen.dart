import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../../../common/presentation/widgets/custom_checkbox.dart';

class WalletSettingsScreen extends ConsumerStatefulWidget {
  const WalletSettingsScreen({required this.walletCard, super.key});
  final Widget walletCard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletSettingsScreenState();
}

class WalletSettingsScreenState extends ConsumerState<WalletSettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Icon(PhosphorIconsRegular.caretLeft),
          centerTitle: true,
          title: const Text('Wallet'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(PhosphorIconsRegular.cardholder),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/wallet-settings'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.walletCard,
              const SizedBox(height: 32),
              const Row(
                children: <Widget>[
                  Icon(
                    PhosphorIconsRegular.appWindow,
                    color: AppColors.greyLight,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Wallet Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Divider(
                color: AppColors.divider,
                thickness: 2,
              ),
              const SizedBox(height: 4),
              _buildWalletSettingsItem(
                title: 'Security',
                icon: PhosphorIconsRegular.arrowCircleUpRight,
              ),
              _buildWalletSettingsItem(
                title: 'Manage',
                icon: PhosphorIconsRegular.atom,
              ),
              _buildWalletSettingsItem(
                title: 'Set as Default',
                icon: PhosphorIconsRegular.gearSix,
              ),
              _buildWalletSettingsItem(
                title: 'Customize Wallet',
                icon: PhosphorIconsRegular.palette,
              ),
              _buildWalletSettingsItem(
                title: 'Aptos Connect',
                icon: PhosphorIconsRegular.palette,
              ),
              const Spacer(),
              BlackButtonXL(
                onClick: () => _showDeleteDialog(context),
                title: 'Delete Wallet',
                color: const Color(0xffFFE1E1),
                textColor: AppColors.red,
              ),
            ],
          ),
        ),
      );

  Widget _buildWalletSettingsItem({
    required String title,
    required IconData icon,
  }) =>
      Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 32),
        child: Row(
          children: <Widget>[
            Icon(icon, color: AppColors.black, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            const Icon(
              PhosphorIconsBold.caretRight,
              size: 20,
              color: AppColors.greyLight,
            ),
          ],
        ),
      );

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => const DeleteWalletDialog(),
    );
  }
}

class DeleteWalletDialog extends ConsumerStatefulWidget {
  const DeleteWalletDialog({super.key});

  @override
  DeleteWalletDialogState createState() => DeleteWalletDialogState();
}

class DeleteWalletDialogState extends ConsumerState<DeleteWalletDialog> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Remove Business Wallet?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your assets will be removed along with this wallet until you import the wallet again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.greyDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  CustomCheckbox(
                    isChecked: isChecked,
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Transfer all assets to',
                    style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: const Row(
                      children: <Widget>[
                        Text(
                          'Select Wallet',
                          style: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          PhosphorIconsRegular.caretDown,
                          size: 20,
                          color: AppColors.greyLight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isChecked', isChecked));
  }
}
