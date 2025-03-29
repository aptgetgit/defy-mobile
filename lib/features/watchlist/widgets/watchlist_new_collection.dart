import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../wallet/presentation/providers/wallet_provider.dart';
import '../presentation/watch_list_screen.dart';
import 'watchlist_newList_tile.dart';

class WatchListNewCollectionScreen extends ConsumerStatefulWidget {
  const WatchListNewCollectionScreen({super.key});

  @override
  ConsumerState<WatchListNewCollectionScreen> createState() => _WatchListNewCollectionScreenState();
}

class _WatchListNewCollectionScreenState extends ConsumerState<WatchListNewCollectionScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenKeyboardVisibility();
    });

    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  void _listenKeyboardVisibility() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        onChange: () {
          final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          setState(() {
            _isKeyboardOpen = isOpen;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_checkTextField); 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    final walletState = ref.watch(walletNotifierProvider);
    
    // Calculate total selected items
    final int selectedTokensCount = walletState.selectedTokens.length;
    final int selectedNFTsCount = walletState.selectedNFTs.values
        .fold(0, (sum, list) => sum + list.length);
    final int totalSelectedItems = selectedTokensCount + selectedNFTsCount;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: IconButton(
              icon: Icon(PhosphorIconsRegular.star, size: 24.sp,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: <Widget>[
            Text(
              'Name Your Collection',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
            Gap(20.h),
            const Hero(
              tag: 'new_list',
              child: WatchlistNewListTile(),
            ),
            if (totalSelectedItems > 0) 
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  totalSelectedItems == 1
                      ? '1 item selected'
                      : '$totalSelectedItems items selected',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            Gap(20.h),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24.sp),
              decoration: const InputDecoration(
                hintText: 'List Name',
                hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
                border: InputBorder.none, // Removes the border
              ),
              textAlign: TextAlign.center, // Aligns text to center
            ), 
            const Spacer(),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24.h),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchListScreen()));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? Colors.black
                      : AppColors.greyMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  fixedSize: Size(double.infinity, 56.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
                  child: Text(
                    'Create', 
                    style: TextStyle(
                      color: _isButtonEnabled 
                          ? Colors.white 
                          : AppColors.greyLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({required this.onChange});
  final VoidCallback onChange;

  @override
  void didChangeMetrics() {
    onChange();
  }
}
