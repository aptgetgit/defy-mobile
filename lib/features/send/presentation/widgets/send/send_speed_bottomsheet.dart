import 'dart:math';
import 'dart:ui';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_carousel/curved_carousel.dart';
// import 'package:defy_mobile/src/config/config.dart';
// import 'package:defy_mobile/src/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';

class SendSpeedBottomSheet extends StatefulWidget {
  const SendSpeedBottomSheet({super.key});

  @override
  State<SendSpeedBottomSheet> createState() => _SendSpeedBottomSheetState();
}

class _SendSpeedBottomSheetState extends State<SendSpeedBottomSheet> {
  final carouselItems = [
    {"color": AppColors.yellow, "icon": PhosphorIcons.lightning(PhosphorIconsStyle.fill)},
    {
      "color": AppColors.blue,
      "icon": PhosphorIcons.thumbsUp(PhosphorIconsStyle.fill)
    },
    {"color": AppColors.purple, "icon": PhosphorIcons.fire(PhosphorIconsStyle.fill)},
    {
      "color": AppColors.greenPastel,
      "icon": PhosphorIcons.piggyBank(PhosphorIconsStyle.fill)
    },
  ];

  int currPage = 2;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.4,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Transaction speed",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  const Gap(24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            "979DAA",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.greyLight),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "60 sec",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            "\$3.50",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.greyLight),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: -60,
                  right: -60,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: BoxDecoration(
                        color: AppColors.blueLight,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 5)),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 5)),
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),

                Positioned.fill(
                  top: 0,
                  child: CustomCarousel(
                    alignment: Alignment.center,
                    // The user will interact with horizontal scroll interactions (ex. swipe left/right):
                    scrollDirection: Axis.horizontal,
                    // Loop the items in the list infinitely:
                    loop: false,
                    // The effectsBuilder takes a ratio from -1 to 1 that indicates this child's
                    // current position in the scroll, where 0 is the selected item,
                    // and uses it to wrap the child in other widgets that apply "effects":
                    effectsBuilder: (_, ratio, child) {
                      final width = MediaQuery.of(context).size.width;
                      // do some preliminary calculations with trig and such:
                      double o = (ratio * -1 + 0.5) * pi;
                      double r = width * 0.6,
                          x = r * cos(o),
                          y = (r * sin(o) * 0.2);
                      double scale = (sin(o) + 2) / 3;
                      double blur = 16 * (1 - scale);

                      // Working from the inside out, we wrap the child in:
                      //  - an Opacity widget to fade it out as it gets further from the middle
                      //  - an ImageFiltered widget to blur it as it gets further from the middle
                      //  - a Transform widget to move it around in a circle
                      // and then return the result:
                      return Transform(
                        transform: Matrix4.identity()
                          ..translate(x, y)
                          ..scale(scale),
                        alignment: Alignment.center,
                        child: ImageFiltered(
                            enabled: blur > 1.1,
                            imageFilter:
                                ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                            child: Opacity(
                              opacity: scale,
                              child: child,
                            )),
                      );
                    },
                    children: [
                      Icon(
                        carouselItems[0]['icon'] as IconData?,
                        color: carouselItems[0]['color'] as Color,
                        size: 32,
                      ),
                      Icon(
                        carouselItems[1]['icon'] as IconData?,
                        color: carouselItems[1]['color'] as Color,
                        size: 32,
                      ),
                      Icon(
                        carouselItems[2]['icon'] as IconData?,
                        color: carouselItems[2]['color'] as Color,
                        size: 32,
                      ),
                      Icon(
                        carouselItems[3]['icon'] as IconData?,
                        color: carouselItems[3]['color'] as Color,
                        size: 32,
                      ),
                    ],
                  ),
                )

                // Positioned(
                //   top: 0,
                //   left: 0,
                //   right: 0,
                //   child: CarouselSlider.builder(
                //     options: CarouselOptions(
                //       autoPlay: false,
                //       aspectRatio: 7,
                //       enlargeCenterPage: true,
                //       enableInfiniteScroll: false,
                //       viewportFraction: 0.2,
                //       initialPage: 2,
                //       enlargeStrategy: CenterPageEnlargeStrategy.scale,
                //       onPageChanged: (index, reason){
                //         print(index);
                //         setState(() {
                //           currPage = index;
                //         });
                //       }
                //     ),
                //
                //     itemCount: carouselItems.length,
                //     itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex)
                //     {
                //            return Container(
                //              height: 200,
                //               child: Stack(
                //                 children: [
                //                   AnimatedPositioned(
                //                     duration: Duration(milliseconds: 300),
                //                     top:currPage != itemIndex ?
                //                     (30 * (pow(pageViewIndex - currPage, 2)))
                //                         .toDouble()
                //                         : 0,
                //                     child: Icon(
                //                       carouselItems[itemIndex]['icon'] as IconData?,
                //                       color:
                //                           carouselItems[itemIndex]['color'] as Color,
                //                       size: 32,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             );
                //           }),
                // ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
