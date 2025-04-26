import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../core/navigation/routes/router.dart';
import '../../../common/presentation/widgets/black_button.dart';
import '../providers/onboarding_provider.dart';
import 'dive_in_page.dart';

class WaitlistPrimaryScreen extends HookConsumerWidget {
  const WaitlistPrimaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> showContent = useState(false);
    final ValueNotifier<bool> showOtpFields = useState(false);
    final AnimationController controller = useAnimationController(
      duration: const Duration(milliseconds: 700),
    );
    final TextEditingController pinController = useTextEditingController();
    final FocusNode pinFocusNode = useFocusNode();
    final ValueNotifier<bool> hasFocusedOnce = useState(false);
    final ValueNotifier<bool> showDontHaveCode = useState(false);
    final ValueNotifier<int> codeState = useState(0);

    useEffect(
      () {
        Future<void>.delayed(const Duration(seconds: 1), () {
          showContent.value = true;
        });
        return null;
      },
      <Object?>[],
    );

    final bool showExitAnimation = ref.watch(exitAnimationProvider);
    useEffect(
      () {
        if (showExitAnimation && !controller.isAnimating) {
          Future<void>.delayed(const Duration(milliseconds: 2000), () async {
            await controller.forward().then((_) {
              showOtpFields.value = true;
              if (!hasFocusedOnce.value) {
                pinFocusNode.requestFocus();
                hasFocusedOnce.value = true;
              }
            });
          });
        } else if (!showExitAnimation && controller.value > 0) {
          showOtpFields.value = false;
          controller.reverse();
        }
        return null;
      },
      <Object?>[showExitAnimation],
    );

    useEffect(
      () {
        if (showOtpFields.value) {
          Future<void>.delayed(const Duration(seconds: 2), () {
            showDontHaveCode.value = true;
          });
        } else {
          showDontHaveCode.value = false;
        }
        return null;
      },
      <Object?>[showOtpFields.value],
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const DiveInPage(),
          AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              const Curve curve = Curves.easeInOutQuad;

              final double topPosition = Tween<double>(begin: 240, end: 108)
                  .animate(CurvedAnimation(parent: controller, curve: curve))
                  .value;

              final double leftPosition = Tween<double>(
                begin: MediaQuery.of(context).size.width / 2 - 30,
                end: 24,
              )
                  .animate(CurvedAnimation(parent: controller, curve: curve))
                  .value;

              return Positioned(
                top: topPosition,
                left: leftPosition,
                right: leftPosition,
                bottom: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        MediaQuery.of(context).size.width - (2 * leftPosition),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildAnimatedLogo(
                        showContent.value,
                        showExitAnimation,
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: AnimatedOpacity(
                          opacity: showOtpFields.value ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOutQuad,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Waitlist Code',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Enter the Waitlist Code',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyLight,
                                ),
                              ),
                              const SizedBox(height: 44),
                              _buildPinput(
                                pinController,
                                pinFocusNode,
                                codeState,
                              ),
                              const SizedBox(height: 24),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: showDontHaveCode.value ? 1.0 : 0.0,
                                child: Text(
                                  codeState.value == 0
                                      ? "Don't have a code?"
                                      : codeState.value == 1
                                          ? 'Code is valid'
                                          : 'Invalid code',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: codeState.value == 0
                                        ? AppColors.blue
                                        : codeState.value == 1
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              _buildConfirmButton(
                                context,
                                pinController,
                                pinFocusNode,
                                codeState,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildPinput(
    TextEditingController controller,
    FocusNode focusNode,
    ValueNotifier<int> codeState,
  ) {
    final PinTheme defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return ValueListenableBuilder<int>(
      valueListenable: codeState,
      builder: (BuildContext context, int state, Widget? child) {
        final Color borderColor = state == 0
            ? Colors.transparent
            : state == 1
                ? Colors.green
                : Colors.red;

        final PinTheme currentTheme = defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        );

        return Pinput(
          length: 6,
          controller: controller,
          focusNode: focusNode,
          defaultPinTheme: currentTheme,
          focusedPinTheme: currentTheme,
          submittedPinTheme: currentTheme,
          separatorBuilder: (int index) => const SizedBox(width: 10),
          closeKeyboardWhenCompleted: false,
          onCompleted: (String pin) {
            AppLogger.debug('OTP submitted: $pin');
          },
        );
      },
    );
  }

  Widget _buildConfirmButton(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    ValueNotifier<int> codeState,
  ) =>
      BlackButtonXL(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        title: 'Confirm Code',
        onClick: () async {
          if (controller.text.isNotEmpty) {
            if (controller.text == '123456') {
              AppLogger.debug('Valid OTP submitted: ${controller.text}');
              codeState.value = 1; // Valid code
              focusNode.unfocus();
              await HapticFeedback.heavyImpact();

              Future<void>.delayed(const Duration(seconds: 1), () async {
                // Reset the state
                codeState.value = 0;
                controller.clear();

                if (context.mounted) {
                  await const WalletCreationScreenRoute().push<void>(context);
                }
              });
            } else {
              AppLogger.debug('Invalid OTP submitted: ${controller.text}');
              codeState.value = -1; // Invalid code
              await HapticFeedback.heavyImpact();

              Future<void>.delayed(const Duration(seconds: 1), () {
                codeState.value = 0;
                controller.clear();
              });
            }
          }
        },
      );
  Widget _buildAnimatedLogo(bool showContent, bool showExitAnimation) =>
      Builder(
        builder: (BuildContext context) {
          final Image image = Image.asset(
            'assets/icons/app-icon-dark.png',
            width: 60,
            height: 60,
          );

          image.image.resolve(ImageConfiguration.empty).addListener(
                ImageStreamListener(
                  (ImageInfo info, bool _) {},
                  onError: (dynamic exception, StackTrace? stackTrace) {
                    AppLogger.debug('Error loading image: $exception');
                  },
                ),
              );

          return image
              .animate(target: showContent ? 1 : 0)
              .slideY(
                duration: 600.ms,
                begin: 1,
                end: 0,
                curve: Curves.easeOutBack,
              )
              .fadeIn(duration: 300.ms)
              .animate(target: showExitAnimation ? 1 : 0)
              .custom(
                curve: Curves.easeInOutQuad,
                duration: 600.ms,
                delay: 1500.ms,
                builder: (BuildContext context, double value, Widget child) =>
                    Transform.scale(
                  scale: 1,
                  child: child,
                ),
              );
        },
      );
}
