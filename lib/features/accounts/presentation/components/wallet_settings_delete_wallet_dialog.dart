import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/domain/usecases/delete_aptos_account_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../../../common/presentation/widgets/custom_checkbox.dart';
import '../provider/choose_wallet_screen_provider.dart';

class DeleteWalletDialog extends ConsumerStatefulWidget {
  const DeleteWalletDialog(
      {required this.onCancel, required this.currentAccount, super.key});
  final void Function() onCancel;
  final AptosAccountWithMetadata currentAccount;

  @override
  DeleteWalletDialogState createState() => DeleteWalletDialogState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function()>.has('onCancel', onCancel))
      ..add(DiagnosticsProperty<AptosAccountWithMetadata>(
          'currentAccount', currentAccount));
  }
}

class DeleteWalletDialogState extends ConsumerState<DeleteWalletDialog> {
  bool isChecked = false;
  AptosAccountWithMetadata? selectedWallet;
  late Future<List<AptosAccountWithMetadata>> accountsFuture;

  @override
  void initState() {
    super.initState();
    // accountsFuture = _fetchAccounts();
  }

  Future<List<AptosAccountWithMetadata>> _fetchAccounts() async {
    final Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>
        either = await ref.watch(listAptosAccountsUseCaseProvider).call();
    return either.fold(
      (ExceptionWithStackTrace error) {
        AppLogger.error('Error loading accounts: $error');
        return <AptosAccountWithMetadata>[];
      },
      (Set<AptosAccountWithMetadata> accountsSet) => accountsSet.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DeleteAptosAccountUseCase deleteAptosAccountUseCase =
        ref.read(deleteAptosAccountUseCaseProvider);

    Future<void> deleteAccount() async {
      await deleteAptosAccountUseCase.call(
        accountAddress: widget.currentAccount.accountAddress,
      );
      ref.read(chooseWalletScreenNotifierProvider.notifier).updateIsUpdated();
      Navigator.of(context).pop();
      widget.onCancel();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
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
          // Row(
          //   children: <Widget>[
          //     CustomCheckbox(
          //       isChecked: isChecked,
          //       onTap: () {
          //         setState(() {
          //           isChecked = !isChecked;
          //         });
          //       },
          // ),
          // const SizedBox(width: 12),
          // const Text(
          //   'Transfer all assets to',
          //   style: TextStyle(
          //     color: AppColors.greyDark,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          //     const Spacer(),
          //     AnimatedSwitcher(
          //       duration: const Duration(milliseconds: 300),
          //       transitionBuilder:
          //           (Widget child, Animation<double> animation) =>
          //               FadeTransition(
          //         opacity: animation,
          //         child: SizeTransition(sizeFactor: animation, child: child),
          //       ),
          //       child: selectedWallet != null
          //           ? _buildSelectedWalletContainer(selectedWallet!)
          //           : Container(
          //               decoration: BoxDecoration(
          //                 color: AppColors.greyVeryLight,
          //                 borderRadius: BorderRadius.circular(20),
          //               ),
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 12,
          //                 vertical: 4,
          //               ),
          //               child: const Row(
          //                 children: <Widget>[
          //                   Text(
          //                     'Select Wallet',
          //                     style: TextStyle(
          //                       color: AppColors.greyLight,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                   SizedBox(width: 4),
          //                   Icon(
          //                     PhosphorIconsRegular.caretDown,
          //                     size: 16,
          //                     color: AppColors.greyLight,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(
              opacity: animation,
              child: SizeTransition(sizeFactor: animation, child: child),
            ),
            child: isChecked
                ? Container(
                    key: const ValueKey<String>('wallet_list'),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FutureBuilder<List<AptosAccountWithMetadata>>(
                      future: accountsFuture,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<AptosAccountWithMetadata>> snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          AppLogger.error(
                            'Error loading accounts: ${snapshot.error}',
                          );
                          return const Center(
                            child: Text('Error loading accounts'),
                          );
                        }
                        final List<AptosAccountWithMetadata> accounts =
                            snapshot.data ?? <AptosAccountWithMetadata>[];
                        if (accounts.isEmpty) {
                          return const Center(child: Text('No wallets found'));
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accounts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final AptosAccountWithMetadata account =
                                accounts[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedWallet = account;
                                  isChecked = false;
                                });
                              },
                              child: _buildWalletTile(
                                wallet: account,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: BlackButtonXL(
                  margin: EdgeInsets.zero,
                  onClick: widget.onCancel,
                  title: 'Cancel',
                  color: AppColors.greyVeryLight,
                  textColor: AppColors.greyDark,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(),
                // child: BlackButtonXL(
                //   margin: EdgeInsets.zero,
                //   onClick: deleteAccount,
                //   title: 'Remove',
                //   color: AppColors.red,
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletTile({
    required AptosAccountWithMetadata wallet,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 16,
              backgroundColor: AppColors.blue,
              child: Image.asset(
                Assets.images.smilingFaceWithHeartEyes.path,
                height: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  wallet.label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Balance: \$${wallet.label}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomCheckbox(isChecked: false, onTap: () {}),
          ],
        ),
      );

  Widget _buildSelectedWalletContainer(AptosAccountWithMetadata wallet) =>
      Container(
        constraints: const BoxConstraints(maxWidth: 132),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              maxRadius: 12,
              backgroundColor: AppColors.blue,
              child: Image.asset(
                Assets.images.smilingFaceWithHeartEyes.path,
                height: 16,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    wallet.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    wallet.label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isChecked', isChecked))
      ..add(
        DiagnosticsProperty<AptosAccountWithMetadata?>(
          'selectedWallet',
          selectedWallet,
        ),
      )
      ..add(
        DiagnosticsProperty<Future<List<AptosAccountWithMetadata>>>(
          'accountsFuture',
          accountsFuture,
        ),
      );
  }
}
