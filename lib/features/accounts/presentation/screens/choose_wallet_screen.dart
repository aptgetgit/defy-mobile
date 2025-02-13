import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/account/domain/usecases/list_aptos_account_usecase.dart';
import '../../../../shared/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../provider/choose_wallet_screen_provider.dart';


class ChooseWalletScreen extends ConsumerStatefulWidget {
  const ChooseWalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ChooseWalletScreenState();
}

class ChooseWalletScreenState extends ConsumerState<ChooseWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final ListAptosAccountsUseCase listAptosAccountsUseCase =
        ref.watch(listAptosAccountsUseCaseProvider);
    final Future<List<AptosAccountWithMetadata>> accountsFuture =
        listAptosAccountsUseCase.call();
    final int currentIndex = ref.watch(walletNotifierProvider).currentIndex;

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
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            PhosphorIconsBold.caretLeft,
            size: 24,
          ),
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
            child: FutureBuilder<List<AptosAccountWithMetadata>>(
              future: accountsFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<List<AptosAccountWithMetadata>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  AppLogger.error('Error loading accounts: ${snapshot.error}');
                  return const Center(child: Text('Error loading accounts'));
                }
                final List<AptosAccountWithMetadata> accounts =
                    snapshot.data ?? <AptosAccountWithMetadata>[];

                if (accounts.isEmpty) {
                  return const Center(child: Text('No wallets found'));
                }

                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: accounts.length - 2 > 1
                      ? Swiper(
                          key: const ValueKey<String>('multiple'),
                          itemBuilder: (BuildContext context, int index) => _buildWalletCard(accounts[index]),
                          itemCount: accounts.length,
                          itemWidth: MediaQuery.of(context).size.width * 0.95,
                          itemHeight: 200,
                          layout: SwiperLayout.STACK,
                          allowImplicitScrolling: true,
                          scrollDirection: Axis.vertical,
                          loop: true,
                        )
                      : Swiper(
                          itemBuilder: (BuildContext context, int index) => _buildWalletCard(accounts[0]),
                          itemCount: 1, 
                          itemWidth: MediaQuery.of(context).size.width * 0.95,
                          itemHeight: 200,
                          layout: SwiperLayout.CUSTOM, 
                          customLayoutOption: CustomLayoutOption(
                            startIndex: 0,
                            stateCount: 1, 
                          )..addTranslate(<Offset>[
                              Offset.zero, 
                            ]),
                          allowImplicitScrolling: true,
                          scrollDirection: Axis.vertical,
                          loop: false, 
                          // onIndexChanged: controller.updateIndex,
                        ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlackButtonXL(
              onClick: () {
                accountsFuture.then((List<AptosAccountWithMetadata> accounts) {
                  AppLogger.debug(
                    'Selected wallet: ${accounts[currentIndex].label}',
                  );
                });
              },
              title: 'Continue',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildWalletCard(AptosAccountWithMetadata account) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blue,
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/wallet-creation-wallet-background-wallet-component.png',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 110, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    account.label,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    _truncateAddress(account.accountAddress.toHex()),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  String _truncateAddress(String address) {
    if (address.length > 10) {
      return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
    }
    return address;
  }
}
