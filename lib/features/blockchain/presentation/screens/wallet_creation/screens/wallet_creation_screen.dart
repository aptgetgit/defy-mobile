import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_stage_one.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_stage_three.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_stage_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WalletCreationScreen extends ConsumerStatefulWidget {
  const WalletCreationScreen({super.key});

  @override
  ConsumerState<WalletCreationScreen> createState() =>
      _WalletCreationScreenState();
}

class _WalletCreationScreenState extends ConsumerState<WalletCreationScreen> {
  @override
  Widget build(BuildContext context) {
    final page = ref.watch(walletCreationStageProvider);
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {},
        controller: page.controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          WalletCreationStageOne(),
          WalletCreationStageTwo(),
          WalletCreationStageThree(),
        ],
      ),
    );
  }
}
