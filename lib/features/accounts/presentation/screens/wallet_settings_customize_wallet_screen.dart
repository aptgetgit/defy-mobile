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

  void animateSlider(int index, Color newColor) {
    ref.read(customizeWalletProviderProvider.notifier)
      ..updateSliderPosition(index.toDouble())
      ..updateColor(newColor)
      ..updateSelectedIndex(index);

    _controller.forward(from: 0);
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

    void saveChanges() {
      final AccountAddress accountAddress = widget.account.accountAddress;

      if (state.selectedWalletName != initialLabel) {
        notifier.updateAccountLabel(state.selectedWalletName, accountAddress);
      }

      if (state.selectedWalletColor != initialColor) {
        notifier.updateAccountBackgroundColor(
          state.selectedWalletColor,
          accountAddress,
        );
      }

      if (state.selectedEmoji != initialIconUri) {
        notifier.updateAccountIconUri(state.selectedEmoji, accountAddress);
      }

      Navigator.of(context).pop(true);
    }

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            if (state.showEmojiSection ||
                state.showNameSection ||
                state.showColorSection) {
              notifier.hideSections();
            } else {
              Navigator.of(context).pop();
            }
          },
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
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            opacity: state.showColorSection ||
                    state.showEmojiSection ||
                    state.showNameSection
                ? 0
                : 1,
            child: buildInitialScreen(
              account: widget.account,
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOutCubic,
            duration: const Duration(milliseconds: 600),
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlackButtonXL(
                margin: const EdgeInsets.only(bottom: 24),
                onClick: saveChanges,
                title: 'Save Changes',
                horizontalPadding: false,
              ).animate().scale(),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.showColorSection
                ? buildColorSection(state, notifier)
                : const SizedBox.shrink(),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOutCubic,
            duration: const Duration(milliseconds: 600),
            right: calculateRightPosition(
              showEmojiSection: state.showEmojiSection,
              showNameSection: state.showNameSection,
              showColorSection: state.showColorSection,
            ),
            top: calculateTopPosition(
              showEmojiSection: state.showEmojiSection,
              showNameSection: state.showNameSection,
              showColorSection: state.showColorSection,
            ),
            child: buildWalletCard(
              widget.account,
              controller,
              focusNode,
              notifier,
              state,
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.showEmojiSection
                ? const WalletSettingsCustomizeWalletEmojiSection()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget buildColorSection(
    CustomizeWalletState state,
    CustomizeWalletProvider notifier,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ColorButton(
                  isSelected: state.walletColorSelectedIndex == 0,
                  updateSliderPosition: notifier.updateSliderPosition,
                  color: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xff2071EE),
                      Color(0xff0051CF),
                    ],
                  ),
                  index: 0,
                  onTap: (int index) => animateSlider(
                    index,
                    AppColors.blue,
                  ),
                ),
                const SizedBox(width: 20),
                ColorButton(
                  isSelected: state.walletColorSelectedIndex == 1,
                  updateSliderPosition: notifier.updateSliderPosition,
                  color: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xff58BB47),
                      Color(0xff3A9D29),
                    ],
                  ),
                  index: 1,
                  onTap: (int index) => animateSlider(
                    index,
                    AppColors.greenLight,
                  ),
                ),
                const SizedBox(width: 20),
                ColorButton(
                  isSelected: state.walletColorSelectedIndex == 2,
                  updateSliderPosition: notifier.updateSliderPosition,
                  color: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xffFFAD29),
                      Color(0xffE18F1E),
                    ],
                  ),
                  index: 2,
                  onTap: (int index) => animateSlider(
                    index,
                    AppColors.orange,
                  ),
                ),
                const SizedBox(width: 20),
                ColorButton(
                  isSelected: state.walletColorSelectedIndex == 3,
                  updateSliderPosition: notifier.updateSliderPosition,
                  color: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xffF0B90B),
                      Color(0xffD99A0A),
                    ],
                  ),
                  index: 3,
                  onTap: (int index) => animateSlider(
                    index,
                    AppColors.yellow,
                  ),
                ),
                const SizedBox(width: 20),
                ColorButton(
                  isSelected: state.walletColorSelectedIndex == 4,
                  updateSliderPosition: notifier.updateSliderPosition,
                  color: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[
                      Color(0xffFA7AA2),
                      Color(0xffF07098),
                    ],
                  ),
                  index: 4,
                  onTap: (int index) => animateSlider(
                    index,
                    AppColors.pink,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 200),
          ],
        ),
      );

  Widget buildInitialScreen({required AptosAccountWithMetadata account}) =>
      Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 220),
            const Text(
              'EDIT WALLET',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(height: 20),
            buildCustomizeWalletTile(
              text: 'Name',
              customizeWidget: Text(
                account.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              onTap: () {
                ref
                    .read(customizeWalletProviderProvider.notifier)
                    .showNameSection();
                Future<void>.delayed(
                  const Duration(milliseconds: 100),
                  focusNode.requestFocus,
                );
              },
            ),
            const SizedBox(height: 16),
            buildCustomizeWalletTile(
              text: 'Color',
              customizeWidget: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xff2071EE),
                          Color(0xff0051CF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xff2071EE),
                          Color(0xff0051CF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
              onTap: () {
                ref
                    .read(customizeWalletProviderProvider.notifier)
                    .showColorSection();
                Future<void>.delayed(
                  const Duration(milliseconds: 100),
                );
              },
            ),
            const SizedBox(height: 16),
            buildCustomizeWalletTile(
              text: 'Emoji',
              customizeWidget: CachedNetworkImage(
                imageUrl: account.iconUri.toString(),
                height: 24,
              ),
              onTap: () {
                ref
                    .read(customizeWalletProviderProvider.notifier)
                    .showEmojiSection();
                Future<void>.delayed(
                  const Duration(milliseconds: 100),
                  focusNode.requestFocus,
                );
              },
            ),
          ],
        ),
      );

  Widget buildCustomizeWalletTile({
    required String text,
    required Widget customizeWidget,
    required void Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.divider,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
              ),
              customizeWidget,
            ],
          ),
        ),
      );

  double calculateRightPosition({
    required bool showEmojiSection,
    required bool showNameSection,
    required bool showColorSection,
  }) {
    if (showEmojiSection) {
      return -MediaQuery.of(context).size.width * 0.35;
    } else if (showNameSection) {
      return -MediaQuery.of(context).size.width * 0.2;
    } else if (showColorSection) {
      return 24;
    } else {
      return 24;
    }
  }

  double calculateTopPosition({
    required bool showEmojiSection,
    required bool showNameSection,
    required bool showColorSection,
  }) {
    if (showEmojiSection) {
      return MediaQuery.of(context).size.height * 0.27;
    } else if (showNameSection) {
      return 68;
    } else if (showColorSection) {
      return 200;
    } else {
      return 20;
    }
  }

  Widget buildWalletCard(
    AptosAccountWithMetadata account,
    TextEditingController controller,
    FocusNode focusNode,
    CustomizeWalletProvider notifier,
    CustomizeWalletState state,
  ) =>
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width - 48,
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
                child: CachedNetworkImage(
                  imageUrl: state.selectedEmoji,
                  height: 40,
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
                        Future<void>.delayed(const Duration(milliseconds: 100),
                            () {
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
                            onChanged: notifier.updateName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
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
