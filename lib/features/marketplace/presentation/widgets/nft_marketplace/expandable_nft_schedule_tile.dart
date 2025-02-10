import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../shared/presentation/widgets/custom_check_box.dart';


class ExpandableNFTScheduleTile extends StatefulWidget {
  const ExpandableNFTScheduleTile({super.key});

  @override
  State<ExpandableNFTScheduleTile> createState() =>
      _ExpandableNFTScheduleTileState();
}

class _ExpandableNFTScheduleTileState extends State<ExpandableNFTScheduleTile> {
  bool expand = false;

  ExpansionTileController controller = ExpansionTileController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListTileTheme(
      dense: true,
      minVerticalPadding: 0,
      child: ExpansionTile(
        controller: controller,
        shape: const Border(),
        tilePadding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        leading: const CustomCheckbox(
          isChecked: true,
        ),
        title: const Text(
          'Public Stage',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          'May 28 at 8:30 AM GST+ 5:30',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() => expand = !expand);
            controller.isExpanded ? controller.collapse() : controller.expand();
          },
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            turns: expand ? -0.5 : 0,
            child: const Icon(
              PhosphorIconsBold.caretDown,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        onExpansionChanged: (bool val) {
          setState(() => expand = val);
        },
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 42),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Gap(8),
                    Text(
                      r'~$26.34',
                      style: TextStyle(
                        color: AppColors.greyDark,
                      ),
                    ),
                    Text(
                      'Limit 45 per Wallet',
                      style: TextStyle(
                        color: AppColors.greyDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
