import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/animated_emoji.dart';
import '../../../../core/utils/emoji_utils.dart';
import '../../constants/create_wallet_ui_constants.dart';
import '../state/create_wallet_state.dart';

class CreateWalletCard extends StatelessWidget {
  const CreateWalletCard({
    required this.state,
    required this.controller,
    required this.focusNode,
    required this.onTextChanged,
    required this.context,
    super.key,
  });
  final CreateWalletState state;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onTextChanged;
  final BuildContext context;

  @override
  Widget build(BuildContext context) => AnimatedPositioned(
        curve: Curves.easeInOutCubic,
        duration: CreateWalletConstants.positionAnimationDuration,
        right: _calculateWalletCardPosition(),
        top: focusNode.hasFocus ? 110 : 200,
        left: state.currentStep == 1 ? 20 : null,
        child: Container(
          height: CreateWalletConstants.cardHeight,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: state.selectedWalletColor,
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/wallet-creation-wallet-background-wallet-component.png',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.greyDark.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius:
                BorderRadius.circular(CreateWalletConstants.borderRadius),
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: 30,
                left: 34,
                child: getAnimatedEmoji(state.selectedEmojiIndex),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: 110,
                top: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      child: TextField(
                        enabled: state.currentStep == 0,
                        cursorHeight: 16,
                        cursorWidth: 1,
                        cursorColor: AppColors.white,
                        controller: controller,
                        focusNode: focusNode,
                        onChanged: onTextChanged,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Wallet Address',
                      style: TextStyle(
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

  double _calculateWalletCardPosition() {
    if (state.currentStep == 0) {
      return -MediaQuery.of(context).size.width / 6;
    } else if (state.currentStep == 1) {
      return 20;
    } else if (state.currentStep == 2) {
      return -MediaQuery.of(context).size.width / 6;
    } else {
      return -MediaQuery.of(context).size.width;
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
      ..add(DiagnosticsProperty<CreateWalletState>('state', state))
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
      ..add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
