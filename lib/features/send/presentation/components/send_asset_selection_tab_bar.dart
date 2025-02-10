import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../providers/send_provider.dart';
import '../widgets/send/multi_select_menu_button.dart';

class SendAssetSelectionTabBar extends ConsumerStatefulWidget {
  final bool isSelectionMode;
  final VoidCallback onTap;
  final bool isMulti;
  final TabController controller;

  const SendAssetSelectionTabBar({
    Key? key,
    required this.isSelectionMode,
    required this.onTap,
    required this.isMulti,
    required this.controller,
  }) : super(key: key);

  @override
  ConsumerState<SendAssetSelectionTabBar> createState() =>
      _SendAssetSelectionTabBarState();
}

class _SendAssetSelectionTabBarState
    extends ConsumerState<SendAssetSelectionTabBar> {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          TabBar(
            controller: widget.controller,
            unselectedLabelColor: colorFromHex('#979DAA'),
            labelColor: Colors.black,
            labelStyle: const TextStyle(decoration: TextDecoration.none),
            labelPadding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.white,
                  width: 0,
                ),
              ),
            ),
            dividerHeight: 0,
            tabs: <String>['Token', 'NFT']
                .map(
                  (String title) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Tab(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Expanded(child: SizedBox()),
          const Gap(16),
          if (!widget.isMulti)
            MultiSelectMenuButton(
              onTap: () {
                widget.onTap();
                ref
                    .read(sendNFTScreenProviderProvider.notifier)
                    .toggleSelectionMode();
              },
              isSelectionMode: widget.isSelectionMode,
            ),
        ],
      );
}
