// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:defy/features/send/presentation/widgets/send/multi_select_menu_button.dart';

import '../../../../config/theme/colors.dart';

class SendAssetSelectionTabBar extends StatefulWidget {
  final bool isSelectionMode;
  final Function() onTap;
  final bool isMulti;
  final TabController controller;
  const SendAssetSelectionTabBar({
    super.key,
    required this.isSelectionMode,
    required this.onTap,
    required this.isMulti,
    required this.controller,
  });

  @override
  State<SendAssetSelectionTabBar> createState() =>
      _SendAssetSelectionTabBarState();
}

class _SendAssetSelectionTabBarState extends State<SendAssetSelectionTabBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabBar(
          controller: widget.controller,
          unselectedLabelColor: colorFromHex('#979DAA'),
          indicatorColor: AppColors.transparent,
          labelColor: Colors.black,
          labelStyle: const TextStyle(decoration: TextDecoration.none),
          labelPadding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          splashFactory: NoSplash.splashFactory,
          indicatorSize: TabBarIndicatorSize.label,
          dividerHeight: 0,
          tabs: ['Token', 'NFT']
              .map((title) => Row(
                    children: [
                      Text(title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      const Gap(20)
                    ],
                  ))
              .toList(),
        ),
        Expanded(child: Container()),
        const Gap(16),
        Icon(
          PhosphorIcons.magnifyingGlass(),
          color: AppColors.grey,
          size: 24,
        ),
        const Gap(16),
        if (!widget.isMulti)
          MultiSelectMenuButton(
            onTap: widget.onTap,
            isSelectionMode: widget.isSelectionMode,
          ),
      ],
    );
  }
}
