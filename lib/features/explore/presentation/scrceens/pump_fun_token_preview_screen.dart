import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/button_size_extension.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../shared/presentation/widgets/custom_button.dart';

class PumpFunTokenPreviewScreen extends StatefulWidget {
  const PumpFunTokenPreviewScreen({super.key});

  @override
  State<PumpFunTokenPreviewScreen> createState() => _PumpFunTokenPreviewScreenState();
}

class _PumpFunTokenPreviewScreenState extends State<PumpFunTokenPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = context.screenWidth;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Preview your Token',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : <Widget>[
          Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight2,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: width * .28,
                  height: width * .28,
                  imageUrl: 'https://i.seadn.io/gcs/files/3a5633d4f4374535efe8760919229b0e.png?auto=format&dpr=1&w=1000',
                  errorWidget: (BuildContext ctx, String str, Object obg) =>
                      Container(color: Colors.amber),
                  progressIndicatorBuilder: (BuildContext ctx, String str, DownloadProgress download) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'APTMAN (APTMAN)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Are you APTMAN?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight,),
                  ),
                  const Gap(6),
                  RichText(
                    text: const TextSpan(
                      text: 'Created by ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'TheWeimals',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          text: 'MCAP:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '313',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Replies:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyLight,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '1,322',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children : <Widget>[
                    Text('Deployment fee',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.greyLight),),
                    Text('~0.005 APTOS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),),
                  ],
                ),
                const Gap(16),
                ActiveButton(
                  label: 'Create Token',
                  onTap: () {
                  },
                  size: ButtonSize.large,
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
