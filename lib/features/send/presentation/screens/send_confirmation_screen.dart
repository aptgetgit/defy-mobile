import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../../config/theme/colors.dart';
import '../widgets/send/send_speed_bottomsheet.dart';

class SendConfirmationScreen extends StatefulWidget {
  const SendConfirmationScreen({super.key});

  @override
  State<SendConfirmationScreen> createState() => _SendConfirmationScreenState();
}

class _SendConfirmationScreenState extends State<SendConfirmationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                    color: Colors.black,
                    size: 18,
                  ),
                  const Text(
                    'Send',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                    ),
                  ),
                  Icon(
                    PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
                    color: Colors.black,
                    size: 21,
                  ),

                ],
              ),
              const Gap(20),
              const Text(
                'Confirmation',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 38,
                        width: 38,
                        image: AssetImage(
                            'assets/images/Aptos-Logo.png',),
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Aptos',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,),
                          ),
                          Text(
                            '8 APTOS',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark,),
                          ),
                        ],
                      ),
                      Gap(8),
                    ],
                  ),
                  Icon(
                    PhosphorIcons.arrowRight(PhosphorIconsStyle.bold),
                    color: AppColors.greyLight,
                    size: 24,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 38,
                        width: 38,
                        image: AssetImage(
                            'assets/images/aj_avatar.png',),
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Jasmine',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,),
                          ),
                          Text(
                            'jas_22',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyDark,),
                          ),
                        ],
                      ),
                      Gap(8),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: <Widget>[


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: const Image(
                        height: 32,
                        width: 32,
                        image: AssetImage(
                            'assets/images/Aptos-Logo.png',),
                      ),
                    ),
                    const Gap(8),
                    const Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'AJ_22',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,),
                        ),
                        Gap(4),
                        Text(
                          'Business',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyDark,),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
                        Gap(4),
                        Text.rich(
                          TextSpan(
                            text: r'$672.90 ',
                            children:<InlineSpan>[
                              TextSpan(
                                text: ' -7 APTOS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(16),
                const Divider(
                  color: AppColors.greyMedium,
                    thickness: 1,
                  height: 1,
                ),
                const Gap(16),
                Row(
                  children: <Widget>[
                    Icon(
                      PhosphorIcons.wallet(PhosphorIconsStyle.bold),
                      color: AppColors.greyDark,
                      size: 20,
                    ),
                    const Gap(6),
                    const Text(
                      'Wallet',
                      style: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Image(
                      height: 20,
                      width: 20,
                      image: AssetImage('assets/images/aj_avatar.png'),
                    ),
                    const Gap(4),
                    const Text(
                      'Business',
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(4),
                    Icon(
                      PhosphorIcons.arrowCircleUpRight(PhosphorIconsStyle.bold),
                      color: AppColors.greyDark,
                      size: 20,
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  children: <Widget>[
                    Icon(
                      PhosphorIcons.gasPump(PhosphorIconsStyle.bold),
                      color: AppColors.greyDark,
                      size: 20,
                    ),
                    const Gap(6),
                    const Text(
                      'Gas Fee',
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '#0.30',
                      style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  unawaited(showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) => const SendSpeedBottomSheet(),),);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    child: Row(
                      children: <Widget>[
                      const Text(
                        'Speed',
                        style: TextStyle
                        (
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyDark,
                          fontSize: 16,
                        ),
                      ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  PhosphorIcons.fire(PhosphorIconsStyle.fill),
                                  color: AppColors.purple,
                                  size: 20,
                                ),
                                const Gap(4),
                                const Text(
                                  'Urgent',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(4),
                            const Text(
                              '20 sec',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyLight,
                                  fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(32),
              const Text(
                textAlign: TextAlign.center,
                'Review the above before confirming.\nOnce made, your transaction is irreversible .',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
