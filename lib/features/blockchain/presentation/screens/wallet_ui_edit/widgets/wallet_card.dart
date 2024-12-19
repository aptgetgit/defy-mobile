import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WalletCard extends StatelessWidget {
  final String name;
  final String? profile;
  final String groupImage;
  final String? amount;
  final Color backgroudcolor;
  final VoidCallback? onEdit;
  final double width;
  final double height;
  final bool showEditable;
  const WalletCard({
    super.key,
    this.amount,
    this.profile,
    required this.name,
    required this.groupImage,
    required this.backgroudcolor,
    this.onEdit,
    this.height = 187,
    this.width = 342,
    this.showEditable = false,
  });

  @override
  Widget build(BuildContext context) {
    // final appFont = context.appFont;
    return Container(
      margin: const EdgeInsets.all(10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroudcolor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 9,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Assets.images.doodleLeft.svg(),
          ),
          Positioned(
            top: 10,
            left: 60,
            child: Assets.images.doodleRight.svg(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Assets.images.sprinkle.svg(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Assets.images.sprinkleBottom.svg(),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 23, right: 20),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white38,
                      radius: 25,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CachedNetworkImage(
                              height: 40,
                              width: 40,
                              imageUrl: groupImage,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const SizedBox(),
                            ),
                          ),
                          if (showEditable)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: AppColors.white,
                                child: PhosphorIcon(
                                  PhosphorIcons.pencilSimple(
                                    PhosphorIconsStyle.fill,
                                  ),
                                  size: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    title: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.white)),
                    subtitle: const Text('Created on 25 Aug, 2021',style: TextStyle(fontSize: 13.4,fontWeight: FontWeight.w600,color: AppColors.white)),
                    trailing: Column(
                      children: [
                        const Gap(7),
                        Icon(
                          PhosphorIcons.qrCode(),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Gap(24),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(fontSize: 15.63,fontWeight: FontWeight.w400,color: AppColors.white),
                          ),
                          Text(
                            amount ?? '-------------',
                            style: TextStyle(fontSize: 26.8,fontWeight: FontWeight.w600,color: AppColors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${profile ?? ''}  ',
                            style: TextStyle(fontSize: 17.8,fontWeight: FontWeight.w600,color: AppColors.white),
                          ),
                          // Visibility(
                          //   visible: onEdit != null,
                          //   child: GestureDetector(
                          //     onTap: onEdit,
                          //     child: Card(
                          //       margin: EdgeInsets.zero,
                          //       elevation: 0,
                          //       color: Colors.white38,
                          //       child: SizedBox(
                          //         height: 30,
                          //         width: 90,
                          //         child: Center(
                          //           child: Text(
                          //             'Customise',
                          //             style: AppFont.of(context)
                          //                 .InfoRegular
                          //                 .copyWith(color: whiteColor),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const Gap(24),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
