// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'package:bip39/bip39.dart' as bip39;
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum SeedKeyState {
  normal,
  invalid,
  valid,
}

class ImportSeedKeyScreen extends ConsumerStatefulWidget {
  const ImportSeedKeyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportSeedKeyScreenState();
}

class _ImportSeedKeyScreenState extends ConsumerState<ImportSeedKeyScreen> {
  final seedKey = TextEditingController();
  final FocusNode seedKeyFocusNode = FocusNode();
  SeedKeyState validation = SeedKeyState.normal;

  List<String> seedList = [];

  @override
  void initState() {
    super.initState();
    ServicesBinding.instance.keyboard.addHandler((KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.backspace &&
          seedKey.text.isEmpty &&
          seedList.isNotEmpty) {
        seedKey.text = seedList.last;
        seedList.removeLast();
        setState(() {});
      }
      return false;
    });
  }

  @override
  void dispose() {
    seedKey.dispose();
    seedKeyFocusNode.dispose();
    super.dispose();
  }

  void focusTextField() {
    FocusScope.of(context).requestFocus(seedKeyFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
      ),
      body: GestureDetector(
        onTap: () {},
        child: SingleChildScrollView(
          child: Container(
            height: context.screenHeight - 55 - MediaQuery.of(context).padding.top,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Import through seed key 🤫',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),
                ),
                const Gap(10),
                const Row(children: [
                  Icon(PhosphorIconsBold.password, size: 20),
                  Gap(5),
                  Text(
                    'Seed Key',
style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
                  ),
                ]),
                const Gap(10),
                Text(
                  'Enter your 12 or 24 words Seed Phrase below to import your wallet',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: focusTextField,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 140),
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: switch (validation) {
                          SeedKeyState.valid => Colors.green,
                          SeedKeyState.invalid => Colors.red,
                          _ => colorFromHex('#CFD2D8')!,
                        },
                        width: 2,
                      ),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 15,
                      runSpacing: 15,
                      children: [
                        for (int i = 0; i < seedList.length; i++)
                          ElTooltip(
                            timeout: 1.seconds,
                            position: ElTooltipPosition.bottomCenter,
                            color: colorFromHex('#2071EE')!,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            distance: 8,
                            modalConfiguration:
                                const ModalConfiguration(opacity: 1),
                            showChildAboveOverlay: false,
                            showModal: false,
                            content: Text(
                              seedList.elementAt(i),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorFromHex('#f4f4f6'),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => setState(
                                      () => seedList.removeAt(i),
                                    ),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: colorFromHex('cfd2d8'),
                                      child: const Icon(
                                        PhosphorIconsBold.x,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    seedList.elementAt(i),
                                  ),
                                  const Gap(5)
                                ],
                              ),
                            ),
                          ),
                        Visibility(
                          visible: seedList.length <= 24,
                          child: SizedBox(
                            height: 36,
                            width: context.screenWidth * .5,
                            child: TextField(
                              controller: seedKey,
                              focusNode: seedKeyFocusNode,
                              onChanged: (v) {
                                // if (v.isEmpty && seedList.isNotEmpty) {
                                //   seedKey.text = seedList.last;
                                //   seedList.removeLast();
                                //   setState(() {});
                                // }
                                // else
                                if (v.endsWith(' ') && v.length >= 2) {
                                  v
                                      .split(" ")
                                      .map((e) => {
                                            if (e.isNotEmpty)
                                              seedList.add(e.trim())
                                          })
                                      .toList();

                                  validation = SeedKeyState.normal;
                                  seedKey.clear();
                                  setState(() {});
                                }
                              },
                              onSubmitted: (v) {
                                if (v.isNotEmpty) {
                                  v
                                      .split(" ")
                                      .map((e) => {
                                            if (e.isNotEmpty)
                                              seedList.add(e.trim())
                                          })
                                      .toList();
                                  validation = SeedKeyState.normal;
                                  seedKey.clear();
                                  setState(() {});
                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 13,
                                  left: 6,
                                  right: 6,
                                ),
                                hintText: seedList.isEmpty
                                    ? 'Enter Your Seed Phase'
                                    : '',
                                hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Visibility(
                        visible: seedList.isNotEmpty,
                        child: InkWell(
                          onTap: () => setState(() {
                            seedList = [];
                            validation = SeedKeyState.normal;
                          }),
                          child: Text(
                            'Clear All',
                          ),
                        ),
                      ),
                      const Spacer(),
                      switch (validation) {
                        SeedKeyState.invalid => const PhosphorIcon(
                            PhosphorIconsRegular.x,
                            color: Colors.red,
                            size: 18,
                          ),
                        SeedKeyState.valid => const PhosphorIcon(
                            PhosphorIconsFill.checkCircle,
                            color: Colors.green,
                            size: 18,
                          ),
                        _ => Container(),
                      },
                      Text(
                        switch (validation) {
                          SeedKeyState.invalid => ' Not Valid',
                          SeedKeyState.valid => 'Verified',
                          _ => '',
                        },
                        // style: AppFont.of(context).DescriptionRegular.copyWith(
                        //       color: switch (validation) {
                        //         SeedKeyState.valid => Colors.green,
                        //         SeedKeyState.invalid => Colors.red,
                        //         _ => Colors.transparent,
                        //       },
                        //     ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                ConfirmButton(
                  onTap: (){},
                  label: seedList.isEmpty ? 'Generate seed phase' : 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> submit() async {
  //   validation = bip39.validateMnemonic(seedKey.text)
  //       ? SeedKeyState.valid
  //       : SeedKeyState.invalid;
  //   if (seedList.isEmpty) {
  //     seedList = Mnemonic.generate().toString().split(" ");
  //     setState(() => validation = SeedKeyState.valid);
  //     return;
  //   }
  //   final seed = seedList.reduce((a, b) => '$a $b');
  //   try {
  //     Mnemonic.fromString(seed);
  //     validation = SeedKeyState.valid;
  //   } catch (e) {
  //     validation = SeedKeyState.invalid;
  //   }
  //   if (validation == SeedKeyState.valid) {
  //     //*valid

  //     logger.d(seed);
  //     List<String> secretShare =
  //         ShamirSecretManager(shares: 2).generate(secret: seed);
  //     final res =
  //         await ref.read(createSecretUseCaseProvider).call(secretShare.first);
  //     await ref
  //         .read(credentialStrorageProvider)
  //         .setIdMapSeed(DateTime.now().toString(), seedKey.text);
  //     res.fold(
  //       (l) => context.showToast(
  //         title: 'Operation Failed!',
  //         type: ToastType.error,
  //       ),
  //       (r) async {
  //         await ref
  //             .read(credentialStrorageProvider)
  //             .setIdMapSeed(r.shareId, seed);
  //         Navigator.of(context).push(
  //           MaterialPageRoute(builder: (ctx) {
  //             return SeedCloudBackupScreen(r.shareId, secretShare.second);
  //           }),
  //         );
  //       },
  //     );
  //   } else if (SeedKeyState.invalid == validation) {
  //     //!Invalid
  //     context.showToast(
  //       title: 'Invalid seed',
  //       type: ToastType.error,
  //     );
  //   } else {
  //     context.showToast(
  //       title: 'Enter valid seed key',
  //       type: ToastType.warning,
  //     );
  //   }
  // }
}
