import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../components/wallet_settings_delete_wallet_dialog.dart';
import '../components/wallet_swiper.dart';
import '../provider/choose_wallet_screen_provider.dart';
import '../provider/wallet_settings_provider.dart';
import '../util/helpers.dart';
import 'wallet_settings_customize_wallet_screen.dart';
import 'wallet_settings_security_screen.dart';

class WalletSettingsScreen extends ConsumerStatefulWidget {
  const WalletSettingsScreen({required this.account, super.key});
  final AptosAccountWithMetadata account;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletSettingsScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<AptosAccountWithMetadata>('account', account));
  }
}

class WalletSettingsScreenState extends ConsumerState<WalletSettingsScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final bool showDeleteConfirmation =
        ref.watch(showDeleteConfirmationProvider);
    final AsyncValue<AptosAccountWithMetadata?> accountAsyncValue =
        ref.watch(accountFutureProvider(widget.account));

    final bool showDialogAndButton = ref.watch(showDialogAndButtonProvider);
    final bool isRemoving = ref.watch(isRemovingProvider);
    final bool isCardRemoving = ref.watch(isCardRemovingProvider);

    // Handle delayed showing of dialog
    if (showDeleteConfirmation && !showDialogAndButton) {
      Future<void>.microtask(() {
        ref.read(showDialogAndButtonProvider.notifier).state = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(PhosphorIconsRegular.caretLeft),
        ),
        centerTitle: true,
        title: AnimatedOpacity(
          opacity: showDeleteConfirmation ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: const Text('Wallet'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(PhosphorIconsRegular.cardholder),
            onPressed: () {},
          ),
        ],
      ),
      body: accountAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, _) => Center(child: Text('Error: $error')),
        data: (AptosAccountWithMetadata? updatedAccount) =>
            updatedAccount == null
                ? const Center(child: Text('Account not found'))
                : _buildBody(
                    context,
                    ref,
                    updatedAccount,
                    showDeleteConfirmation,
                    showDialogAndButton,
                    isRemoving,
                    isCardRemoving,
                  ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    AptosAccountWithMetadata account,
    bool showDeleteConfirmation,
    bool showDialogAndButton,
    bool isRemoving,
    bool isCardRemoving,
  ) =>
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: showDeleteConfirmation ? 1.0 : 0.0,
            child: _buildRemoveTextSection(
              context,
              ref,
              account,
              showDeleteConfirmation,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: showDeleteConfirmation ? 0.0 : 1.0,
            child: _buildWalletSettings(context, ref, account),
          ),
          _buildWalletCard(
            account,
            context,
            showDeleteConfirmation,
            isCardRemoving,
          ),
          if (showDeleteConfirmation && showDialogAndButton && !isRemoving)
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: showDialogAndButton ? 1.0 : 0.0,
                child: DeleteWalletDialog(
                  onCancel: () => _handleCancelDelete(ref),
                  currentAccount: widget.account,
                ),
              ),
            ),
          _buildRemoveButton(
            context,
            ref,
            showDeleteConfirmation,
            showDialogAndButton,
            isRemoving,
          ),
        ],
      );
  void _handleCancelDelete(WidgetRef ref) {
    ref.read(showDeleteConfirmationProvider.notifier).state = false;
    ref.read(showDialogAndButtonProvider.notifier).state = false;
  }

  Widget _buildRemoveTextSection(
    BuildContext context,
    WidgetRef ref,
    AptosAccountWithMetadata account,
    bool showDeleteConfirmation,
  ) =>
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12),
            Text(
              'Remove Wallet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Wallet will be deleted from the app',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ],
        ),
      );

  Widget _buildWalletCard(
    AptosAccountWithMetadata account,
    BuildContext context,
    bool showDeleteConfirmation,
    bool isCardRemoving,
  ) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: showDeleteConfirmation ? 24 : screenHeight * 0.2,
        end: showDeleteConfirmation ? screenHeight * 0.15 : 24,
      ),
      builder: (BuildContext context, double value, Widget? child) =>
          AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        top: isCardRemoving ? screenHeight - 100 : value,
        left: isCardRemoving ? screenWidth - 100 : 0,
        right: isCardRemoving ? 20 : 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: isCardRemoving ? 6 : 184,
          width: isCardRemoving ? 6 : screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: buildWalletCard(
            account,
            context,
            showDeleteConfirmation: showDeleteConfirmation,
            isCardRemoving: isCardRemoving,
          ),
        ),
      ),
    );
  }

  Widget _buildWalletSettings(
    BuildContext context,
    WidgetRef ref,
    AptosAccountWithMetadata account,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 232),
            const Text(
              'Wallet Settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(height: 4),
            const Divider(color: AppColors.divider, thickness: 2),
            const SizedBox(height: 16),
            _buildWalletSettingsItem(
              title: 'Security',
              icon: PhosphorIconsRegular.arrowCircleUpRight,
              onTap: () => _navigateToSecurity(context, account),
            ),
            _buildWalletSettingsItem(
              title: 'Customize Wallet',
              icon: PhosphorIconsRegular.palette,
              onTap: () => _navigateToCustomize(context, ref, account),
            ),
            _buildReceivingNFTItem(),
          ],
        ),
      );

  void _handleRemoval(WidgetRef ref) {
    ref.read(isRemovingProvider.notifier).state = true;
    ref.read(showDialogAndButtonProvider.notifier).state = false;

    // Simulate wallet removal process
    Future<void>.delayed(const Duration(seconds: 2), () {
      ref.read(isCardRemovingProvider.notifier).state = true;

      // Add a delay for the card animation
      Future<void>.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          ref.read(isRemovingProvider.notifier).state = false;
          ref.read(showDeleteConfirmationProvider.notifier).state = false;
          ref.read(isCardRemovingProvider.notifier).state = true;

          // You might want to add navigation or other logic here after removal is complete
        }
      });
    });
  }

  Widget _buildRemoveButton(
    BuildContext context,
    WidgetRef ref,
    bool showDeleteConfirmation,
    bool showDialogAndButton,
    bool isRemoving,
  ) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      curve: Curves.easeInOutQuad,
      duration: const Duration(milliseconds: 400),
      bottom: isRemoving
          ? 20
          : (showDeleteConfirmation && showDialogAndButton)
              ? 38
              : 20,
      right: 28,
      left: isRemoving
          ? 24
          : (showDeleteConfirmation && showDialogAndButton)
              ? screenWidth / 2 + 8
              : 24,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutQuad,
        height: 56,
        width: isRemoving
            ? screenWidth - 48
            : (showDeleteConfirmation && showDialogAndButton)
                ? screenWidth / 2 - 36
                : screenWidth - 48,
        decoration: BoxDecoration(
          color: isRemoving || (showDeleteConfirmation && showDialogAndButton)
              ? const Color(0xffFF6767)
              : const Color(0xffFFE1E1),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isRemoving
                ? null
                : () {
                    if (showDeleteConfirmation && showDialogAndButton) {
                      _handleRemoval(ref);
                    } else {
                      ref.read(showDeleteConfirmationProvider.notifier).state =
                          !showDeleteConfirmation;
                    }
                  },
            borderRadius: BorderRadius.circular(45),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (isRemoving)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    if (isRemoving) const Spacer(),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isRemoving ||
                                (showDeleteConfirmation && showDialogAndButton)
                            ? AppColors.white
                            : const Color(0xffFF6767),
                      ),
                      child: Text(isRemoving ? 'Removing' : 'Remove'),
                    ),
                    if (isRemoving) const Spacer(),
                    if (isRemoving)
                      const Icon(
                        PhosphorIconsRegular.trash,
                        color: Colors.white,
                        size: 20,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToSecurity(
    BuildContext context,
    AptosAccountWithMetadata account,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => WalletSettingsSecurityScreen(
          accountAddress: account.accountAddress,
        ),
      ),
    );
  }

  Future<void> _navigateToCustomize(
    BuildContext context,
    WidgetRef ref,
    AptosAccountWithMetadata account,
  ) async {
    final bool? result = await Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (BuildContext context) => WalletSettingsCustomizeWalletScreen(
          account: account,
        ),
      ),
    );

    if (result ?? false) {
      ref.refresh(accountFutureProvider(account));
      ref.read(chooseWalletScreenNotifierProvider.notifier).updateIsUpdated();
    }
  }

  Widget _buildReceivingNFTItem() => GestureDetector(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.only(left: 4, right: 4, bottom: 28),
          child: Row(
            children: <Widget>[
              Icon(PhosphorIconsRegular.atom, color: AppColors.black, size: 24),
              SizedBox(width: 12),
              Text(
                'Receiving NFT',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Text(
                'OFF',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyLight,
                ),
              ),
              SizedBox(width: 12),
              Icon(
                PhosphorIconsBold.caretRight,
                size: 18,
                color: AppColors.greyLight,
              ),
            ],
          ),
        ),
      );

  //      Widget buildWalletCard(
  //   AptosAccountWithMetadata account,
  //   BuildContext context, {
  //   required bool showDeleteConfirmation,
  // }) =>
  //     Hero(
  //       tag: getWalletCardHeroTag(account.accountAddress.toHex()),
  //       flightShuttleBuilder: (
  //         BuildContext flightContext,
  //         Animation<double> animation,
  //         HeroFlightDirection flightDirection,
  //         BuildContext fromHeroContext,
  //         BuildContext toHeroContext,
  //       ) =>
  //           ScaleTransition(
  //         scale: animation.drive(
  //           Tween<double>(begin: 1, end: 1.1)
  //               .chain(CurveTween(curve: Curves.easeInOut)),
  //         ),
  //         child: fromHeroContext.widget,
  //       ),
  //       child: Center(
  //         child: Container(
  //           height: 184,
  //           width: MediaQuery.of(context).size.width - 52,
  //           decoration: BoxDecoration(
  //             color: showDeleteConfirmation ? null : account.backgroundColor,
  //             gradient: showDeleteConfirmation
  //                 ? const LinearGradient(
  //                     colors: <Color>[
  //                       Color(0xffFF6767),
  //                       Color(0xffF23545),
  //                     ],
  //                     begin: Alignment.bottomLeft,
  //                     end: Alignment.topRight,
  //                   )
  //                 : null,
  //             boxShadow: <BoxShadow>[
  //               BoxShadow(
  //                 color: AppColors.greyDark.withOpacity(0.5),
  //                 spreadRadius: 1,
  //                 blurRadius: 2,
  //                 offset: const Offset(0, 3),
  //               ),
  //             ],
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Stack(
  //             children: <Widget>[
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 bottom: 20,
  //                 left: 20,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       'Total Balance',
  //                       style: GoogleFonts.urbanist(
  //                         fontSize: 14,
  //                         color: AppColors.white,
  //                       ),
  //                     ),
  //                     const Text(
  //                       '---------',
  //                       style: TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(
  //                   milliseconds: 300,
  //                 ),
  //                 curve: Curves.easeInOut,
  //                 bottom: 24,
  //                 right: 24,
  //                 child: Text(
  //                   'Profile',
  //                   style: GoogleFonts.urbanist(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w600,
  //                     color: AppColors.white,
  //                   ),
  //                 ),
  //               ),
  //               const AnimatedPositioned(
  //                 duration: Duration(
  //                   milliseconds: 300,
  //                 ),
  //                 curve: Curves.easeInOut,
  //                 top: 26,
  //                 right: 26,
  //                 child: Icon(
  //                   PhosphorIconsRegular.qrCode,
  //                   color: AppColors.white,
  //                   size: 24,
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 top: 10,
  //                 child: SvgPicture.asset(
  //                   Assets.images.cardTopLeft,
  //                   height: 56,
  //                   width: 56,
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 right: -6,
  //                 top: -8,
  //                 child: SvgPicture.asset(
  //                   Assets.images.cardTopRight,
  //                   height: 48,
  //                   width: 48,
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 right: 88,
  //                 bottom: -8,
  //                 child: SvgPicture.asset(
  //                   Assets.images.cardBottom,
  //                   height: 88,
  //                   width: 88,
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 top: 27,
  //                 left: 24,
  //                 child: CachedNetworkImage(
  //                   imageUrl: account.iconUri.toString(),
  //                   height: 36,
  //                 ),
  //               ),
  //               AnimatedPositioned(
  //                 duration: const Duration(milliseconds: 300),
  //                 curve: Curves.easeInOut,
  //                 left: 100,
  //                 top: 10,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       account.label,
  //                       style: const TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColors.white,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 4),
  //                     Text(
  //                       truncateAddress(account.accountAddress.toHex()),
  //                       style: const TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w400,
  //                         color: AppColors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );

  Widget buildWalletCard(
    AptosAccountWithMetadata account,
    BuildContext context, {
    required bool showDeleteConfirmation,
    required bool isCardRemoving,
  }) =>
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
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: showDeleteConfirmation ? null : account.backgroundColor,
            gradient: showDeleteConfirmation
                ? const LinearGradient(
                    colors: <Color>[
                      Color(0xffFF6767),
                      Color(0xffF23545),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : null,
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
              const AnimatedPositioned(
                duration: Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
                top: 26,
                right: 26,
                child: Icon(
                  PhosphorIconsRegular.qrCode,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: 10,
                child: SvgPicture.asset(
                  Assets.images.cardTopLeft,
                  height: 56,
                  width: 56,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                right: -6,
                top: -8,
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
                top: 27,
                left: 24,
                child: CachedNetworkImage(
                  imageUrl: account.iconUri.toString(),
                  height: 36,
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
      );

  Widget _buildWalletSettingsItem({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 28),
          child: Row(
            children: <Widget>[
              Icon(icon, color: AppColors.black, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              const Icon(
                PhosphorIconsBold.caretRight,
                size: 18,
                color: AppColors.greyLight,
              ),
            ],
          ),
        ),
      );
}
