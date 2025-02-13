import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
import '../screens/wallet_settings_screen.dart';
import '../util/helpers.dart';
import '../provider/choose_wallet_screen_provider.dart';

class WalletSwiper extends ConsumerWidget {
  const WalletSwiper({
    required this.accounts,
    this.allowLongPress = false,
    super.key,
  });

  final List<AptosAccountWithMetadata> accounts;
  final bool allowLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Swiper(
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onLongPress: () {
            if (!allowLongPress) return;
            showDialog(
              context: context,
              builder: (BuildContext context) => WalletDialog(
                account: accounts[index],
              ),
            );
          },
          child: WalletSwiper.buildWalletCard(accounts[index]),
        ),
        itemCount: accounts.length,
        itemWidth: MediaQuery.of(context).size.width * 0.95,
        itemHeight: 200,
        layout: SwiperLayout.STACK,
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        loop: true,
        onIndexChanged: (int index) =>
            ref.read(walletNotifierProvider.notifier).updateIndex(index),
      );

  static Widget buildWalletCard(AptosAccountWithMetadata account) => Container(
        height: 200,
        width: double.infinity,
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
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<AptosAccountWithMetadata>('accounts', accounts))
      ..add(DiagnosticsProperty<bool>('allowLongPress', allowLongPress));
  }
}

class WalletDialog extends StatefulWidget {
  const WalletDialog({required this.account, super.key});

  final AptosAccountWithMetadata account;

  @override
  WalletDialogState createState() => WalletDialogState();
}

class WalletDialogState extends State<WalletDialog> {
  @override
  Widget build(BuildContext context) => ColoredBox(
        color: AppColors.white.withOpacity(0.7),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                WalletSwiper.buildWalletCard(widget.account),
                const SizedBox(height: 120),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => WalletSettingsScreen(
                          walletCard:
                              WalletSwiper.buildWalletCard(widget.account),
                        ),
                      ),
                    );
                  },
                  child: _buildDialogOption(
                    icon: PhosphorIconsRegular.appWindow,
                    text: 'Wallet Settings',
                  ),
                ),
                const SizedBox(height: 32),
                _buildDialogOption(
                  icon: PhosphorIconsRegular.palette,
                  text: 'Customize Wallet',
                ),
                const SizedBox(height: 32),
                _buildDialogOption(
                  icon: PhosphorIconsRegular.magnifyingGlass,
                  text: 'Open Wallet',
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildDialogOption({required IconData icon, required String text}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: AppColors.greyDark, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: AppColors.greyDark),
          ),
        ],
      );
}
