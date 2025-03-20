import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/wallet_pagination_indicator.dart';
import '../components/wallet_swiper.dart';
import '../provider/choose_wallet_screen_provider.dart';

class ChooseWalletScreen extends ConsumerWidget {
  const ChooseWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future<Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>
        accountsFuture = ref.watch(listAptosAccountsUseCaseProvider).call();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Wallet',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(PhosphorIconsBold.caretLeft, size: 24),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Swipe to choose the wallet. You can change them anytime',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FutureBuilder<
                Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>(
              future: accountsFuture,
              builder: (
                BuildContext context,
                AsyncSnapshot<
                        Either<ExceptionWithStackTrace,
                            Set<AptosAccountWithMetadata>>>
                    snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  AppLogger.error('Error loading accounts: ${snapshot.error}');
                  return const Center(child: Text('Error loading accounts'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: Text('No data available'));
                }

                // Handle the Either
                return snapshot.data!.fold(
                  (ExceptionWithStackTrace error) {
                    AppLogger.error(
                      'Error loading accounts: ${error.exception}',
                    );
                    return const Center(child: Text('Error loading accounts'));
                  },
                  (Set<AptosAccountWithMetadata> accountsSet) {
                    final List<AptosAccountWithMetadata> accounts =
                        accountsSet.toList();

                    if (accounts.isEmpty) {
                      return const Center(child: Text('No wallets found'));
                    }

                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: WalletSwiper(accounts: accounts),
                        ),
                        const SizedBox(height: 20),
                        WalletPaginationIndicator(accounts: accounts),
                        const SizedBox(height: 32),
                        Consumer(
                          builder: (
                            BuildContext context,
                            WidgetRef ref,
                            Widget? child,
                          ) {
                            final int currentIndex =
                                ref.watch(walletNotifierProvider).currentIndex;

                            return Text(
                              currentIndex == 0
                                  ? ''
                                  : 'You can shift from these wallet anytime',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyLight,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: BlackButtonXL(
                            onClick: () {
                              if (accounts.isNotEmpty) {
                                AppLogger.debug(
                                  'Selected wallet: ${accounts[0].label}',
                                );
                              }
                            },
                            title: 'Continue',
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
