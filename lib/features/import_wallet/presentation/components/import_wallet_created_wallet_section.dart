import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class ImportWalletCreatedWalletSection extends StatefulHookConsumerWidget {
  const ImportWalletCreatedWalletSection(
      {required this.state, required this.notifier, super.key});
  final ImportWalletState state;
  final ImportWalletNotifier notifier;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportWalletCreatedWalletSectionState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ImportWalletState>('state', state))
      ..add(DiagnosticsProperty<ImportWalletNotifier>('notifier', notifier));
  }
}

class _ImportWalletCreatedWalletSectionState
    extends ConsumerState<ImportWalletCreatedWalletSection> {
  @override
  Widget build(BuildContext context) => const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Creating Keyless Wallet😇',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 420),
              Center(
                child: Text(
                  'Hold on! Your personalized wallet \nis being created',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}
