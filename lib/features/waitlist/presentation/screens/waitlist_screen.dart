import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';

class WaitlistScreen extends ConsumerStatefulWidget {
  const WaitlistScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WaitlistScreenState();
}

class _WaitlistScreenState extends ConsumerState<WaitlistScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isTextFieldFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: const ElasticOutCurve(0.8),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _focusNode.addListener(_onFocusChange);

    unawaited(_startRotationAnimation());
  }

  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = _focusNode.hasFocus;
    });
    if (_isTextFieldFocused) {
      _controller.stop();
      _controller.animateTo(0, duration: const Duration(milliseconds: 500));
    } else {
      unawaited(_startRotationAnimation());
    }
  }

  Future<void> _startRotationAnimation() async {
    while (!_isTextFieldFocused) {
      await Future<void>.delayed(const Duration(seconds: 3));
      if (!_isTextFieldFocused) await _controller.forward();
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!_isTextFieldFocused) await _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onTap: () {
            if (_focusNode.hasFocus) {
              _focusNode.unfocus();
            }
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/waitlist-screen-header-gradient-component.png',
                      width: double.infinity,
                    ),
                    const Positioned(
                      bottom: 20,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Defy',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Beta program',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) =>
                      Transform.rotate(
                    angle: _animation.value * math.pi,
                    child: Image.asset(
                      'assets/icons/app-logo-dark-3d.png',
                      width: _isTextFieldFocused ? 105 : 145,
                      height: _isTextFieldFocused ? 105 : 145,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isTextFieldFocused ? 0 : 220,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'on your first Defy journey',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
                AnimatedContainer(
                  height: _isTextFieldFocused ? 20 : 40,
                  duration: const Duration(milliseconds: 300),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.text,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Enter waitlist code',
                      hintStyle: TextStyle(
                        color: AppColors.greyDark,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                if (_isTextFieldFocused) const SizedBox(height: 10),
                if (_isTextFieldFocused)
                  GestureDetector(
                    onTap: () => AccountSetUpFullNameScreenRoute().go(context),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        'Enter Defy (beta)',
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyDark,
                      ),
                      children: [
                        TextSpan(text: 'Defy is still in '),
                        TextSpan(
                          text: 'beta program',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              ', we appreciate your patience on waiting for the release.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
