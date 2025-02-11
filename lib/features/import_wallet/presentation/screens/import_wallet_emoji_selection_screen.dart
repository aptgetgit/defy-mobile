import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class ImportWalletEmojiSelectionScreen extends ConsumerStatefulWidget {
  const ImportWalletEmojiSelectionScreen( { required this.onContinue,super.key});
  final VoidCallback onContinue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ImportWalletEmojiSelectionScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onContinue', onContinue));
  }
}

class ImportWalletEmojiSelectionScreenState
    extends ConsumerState<ImportWalletEmojiSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final ImportWalletState state = ref.watch(importWalletNotifierProvider);
    final ImportWalletNotifier importWalletNotifier =
        ref.read(importWalletNotifierProvider.notifier);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 150,
            right: -MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: state.selectedWalletColor,
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
                              state.accountName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
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
                if (state.selectedEmojiIndex != -1)
                  Positioned(
                    top: 30,
                    left: 34,
                    child: getEmoji(state.selectedEmojiIndex),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Choose an Emoji',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'A display emoji for your wallet',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      spreadRadius: 50,
                      blurRadius: 10,
                      offset: const Offset(-2, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Choose an emoji',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              importWalletNotifier.updateSelectedEmojiIndex(-1);
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.divider,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Emoji',
                            hintStyle: TextStyle(color: AppColors.greyLight),
                            prefixIcon: Icon(
                              PhosphorIconsRegular.magnifyingGlass,
                              size: 16,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: 18,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                            onTap: () {
                              importWalletNotifier
                                  .updateSelectedEmojiIndex(index);
                            },
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: getEmoji(index),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: state.selectedEmojiIndex != -1
                              ? () {
                                  widget.onContinue();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ).animate().scale(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getEmoji(int index) {
    if (index == 0) {
      return Image.asset(
        'assets/images/grinning-face.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 1) {
      return Image.asset(
        'assets/images/grinning-face-with-big-eyes.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 2) {
      return Image.asset(
        'assets/images/grinning-face-with-smiling-eyes.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 3) {
      return Image.asset(
        'assets/images/beaming-face-with-smiling-eyes.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 4) {
      return Image.asset(
        'assets/images/grinning-squinting-face.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 5) {
      return Image.asset(
        'assets/images/grinning-face-with-sweat.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 6) {
      return Image.asset(
        'assets/images/rolling-on-the-floor-laughing.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 7) {
      return Image.asset(
        'assets/images/face-with-tears-of-joy.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 8) {
      return Image.asset(
        'assets/images/slightly-smiling-face.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 9) {
      return Image.asset(
        'assets/images/upside-down-face.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 10) {
      return Image.asset(
        'assets/images/winking-face.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 11) {
      return Image.asset(
        'assets/images/smiling-face-with-smiling-eyes.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 12) {
      return Image.asset(
        'assets/images/smiling-face-with-halo.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 13) {
      return Image.asset(
        'assets/images/smiling-face-with-hearts.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 14) {
      return Image.asset(
        'assets/images/smiling-face-with-heart-eyes.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 15) {
      return Image.asset(
        'assets/images/star-struck.gif',
        height: 40,
        width: 40,
      );
    } else if (index == 16) {
      return Image.asset(
        'assets/images/face-blowing-a-kiss.gif',
        height: 40,
        width: 40,
      );
    } else {
      return Image.asset(
        'assets/images/kissing-face.gif',
        height: 40,
        width: 40,
      );
    }
  }
}
