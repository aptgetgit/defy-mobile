import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../config/theme/colors.dart';
import '../../data/models/token.dart';

class TokenListItem extends StatelessWidget {

  const TokenListItem({
    super.key,
    required this.token,
    required this.onTap,
  });
  final Token token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    token.icon,
                    width: 44,
                    height: 44,
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        token.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        '${token.amount.toStringAsFixed(2)} ${token.symbol}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.greyLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '\$${token.usdValue.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
  );
}
