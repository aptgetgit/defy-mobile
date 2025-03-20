import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../provider/choose_wallet_screen_provider.dart';
import '../screens/wallet_settings_screen.dart';
import '../util/helpers.dart';

class WalletSwiper extends ConsumerWidget {
  const WalletSwiper({
    required this.accounts,
    this.allowLongPress = false,
    super.key,
  });

  final List<AptosAccountWithMetadata> accounts;
  final bool allowLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (accounts.length == 1) {
      return GestureDetector(
        onLongPress: () async {
          if (!allowLongPress) {
            return;
          }
          await _showWalletDialog(context, accounts.first);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: buildWalletCard(accounts.first),
            ),
          ),
        ),
      );
    } else {
      return Swiper(
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onLongPress: () async {
            if (!allowLongPress) {
              return;
            }
            await _showWalletDialog(context, accounts[index]);
          },
          child: buildWalletCard(accounts[index]),
        ),
        itemCount: accounts.length,
        itemWidth: MediaQuery.of(context).size.width * 0.95,
        itemHeight: 200,
        layout: SwiperLayout.STACK,
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        onIndexChanged: (int index) => ref
            .read(chooseWalletScreenNotifierProvider.notifier)
            .updateIndex(index),
      );
    }
  }

  Future<void> _showWalletDialog(
    BuildContext context,
    AptosAccountWithMetadata account,
  ) async {
    await Navigator.of(context).push(
      PageRouteBuilder<void>(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            WalletDialog(account: account),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            FadeTransition(opacity: animation, child: child),
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
              top: 28,
              left: 38,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<AptosAccountWithMetadata>('accounts', accounts))
      ..add(DiagnosticsProperty<bool>('allowLongPress', allowLongPress));
  }
}

class WalletDialog extends StatelessWidget {
  const WalletDialog({required this.account, super.key});

  final AptosAccountWithMetadata account;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white38,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        buildWalletCard(account),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pop();
                            final bool? result =
                                await Navigator.of(context).push(
                              MaterialPageRoute<bool>(
                                builder: (BuildContext context) =>
                                    WalletSettingsScreen(
                                  account: account,
                                ),
                              ),
                            );

                            Navigator.of(context).pop(result);
                          },
                          child: _buildDialogOption(
                            icon: PhosphorIconsRegular.appWindow,
                            text: 'Wallet Settings',
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildDialogOption(
                          icon: PhosphorIconsRegular.palette,
                          text: 'Customize Wallet',
                        ),
                        const SizedBox(height: 16),
                        _buildDialogOption(
                          icon: PhosphorIconsRegular.magnifyingGlass,
                          text: 'Open Wallet',
                        ),
                        const SizedBox(height: 16),
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
              ),
            ),
          ],
        ),
      );

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<AptosAccountWithMetadata>('account', account));
  }
}
