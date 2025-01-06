import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/dashboard/presentation/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TotalBalanceWidget extends ConsumerWidget {
  const TotalBalanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var top = 0.0;

    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints){
        return SliverAppBar(
          backgroundColor: Colors.white,
          leading : const SizedBox(),
          scrolledUnderElevation: 0,
          expandedHeight: 150,
          toolbarHeight:  80,
          floating: true,
          snap: true,
          pinned: true,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints _constraints) {
              top = _constraints.biggest.height;
              return AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: (constraints.scrollOffset > 250 && top <= 64) ? 0 :150,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 150,
                        width: double.maxFinite,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              width: MediaQuery.of(context).size.width,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              top: top == 150 ? 15 : 10,
                              left: top == 150 ? 0 - 20  : -(MediaQuery.of(context).size.width / 2) + 65,
                              child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Gap(5),
                                         GestureDetector(
                                          onTap: () {
                                            ref.read(balanceFilterVisibilityProvider.notifier).toggle();
                                          },
                                           child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Text(
                                                "Total balance",
                                                style: TextStyle(fontSize: 14),
                                                  ),
                                                const Icon(PhosphorIconsFill.caretRight, size: 14 ),
                                             ],
                                           ),
                                         ),
                                        const Gap(6),
                                        AnimatedDefaultTextStyle(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          style: TextStyle(fontSize: (top == 150)   ? 36 : 24, fontWeight: FontWeight.w800, color: AppColors.black),
                                          child:  Text.rich(
                                            TextSpan(
                                              text: "\$1,038",
                                              children: [
                                                TextSpan(
                                                  text: ".56",
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.center,
                                          ),

                                        ),
                                        const Gap(14)
                                      ],
                                    ),
                                  ),
                            ),
                            
                             AnimatedPositioned(
                                width: MediaQuery.of(context).size.width,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                bottom: top == 150 ? 8 : 80,
                                right: top == 150 ? 0 - 35:  - (MediaQuery.of(context).size.width / 2) + 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                      width: 90,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius: BorderRadius.circular(33),),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              PhosphorIconsBold.arrowUp,
                                              color: AppColors.greenDark,
                                              size: 14,
                                            ),
                                            const Gap(4),
                                             Text(
                                              "18.73%",
                                              style: TextStyle(fontSize : 14, fontWeight: FontWeight.w700, color: AppColors.greenDark),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          ),

        );

      },
    );

  }
}
