import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void deleteWalletDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        elevation: 0,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        insetPadding: EdgeInsets.all(20),
        content: _DeleteWalletDialog(),
      );
    },
  );
}

class _DeleteWalletDialog extends StatefulWidget {
  const _DeleteWalletDialog();

  @override
  State<_DeleteWalletDialog> createState() => _DeleteWalletDialogState();
}

class _DeleteWalletDialogState extends State<_DeleteWalletDialog> {
  bool transferAsset = false;
  int? select;
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = context.isDarkMode;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Remove Wallet ?",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)
        ),
        const Gap(16),
        Text(
          'your assets will be removed along with this wallet until you import the wallet again',
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyDark),
          textAlign: TextAlign.center,
        ),
        Gap(transferAsset ? 24 : 46),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Transfer all assets to',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => setState(
                () => transferAsset = !transferAsset,
              ),
              child: Visibility(
                visible: select == null,
                replacement: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: colorFromHex('#F4F4F6'),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 12,
                        child: CachedNetworkImage(
                          height: 22,
                          width: 22,
                          imageUrl: AnimatedEmoji.values.elementAt(1).getEmoji,
                        ),
                      ),
                      const Gap(10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Account${select}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorFromHex('#F4F4F6'),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Select Wallet',
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: transferAsset,
          replacement: const Gap(16),
          child: Container(
            margin: const EdgeInsets.only(top: 17, bottom: 13),
            height: 200,
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: colorFromHex('#f9f9fa'),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10)
                  .copyWith(bottom: 40),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (select == index) {
                      select = null;
                    } else {
                      select = index;
                      transferAsset = false;
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 32,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 16,
                          backgroundColor: [
                            Colors.red,
                            Colors.amber,
                            Colors.blue,
                            Colors.green
                          ][index % 4],
                          child: CachedNetworkImage(
                            height: 20,
                            width: 20,
                            imageUrl:
                                AnimatedEmoji.values.elementAt(index).getEmoji,
                          ),
                        ),
                        title: Text('Account$index'),
                        titleTextStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.black),
                        subtitle: const Text('\$6976.34'),
                        subtitleTextStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.greyDark),
                        trailing: Visibility(
                          visible: select == index,
                          child: Icon(
                            PhosphorIcons.checkCircle(),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ).animate().fadeIn(duration: 1.seconds),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 145,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Color(0xfff4f4f6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyDark),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: colorFromHex('#FF6767'),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Remove',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
