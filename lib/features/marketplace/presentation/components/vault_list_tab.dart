
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/gainer_tile.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/loser_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VaultListTab extends StatefulWidget {
  const VaultListTab({super.key});

  @override
  State<VaultListTab> createState() => _VaultListTabState();
}

class _VaultListTabState extends State<VaultListTab> {
  int index = 0;

  void setIndex(int _index) {
    setState(() {
      index = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setIndex(0);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: index == 0 ? AppColors.blue : AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Center(
                    child: Text(
                      "Gainers 💪🏻",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: index == 0 ? AppColors.white : AppColors.greyDark),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(12),
            GestureDetector(
              onTap: () {
                setIndex(1);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: index == 1 ? AppColors.blue : AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Center(
                    child: Text(
                      "Losers  😔",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: index == 1 ? AppColors.white : AppColors.greyDark),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    PhosphorIconsBold.slidersHorizontal,
                    size: 20,
                    color: AppColors.greyDark,
                  ),
                ),
              ),
            )
          ],
        ),
        if (index == 0)
          Column(
            children: [
              GainerTile(),
              GainerTile(),
              GainerTile(),
            ],
          )
        else
          Column(
            children: [
              LoserTile(),
              LoserTile(),
              LoserTile(),
            ],
          )
      ],
    );
  }
}
