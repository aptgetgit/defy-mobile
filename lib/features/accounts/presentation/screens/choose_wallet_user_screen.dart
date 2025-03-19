import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../components/new_wallet_bottom_sheet.dart';
import '../components/wallet_pagination_indicator.dart';
import '../components/wallet_swiper.dart';
import '../provider/choose_wallet_screen_provider.dart';

class ChooseWalletUserScreen extends ConsumerStatefulWidget {
  const ChooseWalletUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseWalletUserScreenState();
}

class _ChooseWalletUserScreenState
    extends ConsumerState<ChooseWalletUserScreen> {
  @override
  Widget build(BuildContext context) {
    final Future<Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>
    accountsFuture = ref.watch(listAptosAccountsUseCaseProvider).call();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: AppColors.pink,
              child: Image.asset(
                Assets.images.slightlySmilingFace.path,
                height: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Allan Jerrold',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'aj_22',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  r'$1582.2',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Text(
                  'Choose Wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  maxRadius: 16,
                  child: Icon(PhosphorIconsBold.cardsThree, size: 20),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () async => showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (BuildContext context) =>
                        const NewWalletBottomSheet(),
                  ),
                  child: const CircleAvatar(
                    maxRadius: 16,
                    child: Icon(
                      PhosphorIconsBold.plus,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Long Press on cards to open Wallet info',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FutureBuilder<
              Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
            >(
              future: accountsFuture,
              builder: (
                BuildContext context,
                AsyncSnapshot<
                  Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
                >
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
                          child: WalletSwiper(
                            accounts: accounts,
                            allowLongPress: true,
                          ),
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
                        Consumer(
                          builder: (
                            BuildContext context,
                            WidgetRef ref,
                            Widget? child,
                          ) {
                            final int currentIndex =
                                ref.watch(walletNotifierProvider).currentIndex;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Enter ${accounts[currentIndex].label}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        maxRadius: 16,
                                        backgroundColor: AppColors.blue,
                                        child: Image.asset(
                                          Assets.images.starStruck.path,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
