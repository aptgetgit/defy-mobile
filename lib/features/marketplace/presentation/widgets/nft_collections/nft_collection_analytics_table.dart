import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NFTCollectionAnalyticsTable extends StatelessWidget {
  const NFTCollectionAnalyticsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  "COLLECTION",
                  style: TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HOLDERS",
                      style: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OWNED",
                      style: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(6),
          const Divider(
            thickness: 1,
            color: AppColors.greyMedium,
          ),
          const Gap(16),
          _buildCollectionRow("Cute Rabbit", "22", "22"),
          const Gap(20),
          _buildCollectionRow("Cute Rabbit", "22", "22"),
          const Gap(20),
          _buildCollectionRow("Cute Rabbit", "22", "22"),
          const Gap(20),
          _buildCollectionRow("Cute Rabbit", "22", "22"),
          const Gap(20),
          _buildCollectionRow("Cute Rabbit", "22", "22"),
        ],
      ),
    );
  }

  Widget _buildCollectionRow(String name, String holders, String owned) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  height: 32,
                  width: 32,
                  image: AssetImage("assets/images/Nft-Placeholder.png"),
                ),
              ),
              const Gap(10),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(6),
              Image(
                height: 16,
                width: 16,
                image: AssetImage("assets/images/Blue-Check.png"),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                holders,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                owned,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}