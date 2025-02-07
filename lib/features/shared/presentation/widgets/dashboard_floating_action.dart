// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../wallet/presentation/wallet_more_screen.dart';

class DashboardFloatingActionButton extends StatefulWidget {
  final bool show;
  const DashboardFloatingActionButton({
    super.key,
    required this.show,
  });

  @override
  State<DashboardFloatingActionButton> createState() =>
      _DashboardFloatingActionButtonState();
}

class _DashboardFloatingActionButtonState
    extends State<DashboardFloatingActionButton>
    with SingleTickerProviderStateMixin {
  bool dialogOpen = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // Adjust duration
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () async {
            _controller.forward(); // Start scale animation
            setState(() {
              dialogOpen = true;
            });
            await showDialog(
              context: context,
              useSafeArea: false,
              builder: (BuildContext context) => DashboardActionButtonDialog(),
            );
            _controller.reverse();
            setState(() {
              dialogOpen = false;
            });
          },
          child: CircleAvatar(
            backgroundColor: AppColors.blue,
            radius: 50 / 2,
            child: AnimatedRotation(
              turns: dialogOpen ? 0.5 : 0,
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: Icon(
                size: 26,
                PhosphorIcons.caretDoubleUp(PhosphorIconsStyle.bold),
                color: AppColors.white,
              ),
            ),
          ),
        ),
      );
}

class DashboardActionButtonDialog extends StatefulWidget {
  const DashboardActionButtonDialog({
    super.key,
  });

  @override
  State<DashboardActionButtonDialog> createState() =>
      _DashboardActionButtonDialogState();
}

class _DashboardActionButtonDialogState
    extends State<DashboardActionButtonDialog>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();

    super.dispose();
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Opacity(
          opacity: _animation.value,
          child: Center(
            child: GestureDetector(
              onTap: () {
                _controller.animateBack(0);
                Navigator.of(context, rootNavigator: false).pop();
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                constraints: const BoxConstraints.tightFor(),
                padding: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft, // Start from the bottom left
                    end: Alignment.topRight, // End at the top right
                    colors: [
                      Colors.white, // More white at the bottom
                      Color.fromARGB(182, 255, 255, 255), // Less white at the top
                    ],
                    stops: [0.1, 0.9], // 10% of the screen is solid white, then it starts fading
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    physics: PageScrollPhysics(),
                    controller: _scrollController,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.87,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IconButton(
                                  onTap: () {},
                                  backgroundColor: AppColors.green, //*Green
                                  label: 'Buy', //*Green
                                  child: Icon(PhosphorIcons.plus()),
                                ),
                                _IconButton(
                                  // onTap: (){
                                  //   SendScreenRoute().push(context);
                                  // },
                                  backgroundColor: AppColors.blue, //*Blue
                                  label: 'Send',
                                  child: Icon(PhosphorIconsFill.paperPlaneTilt),
                                ),
                                _IconButton(
                                  onTap: () {},
                                  backgroundColor: Color.fromARGB(255, 249, 34, 112), //*Pink
                                  label: 'Receive',
                                  child: Icon(PhosphorIcons.arrowDown()),
                                ),
                                _IconButton(
                                  // onTap: () =>
                                  //     const SwapScreenRoute().push(context),
                                  backgroundColor: AppColors.yellow,
                                  //*Yellow
                                  label: 'Swap',
                                  child: Icon(PhosphorIcons.arrowsCounterClockwise()),
                                ),
                                _IconButton(
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => WalletMoreScreen()),
                                  ),
                                  backgroundColor: AppColors.red, //*Yellow
                                  label: 'More',
                                  child: Icon(PhosphorIcons.caretDown()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _IconButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Widget child;
  const _IconButton({
    this.label,
    this.onTap,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: backgroundColor,
                  child: child,
                ),
              ),
              if (label != null) const Gap(5),
              if (label != null) const Gap(10),
              Text(
                label!,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
          const Gap(20)
        ],
      );
}