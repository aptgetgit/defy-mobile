import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void openConnectionWalletDialog(BuildContext context, {required}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const _ConnectionWalletSheet();
    },
  );
}

class _ConnectionWalletSheet extends ConsumerStatefulWidget {
  const _ConnectionWalletSheet();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ConnectionWalletSheetState();
}

class __ConnectionWalletSheetState
    extends ConsumerState<_ConnectionWalletSheet> {
  String? current = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: context.screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(PhosphorIconsBold.caretLeft),
                ),
                const Gap(10),
                Text(
                  'Choose Wallet',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    PhosphorIconsBold.x,
                    size: 20,
                  ),
                ),
              ],
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(maxHeight: context.screenHeight* .6),
              margin: const EdgeInsets.only(top: 20, bottom: 58),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    leading: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: [
                          Colors.red,
                          Colors.amber,
                          Colors.blue,
                          Colors.green
                        ].elementAt(index % 4),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            AnimatedEmoji.values.elementAt(index).getEmoji,
                      ),
                    ),
                    title: Text('Account${index + 1}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    subtitle: const Text('\$6768.8',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyDark),),
                    trailing: Transform.scale(
                      scale: 1.2,
                      child: Radio(
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => Colors.grey.shade500,
                        ),
                        activeColor: colorFromHex('#CFD2D8'),
                        toggleable: true,
                        value: 'Account${index + 1}',
                        groupValue: current,
                        onChanged: (v) => setState(() => current = v),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: Text(
                'Shift Connection',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.white),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
