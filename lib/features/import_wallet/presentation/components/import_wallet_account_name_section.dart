import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/colors.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class WalletNameSection extends StatelessWidget {
  const WalletNameSection({
    required this.hasModifiedName,
    required this.isEditing,
    required this.importWalletState,
    required this.importWalletNotifier,
    super.key,
  });
  final bool hasModifiedName;
  final bool isEditing;
  final ImportWalletState importWalletState;
  final ImportWalletNotifier importWalletNotifier;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Name Your Wallet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Ex: Business, Personal, etc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: importWalletNotifier.navigateToNextSection,
                child: const Text(
                  'Skip for now',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('hasModifiedName', hasModifiedName))
      ..add(DiagnosticsProperty<bool>('isEditing', isEditing))
      ..add(
        DiagnosticsProperty<ImportWalletState>(
          'importWalletState',
          importWalletState,
        ),
      )
      ..add(
        DiagnosticsProperty<ImportWalletNotifier>(
          'importWalletNotifier',
          importWalletNotifier,
        ),
      );
  }
}
