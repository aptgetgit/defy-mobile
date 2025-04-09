import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: buildWalletCard(accounts.first, context),
            ),
          ),
        ),
      );
    } else {
      return Swiper(
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: buildWalletCard(accounts[index], context),
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

  Widget buildWalletCard(
    AptosAccountWithMetadata account,
    BuildContext context,
  ) =>
      Hero(
        tag: getWalletCardHeroTag(account.accountAddress.toHex()),
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) =>
            ScaleTransition(
          scale: animation.drive(
            Tween<double>(begin: 1, end: 1.1)
                .chain(CurveTween(curve: Curves.easeInOut)),
          ),
          child: fromHeroContext.widget,
        ),
        child: Center(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: account.backgroundColor,
              // gradient: account.backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.greyDark.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Balance',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const Text(
                        '---------',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                  bottom: 24,
                  right: 24,
                  child: Text(
                    'Profile',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                  top: 26,
                  right: 26,
                  child: GestureDetector(
                    onTap: () async {
                      await Future<void>.delayed(
                        const Duration(milliseconds: 500),
                      );
                      if (!context.mounted) {
                        return;
                      }
                      await Navigator.of(context).push(
                        PageRouteBuilder<WalletSettingsScreen>(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 400),
                          pageBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                          ) =>
                              WalletSettingsScreen(account: account),
                          transitionsBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child,
                          ) {
                            final CurvedAnimation curved = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );

                            return ScaleTransition(
                              scale: Tween<double>(begin: 0.95, end: 1)
                                  .animate(curved),
                              child: FadeTransition(
                                opacity: curved,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      PhosphorIconsRegular.gear,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 10,
                  child: SvgPicture.asset(
                    Assets.images.cardTopLeft,
                    height: 64,
                    width: 64,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  right: 0,
                  top: -4,
                  child: SvgPicture.asset(
                    Assets.images.cardTopRight,
                    height: 48,
                    width: 48,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  right: 88,
                  bottom: -8,
                  child: SvgPicture.asset(
                    Assets.images.cardBottom,
                    height: 88,
                    width: 88,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 28,
                  left: 28,
                  child: CachedNetworkImage(
                    imageUrl: account.iconUri.toString(),
                    height: 40,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: 100,
                  top: 10,
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
                      const SizedBox(height: 4),
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
          ),
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

Widget walletCardHeroFlightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) =>
    AnimatedBuilder(
      animation: animation,
      child: flightDirection == HeroFlightDirection.push
          ? fromHeroContext.widget
          : toHeroContext.widget,
      builder: (BuildContext context, Widget? child) => Material(
        color: Colors.transparent,
        child: child,
      ),
    );

String getWalletCardHeroTag(String accountAddress) =>
    'wallet_card_$accountAddress';
