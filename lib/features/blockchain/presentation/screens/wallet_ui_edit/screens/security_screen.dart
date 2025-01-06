import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SecurityScreen extends ConsumerStatefulWidget {
  const SecurityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SecurityScreenState();
}

class _SecurityScreenState extends ConsumerState<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(PhosphorIconsBold.caretLeft),
        ),
        title: const Text('Security'),
        titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.black),
        centerTitle: true,
        actions: const [
          Icon(PhosphorIconsBold.gearSix),
          Gap(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  PhosphorIconsBold.lockOpen,
                  color: AppColors.greyLight,
                ),
                const Gap(10),
                Text(
                  'Manage keys / Seed phrase',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                )
              ],
            ),
            Divider(
              color: AppColors.divider,
              thickness: 0.3,
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const RevealKeyBottomSheet();
                  },
                );
              },
              child: Container(
                height: 57,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reveal Key',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    PhosphorIcon(
                      PhosphorIconsFill.eyeSlash,
                      color: colorFromHex('#979DAA'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const RevealSeedPhraseSheet();
                  },
                );
              },
              child: Container(
                height: 57,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reveal Seed Phrase',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    PhosphorIcon(
                      PhosphorIconsFill.eyeSlash,
                      color: colorFromHex('#979DAA'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () => RotateKeyScreenRoute().push(context),
              child: Container(
                height: 57,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rotate Key',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    PhosphorIcon(
                      PhosphorIconsBold.caretRight,
                      color: colorFromHex('#979DAA'),
                    )
                  ],
                ),
              ),
            ),

            const Gap(32),

Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  PhosphorIconsBold.lockOpen,
                  color: AppColors.greyLight,
                ),
                const Gap(10),
                Text(
                  'Other Measures',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                )
              ],
            ),
            Divider(
              color: AppColors.divider,
              thickness: 0.3,
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 57,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enable 2FA',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    PhosphorIcon(
                      PhosphorIconsBold.caretRight,
                      color: colorFromHex('#979DAA'),
                    )
                  ],
                ),
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 57,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Additional Signers',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    PhosphorIcon(
                      PhosphorIconsBold.caretRight,
                      color: colorFromHex('#979DAA'),
                    )
                  ],
                ),
              ),
            ),
            // const Gap(32),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Icon(
            //       PhosphorIconsBold.lockOpen,
            //       color: colorFromHex('#979DAA'),
            //     ),
            //     const Gap(10),
            //     Text(
            //       'Security & Privacy',
            //       style: appFont.GeneralMedium.hexColor('#979DAA'),
            //     )
            //   ],
            // ),
            // Divider(
            //   color: colorFromHex('#979DAA'),
            //   thickness: 0.3,
            // ),
            // const Gap(10),
            // GestureDetector(
            //   onTap: () {
            //     context.navigatorPush(const ReceivingNFTScreen());
            //   },
            //   child: Container(
            //     height: 57,
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     decoration: BoxDecoration(
            //       color: colorFromHex('#F4F4F6'),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Receiving NFT',
            //           style: appFont.GeneralMedium,
            //         ),
            //         PhosphorIcon(
            //           PhosphorIconsBold.caretRight,
            //           color: colorFromHex('#979DAA'),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class RevealKeyBottomSheet extends StatefulWidget {
  const RevealKeyBottomSheet({super.key});

  @override
  State<RevealKeyBottomSheet> createState() => _RevealKeyBottomSheetState();
}

class _RevealKeyBottomSheetState extends State<RevealKeyBottomSheet> {

  bool revealPrivate = false;

  void revealPrivateKey() {
    setState((){
      revealPrivate = !revealPrivate;
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    return Container(
    constraints: BoxConstraints(
      maxHeight: revealPrivate ? height * 0.9 : 400,
    ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Security Key',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)
              ),
              GestureDetector(
                onTap: () {
                  context.unfocus();
                  Navigator.of(context).pop();
                },
                child: const Icon(PhosphorIconsBold.x),
              )
            ],
          ),
          Text(
            'uses to receive cryptocurrency transactions',
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.greyLight),
          ),
          const Gap(32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Public Key',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyDark),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text('0x7a8b9c012345678deFEDcBa9876543210FEDCBA',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyDark),),
              ),
            ],
          ),
          const Gap(22),
          Visibility(
            visible : revealPrivate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Private Key',
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorFromHex('#F4F4F6'),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('0x7a8b9c012345678deFEDcBa9876543210FEDCBA'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Visibility(
            visible: !revealPrivate,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorFromHex('#F4F4F6'),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reveal Private Key',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),
                  ),
                  GestureDetector(
                    onTap: () {
                      revealPrivateKey();
                    },
                    child: Icon(
                      PhosphorIconsFill.eyeSlash,
                      color: colorFromHex('#979DAA'),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          ElevatedButton(
            onPressed: () async {
              await Clipboard.setData(const ClipboardData(text: "Public key"));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIcons.copy()),
                Text('Copy ${ revealPrivate ? 'Private' : 'Public'} Key'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RevealSeedPhraseSheet extends StatefulWidget {
  const RevealSeedPhraseSheet({super.key});

  @override
  State<RevealSeedPhraseSheet> createState() => _RevealSeedPhraseSheetState();
}

class _RevealSeedPhraseSheetState extends State<RevealSeedPhraseSheet> {
  bool showSnackBar = false;
  bool revealSeed = false;
  String seed = 'hello below there is a few hudred more tigers girls boys and how are we';
  @override
  void initState() {
    super.initState();
    // seed = Mnemonic.generate().toString();
    setState(() {});
  }

  void revealSeedPhase() {
    setState((){
      revealSeed = !revealSeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Text(
                'Seed Phrase',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)
              ),
              GestureDetector(
                onTap: () {
                  context.unfocus();
                  Navigator.of(context).pop();
                },
                child: const Icon(PhosphorIconsBold.x),
              )
            ],
          ),
          Text(
            'Do not share this with anyone',
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.greyLight),
          ),
          const Gap(32),
          SizedBox(
            width: double.maxFinite,
            height: height*.3,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                width: double.maxFinite,
                
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Wrap(
                  spacing: 18,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: seed
                      .split(" ")
                      .map(
                        (e) => Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: colorFromHex('#fff'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.greyDark),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Visibility(
                visible: !revealSeed,
                child: Center(
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(16.0),
                   child: BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                     child: SizedBox(
                             width: double.maxFinite,
                            height: height*.4,
                       child: Center(
                         child: TextButton(onPressed: revealSeedPhase,child: Text('Show Secret Phrase',),),
                       ),
                     ),
                   ),
                 ),
                ),
              )

              ],
            ),
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Visibility(
              visible: showSnackBar,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      height: 18,
                      width: 18,
                      imageUrl: AnimatedEmoji.WinkingFace.getEmoji,
                    ),
                    const Gap(5),
                    Text(
                      'Copied to Clipboard',
                    ),
                  ],
                ),
              ).animate().scale(duration: 300.microseconds),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                showSnackBar = true;
              });
              await Future.delayed(
                2.seconds,
                () => setState(() => showSnackBar = false),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIcons.copy()),
                const Text('Copy Public Key'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
