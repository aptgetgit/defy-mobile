import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../shared/blockchain/account/domain/entities/account_address.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../common/presentation/widgets/animated_color_button.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../components/wallet_settings_customize_wallet_emoji_section.dart';
import '../provider/customize_wallet_provider.dart';
import '../state/customize_wallet_state.dart';
import '../util/helpers.dart';

class WalletSettingsCustomizeWalletScreen extends ConsumerStatefulWidget {
  const WalletSettingsCustomizeWalletScreen({required this.account, super.key});
  final AptosAccountWithMetadata account;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletSettingsCustomizeWalletScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<AptosAccountWithMetadata>('account', account));
  }
}

class _WalletSettingsCustomizeWalletScreenState
    extends ConsumerState<WalletSettingsCustomizeWalletScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  late AnimationController _controller;

  late String initialLabel;
  late Color initialColor;
  late String initialIconUri;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final CustomizeWalletState initialState =
        ref.read(customizeWalletProviderProvider);
    controller.text = initialState.selectedWalletName;

    initialLabel = widget.account.label;
    initialColor = widget.account.backgroundColor;
    initialIconUri = widget.account.iconUri.toString();

    Future<void>.microtask(() {
      ref.read(customizeWalletProviderProvider.notifier)
        ..updateColor(initialColor)
        ..updateEmoji(initialIconUri)
        ..updateName(initialLabel)
        ..updateSelectedIndex(
          initialColor == AppColors.blue
              ? 0
              : initialColor == AppColors.greenLight
                  ? 1
                  : initialColor == AppColors.orange
                      ? 2
                      : initialColor == AppColors.yellow
                          ? 3
                          : 4,
        );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CustomizeWalletState>(customizeWalletProviderProvider,
        (CustomizeWalletState? previous, CustomizeWalletState next) {
      if (previous?.selectedWalletName != next.selectedWalletName) {
        controller.text = next.selectedWalletName;
      }
    });

    final CustomizeWalletProvider notifier =
        ref.watch(customizeWalletProviderProvider.notifier);
    final CustomizeWalletState state =
        ref.watch(customizeWalletProviderProvider);

    void animateSlider(int index, Color newColor) {
      notifier
        ..updateSliderPosition(index.toDouble())
        ..updateColor(newColor)
        ..updateSelectedIndex(index);

      _controller.forward(from: 0);
    }

    void saveChanges() {
      final AccountAddress accountAddress = widget.account.accountAddress;

      if (state.selectedWalletName != initialLabel) {
        notifier.updateAccountLabel(state.selectedWalletName, accountAddress);
      }

      if (state.selectedWalletColor != initialColor) {
        notifier.updateAccountBackgroundColor(
            state.selectedWalletColor, accountAddress);
      }

      if (state.selectedEmoji != initialIconUri) {
        notifier.updateAccountIconUri(state.selectedEmoji, accountAddress);
      }

      Navigator.of(context).pop(true);
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(PhosphorIconsRegular.caretLeft),
        ),
        centerTitle: true,
        title: const Text('Edit Wallet'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(PhosphorIconsRegular.cardholder),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                buildWalletCard(
                  widget.account,
                  controller,
                  focusNode,
                  notifier,
                  state,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.showEmojiSection
                      ? const WalletSettingsCustomizeWalletEmojiSection()
                      : state.showColorSection
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ColorButton(
                                        isSelected:
                                            state.walletColorSelectedIndex == 0,
                                        updateSliderPosition:
                                            notifier.updateSliderPosition,
                                        color: AppColors.blue,
                                        index: 0,
                                        onTap: (int index) => animateSlider(
                                          index,
                                          AppColors.blue,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      ColorButton(
                                        isSelected:
                                            state.walletColorSelectedIndex == 1,
                                        updateSliderPosition:
                                            notifier.updateSliderPosition,
                                        color: AppColors.greenLight,
                                        index: 1,
                                        onTap: (int index) => animateSlider(
                                          index,
                                          AppColors.greenLight,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      ColorButton(
                                        isSelected:
                                            state.walletColorSelectedIndex == 2,
                                        updateSliderPosition:
                                            notifier.updateSliderPosition,
                                        color: AppColors.orange,
                                        index: 2,
                                        onTap: (int index) => animateSlider(
                                          index,
                                          AppColors.orange,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      ColorButton(
                                        isSelected:
                                            state.walletColorSelectedIndex == 3,
                                        updateSliderPosition:
                                            notifier.updateSliderPosition,
                                        color: AppColors.yellow,
                                        index: 3,
                                        onTap: (int index) => animateSlider(
                                          index,
                                          AppColors.yellow,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      ColorButton(
                                        isSelected:
                                            state.walletColorSelectedIndex == 4,
                                        updateSliderPosition:
                                            notifier.updateSliderPosition,
                                        color: AppColors.pink,
                                        index: 4,
                                        onTap: (int index) => animateSlider(
                                          index,
                                          AppColors.pink,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            )
                          : Container(),
                ),
              ],
            ),
          ),
          BlackButtonXL(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            onClick: saveChanges,
            title: 'Save Changes',
            horizontalPadding: false,
          ).animate().scale(),
        ],
      ),
    );
  }

  Widget buildWalletCard(
    AptosAccountWithMetadata account,
    TextEditingController controller,
    FocusNode focusNode,
    CustomizeWalletProvider notifier,
    CustomizeWalletState state,
  ) =>
      AnimatedPositioned(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 600),
        right: state.showEmojiSection || state.showNameSection
            ? -MediaQuery.of(context).size.width / 6
            : 20,
        top: state.showNameSection ? 60 : 200,
        left: state.showEmojiSection || state.showNameSection ? null : 20,
        child: Container(
          height: 200,
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                top: 30,
                left: 34,
                child: GestureDetector(
                  onTap: () => notifier.showEmojiSection(),
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: state.selectedEmoji,
                        height: 40,
                      ),
                      if (!state.showEmojiSection)
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white38,
                            radius: 10,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
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
                      child: GestureDetector(
                        onTap: () {
                          notifier.showNameSection();
                          Future<void>.delayed(
                              const Duration(milliseconds: 100), () {
                            focusNode.requestFocus();
                          });
                        },
                        child: Stack(
                          children: <Widget>[
                            TextField(
                              enabled: state.showNameSection,
                              cursorHeight: 16,
                              cursorWidth: 1,
                              cursorColor: AppColors.white,
                              controller: controller,
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                            if (!state.showNameSection)
                              Positioned(
                                left: controller.text.length.toDouble() * 12,
                                top: 16,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white38,
                                  radius: 10,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
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
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController>(
          'controller',
          controller,
        ),
      )
      ..add(
        DiagnosticsProperty<FocusNode>(
          'focusNode',
          focusNode,
        ),
      )
      ..add(StringProperty('initialLabel', initialLabel))
      ..add(ColorProperty('initialColor', initialColor))
      ..add(StringProperty('initialIconUri', initialIconUri));
  }
}
