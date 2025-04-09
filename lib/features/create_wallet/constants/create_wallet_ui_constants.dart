import 'package:flutter/material.dart';

class CreateWalletConstants {
  static const Duration animationDuration = Duration(milliseconds: 500);
  static const Duration positionAnimationDuration = Duration(milliseconds: 500);
  static const double cardHeight = 200;
  static const double emojiSize = 40;
  static const double borderRadius = 20;
  static const List<LinearGradient> walletColors = <LinearGradient>[
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xff2071EE),
        Color(0xff0051CF),
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xff58BB47),
        Color(0xff3A9D29),
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xffFFAD29),
        Color(0xffE18F1E),
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xffF0B90B),
        Color(0xffD99A0A),
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: <Color>[
        Color(0xffFA7AA2),
        Color(0xffF07098),
      ],
    ),
  ];
}
