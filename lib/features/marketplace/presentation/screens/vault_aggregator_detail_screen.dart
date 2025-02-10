import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/presentation/components/vault_aggregator_chart.dart';
import 'package:defy/features/marketplace/presentation/screens/vault_invest_screen.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/vault_constituents_widget.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/vault_return_calculator_widget.dart';
import 'package:defy/features/marketplace/presentation/widgets/vault_list_tab/vault_market_strategy_widget.dart';
import 'package:defy/features/shared/presentation/widgets/black_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class VaultAggregatorDetailScreen extends StatefulWidget {
  const VaultAggregatorDetailScreen({super.key});

  @override
  State<VaultAggregatorDetailScreen> createState() =>
      _VaultAggregatorDetailScreenState();
}

class _VaultAggregatorDetailScreenState
    extends State<VaultAggregatorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            PhosphorIconsBold.caretLeft,
                            size: 24,
                            color: AppColors.greyDark,
                          ),
                          const Gap(14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RowSuper(
                                    innerDistance: -4,
                                    children: const [
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              "assets/images/Doge-Circle.png")),
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              "assets/images/Doge-Circle.png")),
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              "assets/images/Doge-Circle.png")),
                                      Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              "assets/images/Doge-Circle.png")),
                                    ],
                                  ),
                                  const Gap(6),
                                  Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.greyLight),
                                  )
                                ],
                              ),
                              Icon(
                                PhosphorIconsBold.shareNetwork,
                                size: 24,
                                color: AppColors.greyDark,
                              ),
                            ],
                          ),
                          const Gap(14),
                          Text(
                            "Basket of Memes",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Gap(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    PhosphorIconsFill.caretUp,
                                    color: AppColors.greenLight,
                                    size: 18,
                                  ),
                                  const Gap(4),
                                  Text(
                                    "22.71%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: AppColors.greenLight),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            PhosphorIconsBold.users,
                                            size: 24,
                                            color: Colors.black,
                                          ),
                                          const Gap(4),
                                          Text(
                                            "25k+",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(4),
                                      Text(
                                        "Investors",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.greyLight),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VaultAggregatorChart(),
                    const Gap(32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            "A unique coin set tracking the top 6 meme tokens by market cap, offering exposure to viral and entertaining cryptocurrencies",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyDark),
                          ),
                          const Gap(32),
                          const VaultMarketStrategy(),
                          const Gap(32),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.blue), // Blue border
                                backgroundColor: Colors
                                    .transparent, // Transparent background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Border radius 10
                                ),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Check Configuration Log',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const Gap(45),
                          const VaultReturnCalculator(),
                          const Gap(45),
                          const VaultConstituentsWidget(),
                          const Gap(45),
                          Text(
                            "Fees",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(12),
                          Text(
                            "We Believe in 100% transparency to enable your financial success",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark),
                          ),
                          const Gap(32),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  const Image(
                                    height: 38,
                                    width: 38,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/Vault-Investment.png"),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "Investment",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.greyDark),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  const Image(
                                    height: 38,
                                    width: 38,
                                    image: AssetImage(
                                        "assets/images/Vault-Redemption.png"),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "Redemption",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.greyDark),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  const Image(
                                    height: 38,
                                    width: 38,
                                    image: AssetImage(
                                        "assets/images/Vault-Rebalancing.png"),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "Rebalancing",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.greyDark),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const Gap(90)
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: BlackButtonXL(
                  title: "Invest",
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VaultInvestScreen(),
                    ));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
