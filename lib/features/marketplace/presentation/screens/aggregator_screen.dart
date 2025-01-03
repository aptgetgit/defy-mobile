import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/components/vault_list_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'dart:ui' as ui;
import 'package:phosphor_flutter/phosphor_flutter.dart';


class AggregatorScreen extends StatefulWidget {
  const AggregatorScreen({super.key});

  @override
  State<AggregatorScreen> createState() => _AggregatorScreenState();
}

class _AggregatorScreenState extends State<AggregatorScreen> {
  int tabIndex = 0;

  void changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 24,
                  child: Icon(
                    PhosphorIconsBold.caretLeft,
                    size: 24,
                    color: AppColors.greyDark,
                  ),
                ),
                Text(
                  "Aggregator",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            const Gap(26),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    changeTab(0);
                  },
                  child: Row(
                    children: [
                      tabIndex == 0
                          ? ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return ui.Gradient.linear(
                                  Offset(0, 0),
                                  Offset(0, 24.0),
                                  [
                                    Color(0xff627EEA),
                                    Color(0xff2071EE),
                                  ],
                                );
                              },
                              child: Icon(
                                PhosphorIconsFill.vault,
                                size: 24,
                                color: AppColors.greyMedium,
                              ),
                            )
                          : Icon(
                              PhosphorIconsFill.vault,
                              size: 24,
                              color: AppColors.greyMedium,
                            ),
                      const Gap(8),
                      Text(
                        "Vault",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: tabIndex == 0 ? AppColors.black : AppColors.greyMedium),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    changeTab(1);
                  },
                  child: Row(
                    children: [
                      tabIndex == 1
                          ? ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return ui.Gradient.linear(
                                  Offset(0, 0),
                                  Offset(0, 24.0),
                                  [
                                    Color(0xffFA7AA2),
                                    Color(0xffC93E69),
                                  ],
                                );
                              },
                              child: Icon(
                                PhosphorIconsFill.piggyBank,
                                size: 24,
                                color: AppColors.greyMedium,
                              ),
                            )
                          : const Icon(
                              PhosphorIconsFill.piggyBank,
                              size: 24,
                              color: AppColors.greyMedium,
                            ),
                      const Gap(8),
                      Text(
                        "Yield",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: tabIndex == 1 ? AppColors.blue : AppColors.greyMedium),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 24,
                  color: AppColors.greyLight,
                ),
              ],
            ),
            const Gap(24),
            if (tabIndex == 0) VaultListTab()
          ],
        ),
      )),
    );
  }
}
