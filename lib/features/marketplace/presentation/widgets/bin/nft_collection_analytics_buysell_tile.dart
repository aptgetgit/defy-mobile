import 'package:defy/config/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class NFTCollectionAnalyticsBuysellTile extends StatelessWidget {
  const NFTCollectionAnalyticsBuysellTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "1",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                "0x95...5621",
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "167",
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 16,
                    height: 16,
                    image: AssetImage("assets/icons/aptos-logo.png"),
                  ),
                  const Gap(4),
                  Text(
                    "10.5690",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(16)
      ],
    );
    ;
  }
}
