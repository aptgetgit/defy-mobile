import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/components/animated_emoji_picker.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' as color_picker;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EditWalletScreen extends ConsumerStatefulWidget {
  // final Group group;
  final String? personaName;
  const EditWalletScreen({required this.personaName, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      EditWalletScreenState();
}

class EditWalletScreenState extends ConsumerState<EditWalletScreen> {
  String? backgroupColorHex;
  String avatar = "https://uploads-ssl.webflow.com/61ff1039861e448062039fa4/6252050a94920c3c11729184_62006466d6c3221847cb8c00_dydx.png";
  final groupName = TextEditingController();
  bool fullScreen = false;

  int index = 0;

  @override
  void initState() {
    super.initState();
    // backgroupColorHex = widget.group.backgroundHexColor;
    // groupName.text = widget.group.groupName;
    // avatar = widget.group.animatedIconUrl;
    setState(() {});
  }

  @override
  void dispose() {
    groupName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double getSize(int pos) {
      int abs = index - pos;
      abs = abs < 0 ? -abs : abs;
      return (32 - (abs * 4)) / 2;
    }

    final defaultColors = [
      colorFromHex('#2071EE'), // Blue
      colorFromHex('#58BB47'), // Green
      colorFromHex('#FFAD29'), // Orange
      colorFromHex('#F0B90B'), // Yellow
      colorFromHex('#FA7AA2'), // Pink
    ];
    return RefreshIndicator(
      onRefresh: () async => setState(() {}),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              PhosphorIconsBold.caretLeft,
              size: 22,
            ),
          ),
          centerTitle: true,
          title: const Text('Wallet'),
          actions: const [
            Icon(PhosphorIconsRegular.cardholder),
            Gap(20),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 32,
                // context.screenHeight - 55 - context.mediaQueryData.viewPadding.top,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(PhosphorIconsBold.pencilSimple, size: 20),
                    const Gap(10),
                    Text(
                      'Edit Wallet',
                    ),
                  ],
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () async {
                    setState(() => fullScreen = true);
                    AnimatedEmoji? background = await showModalBottomSheet(
                      barrierColor: AppColors.transparent,
                      elevation: 0,
                      isScrollControlled: false,
                      isDismissible: true,
                      enableDrag: true,
                      context: context,
                      sheetAnimationStyle: AnimationStyle(
                        duration: 600.milliseconds,
                        reverseDuration: 600.milliseconds,
                      ),
                      builder: (context) => const _EmojiPicker(),
                    );
                    if (background != null) avatar = background.getEmoji;
                    setState(() => fullScreen = false);
                  },
                  child: Visibility(
                    visible: fullScreen,
                    replacement: WalletCard(
                      showEditable: true,
                      backgroudcolor: AppColors.grey,
                      // backgroupColorHex == null
                      //     ? colorFromHex(widget.group.backgroundHexColor)
                      //     : colorFromHex(backgroupColorHex!),
                      name: groupName.text,
                      profile: widget.personaName,
                      groupImage: avatar,
                    ),
                    child: WalletCard(
                      showEditable: true,
                      backgroudcolor: AppColors.grey,
                      // backgroupColorHex == null
                      //     ? colorFromHex(widget.group.backgroundHexColor)
                      //     : colorFromHex(backgroupColorHex!),
                      name: groupName.text,
                      profile: widget.personaName,
                      groupImage: avatar,
                    ).animate().toggle(
                          duration: 1.seconds,
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Transform.scale(
                                  scale: 1.4,
                                  child: ClipRRect(
                                    child: Align(
                                      widthFactor: 0.7,
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        margin: const EdgeInsets.all(10)
                                            .copyWith(top: 80),
                                        child: WalletCard(
                                          backgroudcolor: AppColors.grey,
                                              // backgroupColorHex == null
                                              //     ? colorFromHex(widget
                                              //         .group.backgroundHexColor)
                                              //     : colorFromHex(
                                              //         backgroupColorHex!),
                                          name: groupName.text,
                                          profile: widget.personaName,
                                          groupImage: avatar,
                                        ).animate().fadeIn(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                  ),
                ),
                const Gap(20),
                Visibility(
                  visible: !fullScreen,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Wallet name',
                    ),
                  ),
                ),
                const Gap(10),
                Visibility(
                  visible: !fullScreen,
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      controller: groupName,
                      onChanged: (v) {},
                      // onSubmitted: (v) => context.unfocus(),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: colorFromHex('#F4F4F6'),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 13,
                        ),
                        
                        hintText: 'Enter Wallet Name',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: !fullScreen,
                    child: Container(
                      height: 100,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < defaultColors.length; i++)
                            GestureDetector(
                              onTap: () => setState(() {
                                index = i + 1;
                                backgroupColorHex =
                                    color_picker.colorToHex(defaultColors[i]!);
                              },),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: CircleAvatar(
                                  radius: getSize(i + 1) + 4,
                                  backgroundColor: index == i + 1
                                      ? defaultColors.elementAt(i)
                                      : AppColors.transparent,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: getSize(i + 1) + 2,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          defaultColors.elementAt(i),
                                      radius: getSize(i + 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                // CustomElevatedButton(
                //   text: 'Continue',
                //   onTap: () async {},
                //   width: double.maxFinite,
                //   height: 55,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmojiPicker extends ConsumerStatefulWidget {
  const _EmojiPicker();
  @override
  ConsumerState<_EmojiPicker> createState() => _EmojiPickerState();
}

class _EmojiPickerState extends ConsumerState<_EmojiPicker> {
  AnimatedEmoji? emoji;
  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Choose an emoji',
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
                      onTap: () {},
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
                    onTap: () {},
                        // context.pop(AnimatedEmoji.values.elementAt(index - 1)),
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
                                color: AppColors.greyLightest,
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
                // context.pop();
                // context.unfocus();
              },
              label: 'Create Wallet',
            ),
          ),
          // Gap(context.mediaQueryData.viewInsets.bottom)
        ],
      ),
    );
  }
}
