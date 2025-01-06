import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class WatchlistTabBar extends ConsumerWidget {
  const WatchlistTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      return SliverAppBar(
        backgroundColor: const Color(0xffffffff),
        leading : const SizedBox(),
        scrolledUnderElevation: 0,
        expandedHeight: 60,
        collapsedHeight: 60,
        pinned: true,
        flexibleSpace: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TabBar(
                unselectedLabelColor: AppColors.greyLight,
                indicatorColor: AppColors.transparent,
                labelColor: Colors.black,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                dividerColor : Colors.transparent,
                tabs: ['NFTs', 'Tokens', 'People']
                    .map((title) => Row(
                          children: [
                            Text(title,
                                textAlign: TextAlign.left,
                                ),
                            const Gap(20)
                          ],
                        ))
                    .toList(),
                labelStyle : TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
                unselectedLabelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      );
    });
  }
}
