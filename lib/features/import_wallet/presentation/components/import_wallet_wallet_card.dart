import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/constants/animated_emoji.dart';
import '../../../../core/utils/emoji_utils.dart';
import '../constants/import_wallet_ui_constants.dart';
import '../state/import_wallet_state.dart';
import 'wallet_card_back.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    required this.state,
    required this.controller,
    required this.focusNode,
    required this.onTextChanged,
    required this.context,
    required this.existingWalletNames,
    required this.isFrontCard,
    required this.walletAddress,
    required this.isFlipping,
    super.key,
  });

  final ImportWalletState state;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onTextChanged;
  final BuildContext context;
  final Set<String> existingWalletNames;
  final bool isFrontCard;
  final String walletAddress;
  final bool isFlipping;

  @override
  Widget build(BuildContext context) {
    final double leftPosition = _calculateWalletCardPosition();

    return AnimatedPositioned(
      duration: Duration(milliseconds: state.showWalletName ? 1000 : 600),
      curve: Curves.easeInOutQuad,
      top: focusNode.hasFocus ? 110 : 200,
      left: leftPosition,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: ImportWalletConstants.cardHeight,
        child:  TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: MediaQuery.of(context).size.height / 4,
                end: isFlipping ? MediaQuery.of(context).size.height / 4 : 20,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              builder: (BuildContext context, double value, Widget? child) =>
                  Positioned(
                top: value,
                left: 20,
                right: 20,
          child: FlipCard(
            toggler: isFrontCard,
            frontCard: _buildCard(),
            backCard: const WalletCardBack(),
          ),
        ),
      ),
    ),);
  }

  Widget _buildCard() => Center(
        child: Container(
          height: ImportWalletConstants.cardHeight,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            gradient: state.selectedWalletColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.greyDark.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius:
                BorderRadius.circular(ImportWalletConstants.borderRadius),
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: 20,
                left: 24,
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
                right: 30,
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
                top: 8,
                child: SvgPicture.asset(
                  Assets.images.cardTopLeft,
                  height: 60,
                  width: 60,
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
              if (state.selectedEmojiIndex == -1)
                const AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 30,
                  left: 33,
                  child: Icon(
                    PhosphorIconsRegular.user,
                    color: AppColors.greyVeryLight,
                  ),
                )
              else
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 25,
                  left: 25,
                  child: getAnimatedEmoji(state.selectedEmojiIndex),
                ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: 92,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      height: 30,
                      child: TextField(
                        enabled: state.showWalletName,
                        cursorHeight: 16,
                        cursorWidth: 1,
                        cursorColor: AppColors.white,
                        controller: controller,
                        focusNode: focusNode,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          hintText: 'Account ${existingWalletNames.length + 1}',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: state.showWalletName
                                ? AppColors.greyVeryLight.withOpacity(0.5)
                                : AppColors.white,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontSize: !state.showWalletName ? 16 : 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Wallet Address',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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

  double _calculateWalletCardPosition() {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (state.showWalletName) {
      return screenWidth / 2.75;
    } else if (state.showWalletColor) {
      return 20;
    } else if (state.showEmojiPicker) {
      return screenWidth / 2.75;
    } else if (state.showCreatedWallet) {
      return 20;
    } else {
      return screenWidth; // offscreen
    }
  }

  Widget getAnimatedEmoji(int index) {
    final AnimatedEmoji? emoji = EmojiUtils.getEmojiByIndex(index);
    if (emoji == null) {
      return const SizedBox.shrink();
    }

    return CachedNetworkImage(
      imageUrl: emoji.getEmoji,
      height: 40,
      width: 40,
      key: ValueKey<String>('emoji_${emoji.name}'),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ImportWalletState>('state', state))
      ..add(
        DiagnosticsProperty<TextEditingController>('controller', controller),
      )
      ..add(DiagnosticsProperty<FocusNode>('focusNode', focusNode))
      ..add(
        ObjectFlagProperty<void Function(String p1)>.has(
          'onTextChanged',
          onTextChanged,
        ),
      )
      ..add(DiagnosticsProperty<BuildContext>('context', context))
      ..add(
        IterableProperty<String>('existinWalletNames', existingWalletNames),
      )
      ..add(DiagnosticsProperty<bool>('isFrontCard', isFrontCard))
      ..add(StringProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty<bool>('isFlipping', isFlipping));
  }
}
