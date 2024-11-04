import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/dashboard/presentation/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key});

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
                tabs: ['Token', 'NFT', 'DeFi']
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
    
              Consumer(
                builder: (ctx,ref,child){
                  final selectTokens = ref.watch(tokenSelectionProvider);
                return selectTokens ? GestureDetector(
                  onTap: () {
                  ref.read(tokenSelectionProvider.notifier).toggle();
                },
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.blue),
                  ),
                ) :
              GestureDetector(
                    onTap: () {
                     ref.read(tokenSelectionProvider.notifier).toggle();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
                        PhosphorIconsBold.dotsThreeVertical,
                        size: 22,
                        color: AppColors.greyDark,
                      ),
                    ),
                  );
                },
              ),
             
            ],
          ),
        ),
      );
    });
  }
}
