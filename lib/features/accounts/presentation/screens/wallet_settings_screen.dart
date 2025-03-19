import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../../shared/account/presentation/providers/usecase_provider.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../../../common/presentation/widgets/custom_checkbox.dart';
// import '../provider/customize_wallet_provider.dart';
// import '../state/customize_wallet_state.dart';
import '../util/helpers.dart';
import 'wallet_settings_customize_wallet_screen.dart';
import 'wallet_settings_security_screen.dart';

class WalletSettingsScreen extends ConsumerStatefulWidget {
  const WalletSettingsScreen({required this.account, super.key});
  final AptosAccountWithMetadata account;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletSettingsScreenState();
}

class WalletSettingsScreenState extends ConsumerState<WalletSettingsScreen> {
  bool _isDialogVisible = false;

  void _toggleDeleteDialog() {
    setState(() {
      _isDialogVisible = !_isDialogVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Future<AptosAccountWithMetadata?> accountFuture =
        ref.watch(getAptosAccountUseCaseProvider).call(
              accountAddress: widget.account.accountAddress,
            );

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(PhosphorIconsRegular.caretLeft)),
        centerTitle: true,
        title: const Text('Wallet'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(PhosphorIconsRegular.cardholder),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<AptosAccountWithMetadata?>(
        future: accountFuture,
        builder: (BuildContext context,
            AsyncSnapshot<AptosAccountWithMetadata?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading account'));
          }
          final AptosAccountWithMetadata? account = snapshot.data;
          if (account == null) {
            return const Center(child: Text('Account not found'));
          }

          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildWalletCard(account),
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
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                WalletSettingsSecurityScreen(
                              accountAddress: account.accountAddress,
                            ),
                          ),
                        );
                      },
                    ),
                    _buildWalletSettingsItem(
                      title: 'Manage',
                      icon: PhosphorIconsRegular.atom,
                      onTap: () async {
                        await const WalletSettingsManageScreenRoute()
                            .push<void>(context);
                      },
                    ),
                    _buildWalletSettingsItem(
                      title: 'Set as Default',
                      icon: PhosphorIconsRegular.gearSix,
                    ),
                    _buildWalletSettingsItem(
                      title: 'Customize Wallet',
                      icon: PhosphorIconsRegular.palette,
                      onTap: () async {
                        final bool? result = await Navigator.of(context).push(
                          MaterialPageRoute<bool>(
                            builder: (BuildContext context) =>
                                WalletSettingsCustomizeWalletScreen(
                              account: account,
                            ),
                          ),
                        );

                        if ((result ?? false) == true) {
                          setState(() {
                            ref.refresh(getAptosAccountUseCaseProvider);
                          });
                        }
                      },
                    ),
                    _buildWalletSettingsItem(
                      title: 'Aptos Connect',
                      icon: PhosphorIconsRegular.palette,
                    ),
                    const Spacer(),
                    BlackButtonXL(
                      horizontalPadding: false,
                      margin: EdgeInsets.zero,
                      onClick: _toggleDeleteDialog,
                      title: 'Delete Wallet',
                      color: const Color(0xffFFE1E1),
                      textColor: AppColors.red,
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _isDialogVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: _isDialogVisible
                    ? Align(
                        child: DeleteWalletDialog(
                          onCancel: _toggleDeleteDialog,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildWalletCard(AptosAccountWithMetadata account) => Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: account.backgroundColor,
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/wallet-creation-wallet-background-wallet-component.png',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: 30,
              left: 34,
              child: CachedNetworkImage(
                imageUrl: account.iconUri.toString(),
                height: 40,
              ),
            ),
            Row(
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
                        truncateAddress(account.accountAddress.toHex()),
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
          ],
        ),
      );

  Widget _buildWalletSettingsItem({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
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
        ),
      );
}

class DeleteWalletDialog extends ConsumerStatefulWidget {
  const DeleteWalletDialog({required this.onCancel, super.key});
  final void Function() onCancel;

  @override
  DeleteWalletDialogState createState() => DeleteWalletDialogState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ObjectFlagProperty<void Function()>.has('onCancel', onCancel));
  }
}

class DeleteWalletDialogState extends ConsumerState<DeleteWalletDialog> {
  bool isChecked = false;
  AptosAccountWithMetadata? selectedWallet;

  @override
  Widget build(BuildContext context) {
    final Future<List<AptosAccountWithMetadata>> accountsFuture =
        ref.watch(listAptosAccountsUseCaseProvider).call();

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
              const SizedBox(width: 12),
              const Text(
                'Transfer all assets to',
                style: TextStyle(
                  color: AppColors.greyDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        FadeTransition(
                  opacity: animation,
                  child: SizeTransition(sizeFactor: animation, child: child),
                ),
                child: selectedWallet != null
                    ? _buildSelectedWalletContainer(selectedWallet!)
                    : Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
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
                            SizedBox(width: 4),
                            Icon(
                              PhosphorIconsRegular.caretDown,
                              size: 16,
                              color: AppColors.greyLight,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                child: BlackButtonXL(
                  margin: EdgeInsets.zero,
                  onClick: widget.onCancel,
                  title: 'Remove',
                  color: AppColors.red,
                ),
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
      ..add(DiagnosticsProperty<AptosAccountWithMetadata?>(
          'selectedWallet', selectedWallet));
  }
}
