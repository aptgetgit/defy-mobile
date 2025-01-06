// ignore_for_file: non_constant_identifier_names
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/components/animated_emoji_picker.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/card_customization_widget.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/color_picker_section.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final cardZoomedProvider = StateProvider.autoDispose<bool>((ref) => false);

class WalletCreationStageTwo extends ConsumerStatefulWidget {
  const WalletCreationStageTwo({super.key});

  @override
  ConsumerState<WalletCreationStageTwo> createState() =>
      _WalletCreationStageTwoState();
}

class _WalletCreationStageTwoState extends ConsumerState<WalletCreationStageTwo>
    with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    ref.read(cardZoomedProvider.notifier).state = false;
  }
      
  bool emojiOpen = false;
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: WalletCreationAppBar(index: 2),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s Create your new Wallet 🥳',
                    style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),
                  ),
                  const Gap(18),
                  Row(children: [
                    const Icon(PhosphorIconsBold.smiley),
                    const Gap(5),
                    Text(
                      emojiOpen ? 'Add Display emoji' : 'Select background',
                      style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),
                    ),
                  ],),
                  const Gap(6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      'Choose the color of your wallet, you can edit this anytime.',
                      style: TextStyle(fontSize: 16,fontWeight:FontWeight.w500,color: AppColors.greyLight),
                    ),
                  ),
                ],
              ),
            ),
            Consumer(builder: (context, ref, child) {
              final cardZoomed = ref.watch(cardZoomedProvider);
              return Gap(cardZoomed ? 20 : 50);
            }),
            const CardCustomizationWidget(disableAnimation: false),
            const Spacer(),
            const ColorPickerSection(),
            const Gap(120),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 128,
        child: Center(
          child: ConfirmButton(
            onTap: () async {
              context.unfocus();
              setState(() => emojiOpen = true);
              await showAnimtedEmojiPicker(context, ref, this);
              setState(() => emojiOpen = false);
            },
          ),
        ),
      ),
    );
  }
}
