// screens/receive_amount_content.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';

class ReceiveAmountContent extends StatefulWidget {
  final VoidCallback onNextPressed;

  const ReceiveAmountContent({super.key, required this.onNextPressed});

  @override
  _ReceiveAmountContentState createState() => _ReceiveAmountContentState();
}

class _ReceiveAmountContentState extends State<ReceiveAmountContent> with SingleTickerProviderStateMixin {
  String _amount = '0';
  // Add animation controller and keep track of the last number
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  int _lastDigitPosition = -1;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0), // Start from bottom
      end: Offset.zero,             // End at original position
    ).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Curves.easeOutCubic,    // Smoother curve
    ));
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final ReceiveState receiveState = ref.watch(receiveProvider);
        final Asset? selectedAsset = receiveState.selectedAsset;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(top: 4.h),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      // New animated amount display
                      _buildAnimatedAmount(),
                      Gap(8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '7.06 ${selectedAsset?.symbol ?? "APT"}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.greyLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(4.w),
                          Icon(
                            PhosphorIconsBold.arrowsDownUp,
                            size: 16.sp,
                          ),
                        ],
                      ),
                      Gap(96.h),
                      // Asset Selection
                      Container(
                        height: 66.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.greyVeryLight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(9.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: selectedAsset != null
                                        ? AssetImage(selectedAsset.imagePath)
                                        : const AssetImage('assets/icons/aptos.png'),
                                    radius: 22.r,
                                  ),
                                  Gap(12.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        selectedAsset?.name ?? 'Aptos',
                                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        selectedAsset?.symbol ?? 'APT',
                                        style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(8.w),
                              TextButton(
                                onPressed: () {
                                  // Pass ref to _navigateToPage
                                  _navigateToPage(1, ref);
                                },
                                child: Text(
                                  'Change',
                                  style: TextStyle(color: AppColors.blue, fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(20.h),
                      // Number Pad
                      Column(
                        children: <Widget>[
                          _buildRowButtons(<String>['1', '2', '3']),
                          _buildRowButtons(<String>['4', '5', '6']),
                          _buildRowButtons(<String>['7', '8', '9']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              _buildButton('.'),
                              _buildButton('0'),
                              _buildButton('cancel', PhosphorIconsBold.backspace),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Next Button
              Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: _amount == '0' ? null : widget.onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

  // Helper function to build a row of buttons
  Widget _buildRowButtons(List<String> items) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map(_buildButton).toList(),
      );

  // Helper function to build a single button
  Widget _buildButton(String label, [IconData? icon]) => Expanded(
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            _handleSinglePress(label);
          },
          onLongPress: label == 'cancel'
              ? () {
                  setState(() {
                    _amount = '0';
                  });
                }
              : null,
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 16.w : 8.w,
              vertical: icon == null ? 12.h : 10.h,
            ),
            child: icon == null
                ? Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Icon(icon, size: 22.sp),
          ),
        ),
      );

  // Handle button press
 void _handleSinglePress(String label) {
    // Store previous amount for comparison
    final String previousAmount = _amount;
    
    setState(() {
      if (label == 'cancel') {
        if (_amount.length > 1) {
          _amount = _amount.substring(0, _amount.length - 1);
          _lastDigitPosition = _amount.length - 1;
        } else {
          _amount = '0';
          _lastDigitPosition = 0;
        }
      } else if (label == '.') {
        if (!_amount.contains('.')) {
          _amount += '.';
          _lastDigitPosition = _amount.length - 1;
        }
      } else {
        if (_amount == '0') {
          _amount = label;
          _lastDigitPosition = 0;
        } else {
          _amount += label;
          _lastDigitPosition = _amount.length - 1;
        }
      }
    });
    
    // Only trigger animation if we're adding a character (not deleting)
    if (_amount.length > previousAmount.length) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  // New method to build the animated amount display
  Widget _buildAnimatedAmount() {
    // Split the amount into characters
    final List<String> characters = _amount.split('');
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$',
          style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.w600),
        ),
        ...characters.asMap().entries.map((entry) {
          final int index = entry.key;
          final String char = entry.value;
          
          // Only animate the character at the last digit position
          final bool shouldAnimate = index == _lastDigitPosition && 
                                     _animationController.status != AnimationStatus.completed;
          
          return shouldAnimate
              ? SlideTransition(
                  position: _slideAnimation,
                  child: Text(
                    char,
                    style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.w600),
                  ),
                )
              : Text(
                  char,
                  style: TextStyle(fontSize: 58.sp, fontWeight: FontWeight.w600),
                );
        }).toList(),
      ],
    );
  }

  // Navigate to a specific page
  void _navigateToPage(int page, WidgetRef ref) {
    final ReceiveNotifier receiveNotifier = ref.read(receiveProvider.notifier);
    receiveNotifier.setPage(page);
    // Trigger a rebuild in the parent widget (ReceiveFlowScreen)
    // Since ReceiveFlowScreen is a ConsumerStatefulWidget, we can rely on its setState
    // to update the currentPage. We don't need to call setState here.
  }
}
