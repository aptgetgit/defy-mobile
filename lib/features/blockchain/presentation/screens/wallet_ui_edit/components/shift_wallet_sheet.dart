import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

shiftWalletSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const _ShiftWalletSheet();
    },
  );
}

class _ShiftWalletSheet extends StatefulWidget {
  const _ShiftWalletSheet();

  @override
  State<_ShiftWalletSheet> createState() => __ShiftWalletSheetState();
}

class __ShiftWalletSheetState extends State<_ShiftWalletSheet> {
  String? current;
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
              Text(
                'Shift wallet',
              ),
              GestureDetector(
                onTap: () {},
                child: Transform.rotate(
                  angle: pi * .25,
                  child: const Icon(PhosphorIconsBold.plus),
                ),
              ),
            ],
          ),
          const Gap(10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                text: 'Select a profile to shift your wallet from ',
                children: const [
                  TextSpan(
                    text: 'Rxjs_7',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 27, bottom: 58),
            constraints: BoxConstraints(maxHeight: context.screenHeight * .5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://api.multiavatar.com/ShiftWallet$index.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                  title: Text('Account${index + 1}'),
                  subtitle: Text(
                      '${2 * index * 100 + 3 * index * 10 + index + 234}.00'),
                  trailing: Transform.translate(
                    offset: const Offset(8, 0),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Radio(
                        toggleable: true,
                        focusColor: Colors.green,
                        hoverColor: Colors.red,
                        activeColor: colorFromHex('#2071ee'),
                        value: 'ShiftWallet${index + 1}',
                        groupValue: current,
                        onChanged: (v) => setState(() => current = v),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(10),
            ),
          ),
          OutlinedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              side: BorderSide(color: colorFromHex('#646D80')!),
            ),
            onPressed: () {},
            child: Text(
              'Login with another account',
            ),
          ),
          const Gap(20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromHeight(48),
              backgroundColor:
                  current == null ? colorFromHex('#CFD2D8') : Colors.black,
            ),
            onPressed: () {},
            child: Text(
              'Shift',
            ),
          ),
        ],
      ),
    );
  }
}
