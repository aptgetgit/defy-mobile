import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExpandableNFTAboutTile extends StatefulWidget {
  const ExpandableNFTAboutTile({Key? key}) : super(key: key);

  @override
  State<ExpandableNFTAboutTile> createState() => _ExpandableNFTAboutTileState();
}

class _ExpandableNFTAboutTileState extends State<ExpandableNFTAboutTile> {
  bool expand = false;
  ExpansionTileController controller = ExpansionTileController();

  @override
  void dispose() {
    super.dispose();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      minVerticalPadding: 0,
      child: ExpansionTile(
        controller: controller,
        shape: const Border(),
        tilePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        title: Text(
          "About",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() => expand = !expand);
            controller.isExpanded ? controller.collapse() : controller.expand();
          },
          child: AnimatedRotation(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            turns: expand ? -0.5 : 0,
            child: Icon(
              PhosphorIconsBold.caretDown,
              size: 20,
              color: AppColors.black,
            ),
          ),
        ),
        onExpansionChanged: (val) {
          setState(() => expand = val);
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Text(
                  "A unique collection of androids living on the planet Mecha. On the planet Mecha, where the shadows of cyberspace merge with mechanical landscapes, androids are not mere creatures but reflect the very essence of the technological age. Here, amidst vast megacities and teeming oceans of information, a drama unfolds in which human ambition and the infinite possibilities of artificial intelligence collide.",
                  style: TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 16,
                  ),
                ),
                const Gap(14),
                _buildInfoRow("5 ETH", "Total Volume", "0.0023 ETH", "Floor Price"),
                const Gap(14),
                _buildInfoRow("--", "Best Offer", "11%", "Listed"),
                const Gap(14),
                _buildSingleInfo("44 (52%)", "Owners(Unique)"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String value1, String label1, String value2, String label2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem(value1, label1),
        _buildInfoItem(value2, label2),
      ],
    );
  }

  Widget _buildInfoItem(String value, String label) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.greyVeryLight,
              borderRadius: BorderRadius.circular(38),
            ),
            child: Center(
              child: Icon(
                PhosphorIconsBold.cube,
                size: 20,
                color: AppColors.greyDark,
              ),
            ),
          ),
          const Gap(6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.greyDark,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSingleInfo(String value, String label) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(38),
          ),
          child: Center(
            child: Icon(
              PhosphorIconsBold.cube,
              size: 20,
              color: AppColors.greyDark,
            ),
          ),
        ),
        const Gap(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: AppColors.greyDark,
              ),
            )
          ],
        )
      ],
    );
  }
}