// screens/receive_flow_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../providers/receive_page_provider.dart';
import '../providers/scroll_provider.dart';
import '../widgets/progress_bar.dart';
import 'receive_amount_content.dart';
import 'receive_select_content.dart';
import 'receive_share_content.dart';

class ReceiveFlowScreen extends ConsumerStatefulWidget {
  const ReceiveFlowScreen({super.key});

  @override
  _ReceiveFlowScreenState createState() => _ReceiveFlowScreenState();
}

class _ReceiveFlowScreenState extends ConsumerState<ReceiveFlowScreen> {
  static const Duration _animationDuration = Duration(milliseconds: 300);

  int _currentPage = 1;

  // Header text for each page
  String get _headerText {
    switch (_currentPage) {
      case 1:
        return 'Select Asset';
      case 2:
        return 'Enter Amount';
      case 3:
        return 'Share Link';
      default:
        return 'Select Asset';
    }
  }

  // Subtitle text for each page
  String get _subtitleText {
    switch (_currentPage) {
      case 1:
        return 'Request tokens';
      case 2:
        return 'Request tokens';
      case 3:
        return 'Requesting 10 APT';
      default:
        return 'Request tokens';
    }
  }

  // Navigate to the next page
  void _nextPage() {
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
      ref.read(receiveProvider.notifier).setPage(_currentPage);
    }
  }

  // Navigate to the previous page
  void _previousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
      ref.read(receiveProvider.notifier).setPage(_currentPage);
    } else {
      // If on the first page, pop the entire flow
      Navigator.pop(context);
    }
  }

  // Complete the flow
  void _completeFlow() {
    ref.read(receiveProvider.notifier).setPage(1);
    ref.read(receiveProvider.notifier).clearSelection();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    // Ensure the provider is set to page 1 when the flow starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(receiveProvider.notifier).setPage(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider's currentPage and sync the local _currentPage
    final int providerPage = ref.watch(receiveProvider).currentPage;
    if (providerPage != _currentPage) {
      setState(() {
        _currentPage = providerPage;
      });
    }
    
    // Get the search visibility from the content if it's the select screen
    final bool showSearchIcon = 
        _currentPage == 1 && ref.watch(searchIconVisibilityProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: _previousPage,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(right: 44.w),
          child: ProgressBar(currentPage: _currentPage),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Fixed Header Section (Title, Subtitle, and Search Icon)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Gap(_headerText == 'Select Asset' ? 5.h : 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Static header text with no animation
                          Text(
                            _headerText,
                            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
                          ),
                          if (_currentPage == 1)
                            AnimatedOpacity(
                              opacity: showSearchIcon ? 1.0 : 0.0,
                              duration: _animationDuration,
                              child: IconButton(
                                icon: Icon(
                                  PhosphorIconsBold.magnifyingGlass,
                                  size: 24.sp, 
                                  color: Colors.black,
                                ),
                                onPressed: showSearchIcon 
                                    ? () {
                                        // Scroll to top when pressed
                                        ref.read(scrollToTopProvider.notifier).scrollToTop();
                                      }
                                    : null,
                              ),
                            ),
                        ],
                      ),
                      Gap(_headerText == 'Select Asset' ? 4.h : 8.h),
                      // Static subtitle text with no animation
                      Text(
                        _subtitleText,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content Section (changes based on currentPage)
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Determine the direction of the slide based on page number
        final bool forward = (child.key as ValueKey<int>).value >= _currentPage;
        
        // Create offset for sliding effect
        final Offset beginOffset = forward 
            ? const Offset(1.0, 0.0)  // Right to left (new page slides in from right)
            : const Offset(-1.0, 0.0); // Left to right (new page slides in from left)
            
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: _getContentWithKey(),
    );
  }

  Widget _getContentWithKey() {
    switch (_currentPage) {
      case 1:
        return ReceiveSelectContent(
          key: const ValueKey<int>(1),
          onAssetSelected: _nextPage,
        );
      case 2:
        return ReceiveAmountContent(
          key: const ValueKey<int>(2),
          onNextPressed: _nextPage,
        );
      case 3:
        return ReceiveShareContent(
          key: const ValueKey<int>(3),
          onSharePressed: _completeFlow,
        );
      default:
        return ReceiveSelectContent(
          key: const ValueKey<int>(1),
          onAssetSelected: _nextPage,
        );
    }
  }
}