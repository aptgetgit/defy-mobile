import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/dashboard-floating-action-button.dart';

class CustomNavBar extends ConsumerWidget {

  const CustomNavBar({
    super.key,
    required this.pageIndex,
    required this.onTabChange,
    required this.isMoreOptionsSelected,
    required this.onHidePressed,
    required this.onSortPressed,
    required this.onWatchlistPressed,
  });
  final int pageIndex;
  final Function(int) onTabChange;
  final bool isMoreOptionsSelected;
  final VoidCallback onHidePressed;
  final VoidCallback onSortPressed;
  final VoidCallback onWatchlistPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
      color: Colors.transparent,
      height: 97,
      width: MediaQuery.of(context).size.width * 0.85,
      child: AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 800),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: !isMoreOptionsSelected ? 1 : 0.8,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 90,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.black, // Replace with your color
                    borderRadius: isMoreOptionsSelected ? BorderRadius.circular(24) : BorderRadius.circular(64),
                  ),
                  margin: const EdgeInsets.only(top: 18, bottom: 18),
                  child: Center(
                    child: !isMoreOptionsSelected
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(
                                onPressed: () => onTabChange(0),
                                icon: Icon(
                                  color: AppColors.greyDark, // Replace with your color
                                  PhosphorIcons.shootingStar(
                                    pageIndex == 0
                                        ? PhosphorIconsStyle.fill
                                        : PhosphorIconsStyle.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => onTabChange(1),
                                icon: Icon(
                                  color: AppColors.greyDark, // Replace with your color
                                  PhosphorIcons.magnifyingGlass(
                                    pageIndex == 1
                                        ? PhosphorIconsStyle.fill
                                        : PhosphorIconsStyle.bold,
                                  ),
                                ),
                              ),
                              const Gap(20),
                              IconButton(
                                onPressed: () => onTabChange(2),
                                icon: Icon(
                                  color: AppColors.greyDark, // Replace with your color
                                  PhosphorIcons.storefront(
                                    pageIndex == 2
                                        ? PhosphorIconsStyle.fill
                                        : PhosphorIconsStyle.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => onTabChange(3),
                                icon: Icon(
                                  color: AppColors.greyDark, // Replace with your color
                                  PhosphorIcons.clock(
                                    pageIndex == 3
                                        ? PhosphorIconsStyle.fill
                                        : PhosphorIconsStyle.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: onSortPressed,
                                icon: Column(
                                  children: <Widget>[
                                    Icon(
                                      color: AppColors.greyLight, // Replace with your color
                                      PhosphorIcons.arrowBendDoubleUpLeft(
                                        
                                      ),
                                    ),
                                    const Text(
                                      'Sort',
                                      style: TextStyle(
                                        color: AppColors.greyLight, // Replace with your color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: onWatchlistPressed,
                                icon: Column(
                                  children: <Widget>[
                                    Icon(
                                      color: AppColors.greyLight, // Replace with your color
                                      PhosphorIcons.star(
                                        
                                      ),
                                    ),
                                    const Text(
                                      'Watchlist',
                                      style: TextStyle(
                                        color: AppColors.greyLight, // Replace with your color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: onHidePressed,
                                icon: Column(
                                  children: <Widget>[
                                    Icon(
                                      color: AppColors.greyLight, // Replace with your color
                                      PhosphorIcons.eye(
                                        
                                      ),
                                    ),
                                    const Text(
                                      'Hide',
                                      style: TextStyle(
                                        color: AppColors.greyLight, // Replace with your color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Visibility(
                  visible: !isMoreOptionsSelected,
                  child: AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: 95,
                      alignment: Alignment.topCenter,
                      child: DashboardFloatingActionButton(
                        show: pageIndex == 0,
                      ),
                    ),
                  ),
                ),            
              ],
            ),
          ),
        ),
      ),
    );
}
