import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
// import '../../../../core/logging/app_logger.dart';
// import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';

class CreateWalletSelectSeedPhraseScreen extends StatefulHookConsumerWidget {
  const CreateWalletSelectSeedPhraseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateWalletSelectSeedPhraseScreenState();
}

class _CreateWalletSelectSeedPhraseScreenState
    extends ConsumerState<CreateWalletSelectSeedPhraseScreen> {
  late Future<List<String>> mnemonicsFuture;

  @override
  void initState() {
    super.initState();
    // mnemonicsFuture = _getAllMnemonics();
  }

  // Future<List<String>> _getAllMnemonics() async {
  //   final GetAllMnemonicsUseCase getAllMnemonicsUseCase =
  //       ref.read(getAllMnemonicsUseCaseProvider);
  //   final List<String> mnemonics = await getAllMnemonicsUseCase.call();
  //   AppLogger.debug(
  //       'Fetched mnemonics: ${mnemonics.length}'); // Debug statement
  //   return mnemonics;
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Choose Seed Phrase'),
          centerTitle: true,
          leading: const Icon(
            PhosphorIconsBold.caretLeft,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  'Select in which Seedphrase you want to\ncreate wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: mnemonicsFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No mnemonics found.'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) =>
                            seedPhraseTile(
                          mnemonic: snapshot.data![index],
                          walletCount: 13,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget seedPhraseTile({required String mnemonic, required int walletCount}) =>
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(Assets.images.selectSeedPhraseScreen.path, height: 54),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Mnemonic: $mnemonic',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$walletCount wallets',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              '\$2320.02',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      );
}
