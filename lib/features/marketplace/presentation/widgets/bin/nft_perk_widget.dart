import 'package:defy/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class NFTPerkWidget extends StatelessWidget {
  const NFTPerkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("assets/images/cosmos-bg.png"))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: 32,
              width: 32,
              image: AssetImage("assets/images/rocket.png"),
            ),
            const Spacer(),
            Text(
              "Cosmos",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
            const Gap(4),
            Text(
              "Free entry for Virtual Cosmic event",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
