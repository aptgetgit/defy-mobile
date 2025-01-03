import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/vault_market_strategy_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class VaultMarketStrategy extends StatelessWidget {
  const VaultMarketStrategy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Market Strategy",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(12),
        Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child:
                    Image(image: AssetImage("assets/images/Wheat-Award.png"))),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "#32",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const Gap(12),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Popularity",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.greyDark),
          ),
        ),
        const Gap(32),
        const Row(
          children: [
            VaultMarketStrategyItem(
              title: "6",
              subtitle: "No. of coins",
              iconData: PhosphorIconsRegular.coins,
            ),
            VaultMarketStrategyItem(
              title: "Monthly",
              subtitle: "Balance Frequency",
              iconData: PhosphorIconsRegular.scales,
            ),
          ],
        ),
        const Gap(32),
        const Row(
          children: [
            VaultMarketStrategyItem(
              title: "2.24%",
              subtitle: "MCAP Dominance",
              iconData: PhosphorIconsRegular.chartPie,
            ),
            VaultMarketStrategyItem(
              title: "23 days",
              subtitle: "Hold Time",
              iconData: PhosphorIconsRegular.clock,
            ),
          ],
        ),
        const Gap(32),
        const Row(
          children: [
            VaultMarketStrategyItem(
              title: "01 May 24",
              subtitle: "Last Rebalancing",
              iconData: PhosphorIconsRegular.calendarCheck,
            ),
            VaultMarketStrategyItem(
                title: "01 June 24",
                subtitle: "Next Rebalancing",
                iconData: PhosphorIconsRegular.calendarPlus),
          ],
        ),
      ],
    );
  }
}
