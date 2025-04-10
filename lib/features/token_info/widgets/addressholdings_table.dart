import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../../core/extensions/context_extensions.dart';

class AddressHoldingsTable extends StatelessWidget {
  AddressHoldingsTable({super.key});

  final List<Map<String, dynamic>> _data = <Map<String, dynamic>>[
    {'status': 'B', 'time': '23 sec', 'value': r'$20', 'price': r'$0.19', 'address': '12x9c01d', 'emoji': '🐋'},
    {'status': 'B', 'time': '23 sec', 'value': r'$20', 'price': r'$0.19', 'address': '12x9c01d', 'emoji': '🐋'},
    {'status': 'S', 'time': '23 sec', 'value': r'$20', 'price': r'$0.19', 'address': '12x9c01d', 'emoji': '🦐'},
    {'status': 'B', 'time': '23 sec', 'value': r'$20', 'price': r'$0.19', 'address': '12x9c01d', 'emoji': '🐋'},
    {'status': 'S', 'time': '23 sec', 'value': r'$20', 'price': r'$0.19', 'address': '12x9c01d', 'emoji': '🦐'},
  ];

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(context.screenWidth * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Gap(12.w),
              Text('ADDRESS', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
              Gap(90.w),
              Text('TOKENS HELD', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
              Gap(60.w),
              Text('%HOLDING', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
            ],
          ),
          const Divider(color: AppColors.greyMedium, height: 1),
          ListView.builder(
            padding: EdgeInsets.only(top: context.screenHeight * 0.01),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> item = _data[index];
              final Color statusColor = item['status'] == 'B' ? Colors.green : Colors.red;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01, horizontal: 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          item['emoji']!.toString(),
                          style: context.bodySmall?.copyWith(fontSize: 20),
                        ),
                        Gap(8.w),
                        Column(
                          children: <Widget>[
                            Text(item['address']!.toString(), style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
                          ],
                        ),
                      ],
                    ),
                    Text(item['value']!.toString(), style: context.bodyMedium?.copyWith(color: statusColor)),
                    Text(item['price']!.toString(), style: context.bodyMedium?.copyWith(color: statusColor)),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: context.screenHeight * 0.01),
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle "See all" action
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('See all', style: context.bodyMedium?.copyWith(color: AppColors.greyLight)),
                  const Icon(PhosphorIconsRegular.caretRight, size: 12, color: AppColors.greyLight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}