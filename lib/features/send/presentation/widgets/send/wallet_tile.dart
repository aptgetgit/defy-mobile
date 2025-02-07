import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../shared/presentation/widgets/custom_check_box.dart';

class WalletTile extends StatefulWidget {
  final bool chooseTokens;
  const WalletTile({super.key, required this.chooseTokens});

  @override
  State<WalletTile> createState() => _WalletTileState();
}

class _WalletTileState extends State<WalletTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        children: [
          const Image(
            height: 40,
            width: 40,
            image: AssetImage("assets/images/avatar-6.png"),
          ),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Allan Jerrold",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Text(
                "aj_22",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff646D80)),
              )
            ],
          ),
          const Spacer(),
          Visibility(
            visible: widget.chooseTokens,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: CustomCheckbox(
                  isChecked: isChecked,
                )),
          )
        ],
      ),
    );
  }
}
