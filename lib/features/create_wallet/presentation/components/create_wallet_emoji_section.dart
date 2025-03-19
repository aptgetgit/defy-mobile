import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/animated_emoji.dart';
import '../providers/create_wallet_provider.dart';
import '../state/create_wallet_state.dart';

class CreateWalletEmojiSection extends StatelessWidget {
  const CreateWalletEmojiSection({
    required this.createWalletNotifier,
    required this.createWalletState,
    super.key,
  });
  final CreateWalletNotifier createWalletNotifier;
  final CreateWalletState createWalletState;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Choose an Emoji',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'A display emoji for your wallet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ),
          const Spacer(),
          _buildEmojiPicker(),
        ],
      );

  Widget _buildEmojiPicker() => DecoratedBox(
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
                    onPressed: () =>
                        createWalletNotifier.updateSelectedEmojiIndex(-1),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 18,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      createWalletNotifier.updateSelectedEmojiIndex(index);
                    },
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: getAnimatedEmoji(index),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget getAnimatedEmoji(int index) {
    if (index == -1) {
      return const SizedBox.shrink();
    }

    final List<AnimatedEmoji> emojiMapping = [
      AnimatedEmoji.GrinningFace,
      AnimatedEmoji.GrinningFaceWithBigEyes,
      AnimatedEmoji.GrinningFaceWithSmilingEyes,
      AnimatedEmoji.BeamingFaceWithSmilingEyes,
      AnimatedEmoji.GrinningSquintingFace,
      AnimatedEmoji.GrinningFaceWithSweat,
      AnimatedEmoji.RollingOnTheFloorLaughing,
      AnimatedEmoji.FaceWithTearsOfJoy,
      AnimatedEmoji.SlightlySmilingFace,
      AnimatedEmoji.UpsideDownFace,
      AnimatedEmoji.WinkingFace,
      AnimatedEmoji.SmilingFaceWithSmilingEyes,
      AnimatedEmoji.SmilingFaceWithHalo,
      AnimatedEmoji.SmilingFaceWithHearts,
      AnimatedEmoji.SmilingFaceWithHeartEyes,
      AnimatedEmoji.StarStruck,
      AnimatedEmoji.FaceBlowingAKiss,
      AnimatedEmoji.KissingFace,
    ];

    if (index < 0 || index >= emojiMapping.length) {
      return const SizedBox.shrink();
    }

    final AnimatedEmoji emoji = emojiMapping[index];
    return CachedNetworkImage(
      imageUrl: emoji.getEmoji,
      height: 40,
      width: 40,
      key: ValueKey<String>('emoji_${emojiMapping[index].name}'),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<CreateWalletNotifier>(
          'importWalletNotifier', createWalletNotifier))
      ..add(DiagnosticsProperty<CreateWalletState>(
          'importWalletState', createWalletState));
  }
}
