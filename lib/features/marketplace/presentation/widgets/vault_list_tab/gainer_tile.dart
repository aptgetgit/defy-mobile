import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../screens/vault_aggregator_detail_screen.dart';

class GainerTile extends StatelessWidget {
  const GainerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VaultAggregatorDetailScreen(),
          ),
        );
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basket of memes",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Gap(6),
                Row(
                  children: [
                    RowSuper(
                      innerDistance: -4,
                      children: const [
                        Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/Doge-Circle.png"),
                        ),
                        Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/Doge-Circle.png"),
                        ),
                        Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/Doge-Circle.png"),
                        ),
                        Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/Doge-Circle.png"),
                        ),
                      ],
                    ),
                    const Gap(6),
                    Text(
                      "+2",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight,
                      ),
                    )
                  ],
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Investors",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.greyLight,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          "562",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "All time Returns",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.greyLight,
                          ),
                        ),
                        const Gap(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
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
                                color: AppColors.greenLight,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}