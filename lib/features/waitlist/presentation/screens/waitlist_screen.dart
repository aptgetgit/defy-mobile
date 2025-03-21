import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/navigation/routes/router.dart';

class WaitlistScreen extends ConsumerStatefulWidget {
  const WaitlistScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WaitlistScreenState();
}

class _WaitlistScreenState extends ConsumerState<WaitlistScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoEntranceController;
  late Animation<double> _logoSizeAnimation;
  late Animation<double> _logoPositionAnimation;
  late Animation<double> _logoInitialRotationAnimation;
  late AnimationController _logoRotationController;
  late Animation<double> _logoRotationAnimation;
  bool _isTextFieldFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _logoRotationController = AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );

    _logoEntranceController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    final CurvedAnimation rotationCurvedAnimation = CurvedAnimation(
      parent: _logoRotationController,
      curve: const ElasticOutCurve(0.8),
    );

    _logoRotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(rotationCurvedAnimation);

    _logoSizeAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _logoEntranceController,
        curve: Curves.easeOut,
      ),
    );

    _logoPositionAnimation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(
        parent: _logoEntranceController,
        curve: Curves.easeOut,
      ),
    );
    _logoInitialRotationAnimation = Tween<double>(begin: -0.5, end: 0).animate(
      CurvedAnimation(
        parent: _logoEntranceController,
        curve: Curves.easeOut,
      ),
    );

    _focusNode.addListener(_onFocusChange);

    Future<void>.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _logoEntranceController
            .forward()
            .then((_) async => _startLogoRotationAnimation());
      }
    });
  }

  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = _focusNode.hasFocus;
    });
    if (_isTextFieldFocused) {
      _logoRotationController
        ..stop()
        ..animateTo(0, duration: const Duration(milliseconds: 500));
    } else {
      unawaited(_startLogoRotationAnimation());
    }
  }

  Future<void> _startLogoRotationAnimation() async {
    while (!_isTextFieldFocused) {
      await Future<void>.delayed(const Duration(seconds: 3));
      if (!_isTextFieldFocused) {
        await _logoRotationController.forward();
      }
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!_isTextFieldFocused) {
        await _logoRotationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _logoRotationController.dispose();
    _logoEntranceController.dispose();
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
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
                            'Welcome',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'on your first Defy journey',
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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 20,
                ),
                AnimatedBuilder(
                  animation: Listenable.merge(
                      [_logoRotationAnimation, _logoEntranceController]),
                  builder: (BuildContext context, Widget? child) =>
                      Transform.translate(
                    offset: Offset(0, _logoPositionAnimation.value),
                    child: Transform.rotate(
                      angle:
                          _logoInitialRotationAnimation.value * -2 * math.pi +
                              _logoRotationAnimation.value * math.pi,
                      child: Transform.scale(
                        scale: _logoSizeAnimation.value,
                        child: Image.asset(
                          'assets/icons/app-logo-dark-3d.png',
                          width: _isTextFieldFocused ? 105 : 145,
                          height: _isTextFieldFocused ? 105 : 145,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isTextFieldFocused ? 0 : 200,
                ),
                AnimatedContainer(
                  height: _isTextFieldFocused ? 60 : 40,
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
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter waitlist code',
                      hintStyle: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                if (_isTextFieldFocused) const SizedBox(height: 24),
                if (_isTextFieldFocused)
                  GestureDetector(
                    onTap: () async {
                      await const WalletCreationScreenRoute()
                          .push<void>(context);
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Text(
                        'Enter Defy (beta)',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
                      children: <InlineSpan>[
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
