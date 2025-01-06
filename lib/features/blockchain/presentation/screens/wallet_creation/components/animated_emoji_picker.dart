import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/states/creation_stage_controller.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_stage_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future showAnimtedEmojiPicker(
    BuildContext context, WidgetRef ref, TickerProvider tickerProvider) async {
  ref.read(cardZoomedProvider.notifier).state = true;
  await showModalBottomSheet(
    barrierColor: AppColors.transparent,
    elevation: 20,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    context: context,
    transitionAnimationController: AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: tickerProvider,
    ),
    builder: (context) {
      return const _EmojiPicker();
    },
  );
  ref.read(cardZoomedProvider.notifier).state = false;
}

class _EmojiPicker extends ConsumerStatefulWidget {
  const _EmojiPicker();

  @override
  ConsumerState<_EmojiPicker> createState() => _EmojiPickerState();
}

class _EmojiPickerState extends ConsumerState<_EmojiPicker> {
  @override
  Widget build(BuildContext context) {
    // final appFont = context.appFont;
    final width = context.screenWidth;
    return Container(
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 5)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose an emoji',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(cardZoomedProvider.notifier).state = false;
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.blue),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onTapOutside: (v) {},
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: colorFromHex('#F4F4F6'),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
                hintText: 'Search Emoji',
                hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                prefixIcon: Icon(
                  PhosphorIconsRegular.magnifyingGlass,
                  color: colorFromHex('#979DAA'),
                ),
              ),
            ),
          ),
          const Gap(10),
          SizedBox(
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: AnimatedEmoji.values.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16)
                  .copyWith(bottom: 0),
              itemBuilder: (context, index) {
                return Consumer(builder: (context, ref, child) {
                  if (index == 0) {
                    return InkWell(
                      onTap: () =>
                          ref.read(cardEmojiProvider.notifier).setNewIcon(null),
                      child: Center(
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white38,
                          child: Icon(PhosphorIcons.user(), color: Colors.grey),
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () => ref
                        .read(cardEmojiProvider.notifier)
                        .setNewIcon(AnimatedEmoji.values.elementAt(index - 1)),
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(12),
                      child: CachedNetworkImage(
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        imageUrl:
                            AnimatedEmoji.values.elementAt(index - 1).getEmoji,
                        progressIndicatorBuilder: (context, url, progress) {
                          return ShimmerWidget(
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15)
                .copyWith(top: 35, bottom: 20),
            child: ConfirmButton(
              onTap: () async {
                context.pop();
                ref
                    .read(walletCreationStageProvider.notifier)
                    .jumpToStage(CreationStage.stageThree);
                context.unfocus();
              },
              label: 'Confirm',
            ),
          ),
          Gap(MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }

}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onComplete: (c) => c.repeat(),
      child: child,
    ).shimmer(
      duration: 3.seconds,
      colors: [
        Colors.grey.shade200,
        Colors.grey.shade300,
        Colors.grey.shade200,
      ],
    );
  }
}
