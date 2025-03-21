import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/option.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/wallet_settings_delete_wallet_dialog.dart';
import '../provider/choose_wallet_screen_provider.dart';
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
  OverlayEntry? _overlayEntry;

  void _toggleDeleteDialog() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() => OverlayEntry(
        builder: (BuildContext context) => Positioned.fill(
          child: Material(
            color: Colors.black54,
            child: Center(
              child: DeleteWalletDialog(
                onCancel: _toggleDeleteDialog,
                currentAccount: widget.account,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final Future<AptosAccountWithMetadata?> accountFuture = ref
        .watch(getAptosAccountUseCaseProvider)
        .call(
          accountAddress: widget.account.accountAddress,
        )
        .then((Either<ExceptionWithStackTrace, Option<AptosAccountWithMetadata>>
                either) =>
            either.fold(
              (ExceptionWithStackTrace error) {
                AppLogger.error('Error fetching account: $error');
                return null;
              },
              (Option<AptosAccountWithMetadata> option) => option.fold(
                () => null,
                (AptosAccountWithMetadata account) => account,
              ),
            ));

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(PhosphorIconsRegular.caretLeft),
        ),
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

          return Padding(
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
                  onTap: () async {
                    // Add your asynchronous logic here if needed
                  },
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
                      ref
                          .read(chooseWalletScreenNotifierProvider.notifier)
                          .updateIsUpdated(true);
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
