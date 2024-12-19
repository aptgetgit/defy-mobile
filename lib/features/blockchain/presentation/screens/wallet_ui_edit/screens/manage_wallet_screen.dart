import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ManageWalletScreen extends ConsumerStatefulWidget {
  const ManageWalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageWalletScreenState();
}

class _ManageWalletScreenState extends ConsumerState<ManageWalletScreen> {
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(PhosphorIconsBold.caretLeft),
        ),
        title: const Text('Manage'),
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
                  'Manage wallet',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                )
              ],
            ),
            Divider(
              color: AppColors.divider,
              thickness: 0.3,
            ),
            const Gap(10),
            Container(
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
                    'Receiving NFTs',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                  CupertinoSwitch(
              value: enabled,
              onChanged: (_) async {
                final bool? value = await showModalBottomSheet(
                  isScrollControlled: true,
                  elevation: 0,
                  context: context,
                  backgroundColor: colorFromHex('f4f4f6'),
                  builder: (context) {
                    return _ConfirmReceivingNftBottomSheet(active: enabled);
                  },
                );
                setState(() => enabled = value ?? enabled);
              },
            ),
                ],
              ),
            ),
            const Gap(20),
            GestureDetector(
              onTap: () {
                ConnectionScreenRoute().push(context);
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
                      'Apps Connected',
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
                      'Notifications',
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
          ],
        ),
      ),
    );
  }
}

class _ConfirmReceivingNftBottomSheet extends StatefulWidget {
  final bool? active;
  // ignore: unused_element
  const _ConfirmReceivingNftBottomSheet({this.active = false});

  @override
  State<_ConfirmReceivingNftBottomSheet> createState() =>
      __ConfirmReceivingNftBottomSheetState();
}

class __ConfirmReceivingNftBottomSheetState
    extends State<_ConfirmReceivingNftBottomSheet> {
  late bool active;
  bool confirmed = false;

  @override
  void initState() {
    active = widget.active!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(20),
              Text(
                'Confirm',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  PhosphorIconsBold.x,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Gap(20),
          ListTile(
            tileColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5awrRMjYQ68AihQwDAuNbPmAJC_TZ_DpS5w&s',
                height: 55,
                width: 55,
              ),
            ),
            title: Text('Auto Receive NFTs',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            subtitle: const Text('turning off will stop people to airdrop NFTs into your wallet',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyLight),),
          ),
          Visibility(
            visible: !confirmed,
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address Used',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                      ),
                      Text(
                        'Aptos',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Network',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                      ),
                      Text(
                        'Aptos',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Text(
                        'Network Fee',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                      ),
                      const Spacer(),
                      Assets.images.aptosLogo.image(height: 18, width: 18),
                      const Gap(5),
                      Text(
                        '0000.2APT',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !confirmed,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipOval(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: colorFromHex('#FA7AA2'),
                  child: Assets.icons.maleEmoji.image(height: 32, width: 32),
                ),
              ),
              title: const Text('Business',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              subtitle: const Text('Shirakawa Ayane',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.greyLight),),
              
            ),
          ),
          const Gap(20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(55),
            ),
            onPressed: () async {
              active = !active;
              setState(() => confirmed = true);
              await Future.delayed(1200.milliseconds);
              if (!context.mounted) return;
              // context.pop(active);
              Navigator.of(context).pop();
            },
            child: Visibility(
              visible: confirmed,
              replacement: const Text('Confirm request'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    PhosphorIconsFill.checkCircle,
                    color: Colors.green,
                    size: 16,
                  ).animate().scale(duration: 0.5.seconds),
                  const Gap(6),
                  const Text('Done')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
