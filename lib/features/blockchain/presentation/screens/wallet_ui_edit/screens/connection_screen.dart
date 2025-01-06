import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/components/connection_wallet_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const List _list = [
  {
    "image": "https://img.cryptorank.io/coins/uniswap1693307732906.png",
    "title": "Uniswap",
    "subtitle": "uniswap.org",
  },
  {
    "image":
        "https://uploads-ssl.webflow.com/61ff1039861e448062039fa4/6252050a94920c3c11729184_62006466d6c3221847cb8c00_dydx.png",
    "title": "DYDX",
    "subtitle": "dydx.exchange",
  },
  {
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVe0N9AoSLcgDBsh0bEVc0osbuklyp-PyfDAssXvHu6U5-R81KrAeuT2kN_bUSZSrD06Y&usqp=CAU",
    "title": "Aave",
    "subtitle": "aave.com",
  }
];

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const PhosphorIcon(PhosphorIconsBold.caretLeft),
        ),
        title: const Text('Connections',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Icon(
            PhosphorIconsRegular.atom,
            color: colorFromHex('#979DAA'),
          ),
          const Gap(20),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(children: [
              Text(
                '3 Connections',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Disconnect all Dapps',
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(PhosphorIconsBold.x),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Text(
                              'Are you sure you want to disconnect all the connection for this wallet ',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                            ),
                            SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: Center(
                                child: Assets.icons.warning
                                    .image(height: 100, width: 100),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: const Size.fromHeight(48),
                                backgroundColor: colorFromHex('#ffe1e1'),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Disconnect All',
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: colorFromHex('#ffe1e1'),
                  child: Assets.icons.frame.svg(),
                ),
              ),
            ]),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  tileColor: colorFromHex('#f4f4f6'),
                  leading: ClipOval(
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.transparent,
                      child: CachedNetworkImage(
                        imageUrl: _list.elementAt(index)["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(_list.elementAt(index)["title"], style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  subtitle: Text(_list.elementAt(index)["subtitle"], style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyDark),),
                  trailing: CircleAvatar(
                    radius: 12,
                    child: index == 0
                        ? Assets.images.aptosLogo.image()
                        : Assets.images.aptosLogo.image(),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SafeArea(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 16)
                                          .copyWith(top: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  leading: ClipOval(
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: AppColors.transparent,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            _list.elementAt(index)["image"],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: Text(_list.elementAt(index)["title"], style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                  subtitle:
                                      Text(_list.elementAt(index)["subtitle"],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyDark),),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      PhosphorIconsBold.x,
                                      color: colorFromHex('#979DAA'),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          PhosphorIconsBold.appWindow,
                                          color: colorFromHex('#979DAA'),
                                        ),
                                        title: const Text('Wallet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            openConnectionWalletDialog(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            height: 32,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: colorFromHex('#F4F4F6'),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: AnimatedEmoji.SmilingFacewithHeartEyes.getEmoji,
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                const Gap(6),
                                                Text(
                                                  'Business',
                                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.blue),
                                                ),
                                                const Gap(6),
                                                const Icon(Icons
                                                    .keyboard_arrow_down_sharp,color: AppColors.greyDark,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          PhosphorIconsBold.shareNetwork,
                                          color: colorFromHex('#979DAA'),
                                        ),
                                        title: const Text('Network',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),),
                                        trailing: Builder(builder: (context) {
                                          final list = [
                                            Assets.icons.coinLogo,
                                            Assets.icons.coinLogo,
                                            Assets.icons.coinLogo,
                                            Assets.icons.coinLogo,
                                            Assets.icons.coinLogo,
                                          ];
                                          return SizedBox(
                                            height: 22,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Stack(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  children: [
                                                    for (int i = 0;
                                                        i < list.length;
                                                        i++)
                                                      Transform.translate(
                                                        offset: Offset(
                                                            -i * 13 - 25, 0),
                                                        child: list
                                                            .elementAt(i)
                                                            .image(
                                                                height: 20,
                                                                width: 20),
                                                      ),
                                                    Text(
                                                      '+2',
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          PhosphorIconsBold.timer,
                                          color: colorFromHex('#979DAA'),
                                        ),
                                        title: const Text('Connected on',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),),
                                        trailing: Text(
                                          'Jan 2,2024',
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(16),
                                SizedBox(
                                  height: 48,
                                  width: context.screenWidth - 40,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: Color(0xffff6767).withOpacity(.2),
                                            ),
                                            child: Text(
                                              'Disconnect',
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(13),
                                      Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: colorFromHex('#2071EE'),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'Launch App',
                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(20),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Gap(18),
            )
          ],
        ),
      ),
    );
  }
}
