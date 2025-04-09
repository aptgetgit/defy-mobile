import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FocusNode otpFocusNode = FocusNode();
  int selectedIndex = 0;
  final List<TextEditingController> controllers =
      List<TextEditingController>.generate(
    6,
    (int index) => TextEditingController(),
  );

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

    otpFocusNode.addListener(_onFocusChange);

    Future<void>.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _logoEntranceController
            .forward()
            .then((_) async => _startLogoRotationAnimation());
      }
    });

    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        FocusScope.of(context).requestFocus(otpFocusNode);
      }
    });
  }

  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = otpFocusNode.hasFocus;
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
    otpFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    for (final TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
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
                    animation: Listenable.merge(<Listenable?>[
                      _logoRotationAnimation,
                      _logoEntranceController,
                    ]),
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
                    height: _isTextFieldFocused ? 0 : 120,
                  ),
                  AnimatedContainer(
                    height: _isTextFieldFocused ? 60 : 40,
                    duration: const Duration(milliseconds: 300),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(7, (int index) {
                        if (index == 3) {
                          return Container(
                            width: 20,
                            alignment: Alignment.center,
                            child: const Text(
                              '-',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        final int containerIndex =
                            index > 3 ? index - 1 : index;
                        return Container(
                          width: 45,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedIndex == containerIndex
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          child: RawKeyboardListener(
                            focusNode: otpFocusNode,
                            onKey: (RawKeyEvent event) {
                              if (event is RawKeyDownEvent &&
                                  event.logicalKey ==
                                      LogicalKeyboardKey.backspace) {
                                _handleBackspace(containerIndex);
                              }
                            },
                            child: TextField(
                              controller: controllers[containerIndex],
                              keyboardAppearance: Brightness.dark,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              showCursor: false,
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  selectedIndex = containerIndex;
                                });
                                if (value.isNotEmpty && containerIndex < 5) {
                                  controllers[containerIndex + 1].clear();
                                  controllers[containerIndex + 1].selection =
                                      TextSelection.fromPosition(
                                    const TextPosition(offset: 0),
                                  );
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  AnimatedContainer(
                    height: _isTextFieldFocused ? 60 : 140,
                    duration: const Duration(milliseconds: 300),
                  ),
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
                  const SizedBox(height: 20),
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
        ),
      );
  void _handleBackspace(int currentIndex) {
    if (controllers[currentIndex].text.isEmpty && currentIndex > 0) {
      int previousIndex = currentIndex - 1;
      if (previousIndex == 3) {
        previousIndex = 2;
      }
      setState(() {
        selectedIndex = previousIndex;
      });
      controllers[previousIndex].clear();
      controllers[previousIndex].selection = TextSelection.fromPosition(
        const TextPosition(offset: 0),
      );
    } else {
      controllers[currentIndex].clear();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedIndex', selectedIndex))
      ..add(
        IterableProperty<TextEditingController>('controllers', controllers),
      );
  }
}

class BackspaceTextInputFormatter extends TextInputFormatter {
  BackspaceTextInputFormatter({required this.onBackspace});
  final void Function({required bool isBackspace}) onBackspace;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.isNotEmpty && newValue.text.isEmpty) {
      onBackspace(isBackspace: true);
    } else {
      onBackspace(isBackspace: false);
    }
    return newValue;
  }
}
