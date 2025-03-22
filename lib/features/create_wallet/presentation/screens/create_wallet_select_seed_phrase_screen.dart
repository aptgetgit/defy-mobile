import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/domain/usecases/get_accounts_from_mnemonic_usecase.dart';
import '../../../../shared/blockchain/account/domain/usecases/get_all_entropy_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import 'create_wallet_screen.dart';

class CreateWalletSelectSeedPhraseScreen extends StatefulHookConsumerWidget {
  const CreateWalletSelectSeedPhraseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateWalletSelectSeedPhraseScreenState();
}

class _CreateWalletSelectSeedPhraseScreenState
    extends ConsumerState<CreateWalletSelectSeedPhraseScreen> {
  late Future<List<(String, int, Uint8List)>> mnemonicsFuture;

  @override
  void initState() {
    super.initState();
    mnemonicsFuture = _getAllMnemonics();
  }

  Future<List<(String, int, Uint8List)>> _getAllMnemonics() async {
    try {
      AppLogger.debug('🔹 Starting seed phrase retrieval process');

      final GetAllEntropyUseCase getAllEntropyUseCase =
          ref.read(getAllEntropyUseCaseProvider);
      final GetAccountsFromMnemonicUseCase getAccountsFromMnemonicUseCase =
          ref.read(getAccountsFromMnemonicUseCaseProvider);

      final Either<ExceptionWithStackTrace, Set<Uint8List>> result =
          await getAllEntropyUseCase.call();

      return result.fold(
        (ExceptionWithStackTrace failure) {
          AppLogger.error('🔴 Failed to fetch entropy: ${failure.exception}');
          AppLogger.error('🔴 Stack trace: ${failure.stackTrace}');
          return <(String, int, Uint8List)>[];
        },
        (Set<Uint8List> entropySet) async {
          if (entropySet.isEmpty) {
            AppLogger.info('ℹ️ No seed phrases found in storage');
            return <(String, int, Uint8List)>[];
          }

          final List<(String, int, Uint8List)> seedPhrasesWithCounts =
              <(String, int, Uint8List)>[];

          for (final Uint8List entropy in entropySet) {
            try {
              AppLogger.debug('Processing entropy: ${entropy.length} bytes');
              final String entropyHex = entropy
                  .map((int byte) => byte.toRadixString(16).padLeft(2, '0'))
                  .join();
              AppLogger.debug('Entropy hex: $entropyHex');

              final Either<ExceptionWithStackTrace, DerivationPathToAccounts>
                  accountsResult = await getAccountsFromMnemonicUseCase.call(
                entropyHash: entropy,
              );

              accountsResult.fold(
                (ExceptionWithStackTrace failure) {
                  AppLogger.error(
                    '🔴 Error getting accounts for entropy: ${failure.exception}',
                  );
                  AppLogger.error('🔴 Stack trace: ${failure.stackTrace}');
                },
                (DerivationPathToAccounts accounts) {
                  final int walletCount = accounts.values
                      .expand((List<AptosAccountWithMetadata> list) => list)
                      .length;

                  seedPhrasesWithCounts
                      .add(('Seed Phrase', walletCount, entropy));
                },
              );
            } on Exception catch (e, stackTrace) {
              AppLogger.error('🔴 Error processing entropy: $e');
              AppLogger.error('🔴 Stack trace: $stackTrace');
              continue;
            }
          }
          final List<(String, int, Uint8List)> numberedSeedPhrases =
              seedPhrasesWithCounts
                  .asMap()
                  .entries
                  .map(
                    (MapEntry<int, (String, int, Uint8List)> entry) => (
                      'Seedphrase ${entry.key + 1}',
                      entry.value.$2,
                      entry.value.$3
                    ),
                  )
                  .toList();

          AppLogger.debug(
            '✅ Successfully retrieved ${numberedSeedPhrases.length} seed phrases with wallet counts',
          );
          return numberedSeedPhrases;
        },
      );
    } on Exception catch (e, stackTrace) {
      AppLogger.error('🔴 Unexpected error in _getAllMnemonics: $e');
      AppLogger.error('🔴 Stack trace: $stackTrace');
      return <(String, int, Uint8List)>[];
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Choose Seed Phrase'),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              PhosphorIconsBold.caretLeft,
            ),
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
                child: FutureBuilder<List<(String, int, Uint8List)>>(
                  future: mnemonicsFuture,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<(String, int, Uint8List)>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      AppLogger.error('Error: ${snapshot.error}');
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return ListView(
                        children: <Widget>[
                          const Center(child: Text('No mnemonics found.')),
                          const SizedBox(height: 16),
                          createNewTile(),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < snapshot.data!.length) {
                            return seedPhraseTile(
                              seedPhrase: snapshot.data![index].$1,
                              walletCount: snapshot.data![index].$2,
                              entropy: snapshot.data![index].$3,
                            );
                          } else {
                            return createNewTile();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget seedPhraseTile({
    required String seedPhrase,
    required int walletCount,
    required Uint8List entropy,
  }) =>
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8),
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
                  seedPhrase,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  walletCount == 1
                      ? '$walletCount wallet'
                      : '$walletCount wallets',
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
              r'$2320.02',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      );

  Widget createNewTile() => GestureDetector(
    onTap: () {
      Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const CreateWalletScreen(),
      ),);
    },
    child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  PhosphorIconsBold.plus,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Create New',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'A new keyless account will be generated ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
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
    properties.add(
      DiagnosticsProperty<Future<List<(String, int, Uint8List)>>>(
        'mnemonicsFuture',
        mnemonicsFuture,
      ),
    );
  }
}
