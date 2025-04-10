import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../../core/extensions/context_extensions.dart';

class TransactionsTable extends StatelessWidget {
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
              Text('STATUS', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
              Gap(55.w),
              Text('VALUE', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
              Gap(47.w),
              Text('PRICE', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
              Gap(70.w),
              Text('ADDRESS', style: context.bodySmall?.copyWith(color: AppColors.greyDark)),
            ],
          ),
          Divider(color: AppColors.greyMedium, height: 1),
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
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              item['status']!.toString(),
                              style: context.labelSmall?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: context.screenWidth * 0.02),
                        Text(item['time']!.toString(), style: context.bodySmall?.copyWith(color: AppColors.greyLight)),
                      ],
                    ),
                    Text(item['value']!.toString(), style: context.bodyMedium?.copyWith(color: statusColor)),
                    Text(item['price']!.toString(), style: context.bodyMedium?.copyWith(color: statusColor)),
                    Row(
                      children: <Widget>[
                        Text(
                          item['emoji']!.toString(),
                          style: context.bodyMedium,
                        ),
                        Column(
                          children: <Widget>[
                            Text(item['address']!.toString(), style: context.bodySmall),
                            SizedBox(
                              width: 60.w,
                              child: LinearProgressIndicator(
                                value: 0.7, // Example progress (adjust as needed)
                                backgroundColor: Colors.grey[300],
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(6),
                                minHeight: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
