import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../common/presentation/widgets/black_button.dart';

class WelcomeAgainScreen extends ConsumerStatefulWidget {
  const WelcomeAgainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WelcomeAgainScreenState();
}

class _WelcomeAgainScreenState extends ConsumerState<WelcomeAgainScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 108),
              const Text(
                'Hello again, Allan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D1F3C),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text:
                      'Looks like you already have profile created, Missed you! Enjoy a ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greyLight,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'welcome-back reward.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.yellow,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Assets.icons.coinWhite.image(
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '+20 Coins',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) =>
                      Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                        top: 60,
                        left: 40,
                        child: _buildEmojiContainer(
                          emojiAssetPath:
                              Assets.images.grinningFaceWithSmilingEyes.path,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFD4D4D3),
                              Color(0xFFDDDDDD),
                            ],
                          ),
                          padding: 16,
                          angle: 0.2,
                        ),
                      ),
                      Positioned(
                        right: 80,
                        top: 60,
                        child: _buildEmojiContainer(
                          emojiAssetPath:
                              Assets.images.grinningFaceWithSmilingEyes.path,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFCBF4D2),
                              Color(0xFFBBE7CC),
                            ],
                          ),
                          assetHeight: 30,
                          assetWidth: 30,
                          padding: 12,
                          angle: -0.3,
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 0,
                        left: 0,
                        child: Align(
                          child: _buildEmojiContainer(
                            emojiAssetPath: Assets.images.starStruck.path,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xFFDFD8FA),
                                Color(0xFFA38CD4),
                              ],
                            ),
                            assetHeight: 52,
                            assetWidth: 52,
                            padding: 24,
                            angle: 0.4,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 160,
                        left: 30,
                        child: _buildEmojiContainer(
                          emojiAssetPath:
                              Assets.images.smilingFaceWithHalo.path,
                          backgroundColor: const Color(0xffC8EDFD),
                          padding: 20,
                          angle: -0.2,
                          assetHeight: 36,
                          assetWidth: 36,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 80,
                        right: 20,
                        child: _buildEmojiContainer(
                          emojiAssetPath:
                              Assets.images.rollingOnTheFloorLaughing.path,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFF7D9AE),
                              Color(0xFFFFB845),
                            ],
                          ),
                          padding: 16,
                          angle: -0.2,
                          assetHeight: 40,
                          assetWidth: 40,
                        ),
                      ),
                      Positioned(
                        bottom: 130,
                        left: 150,
                        child: _buildEmojiContainer(
                          emojiAssetPath:
                              Assets.images.slightlySmilingFace.path,
                          backgroundColor: const Color(0xFFFDBCBA),
                          padding: 12,
                          angle: 0.3,
                          assetHeight: 24,
                          assetWidth: 24,
                        ),
                      ),
                      Positioned(
                        bottom: 130,
                        right: 40,
                        child: _buildEmojiContainer(
                          emojiAssetPath: Assets.images.kissingFace.path,
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xFFFACED4),
                              Color(0xFFFF9CBB),
                            ],
                          ),
                          padding: 16,
                          angle: 0.3,
                          assetHeight: 30,
                          assetWidth: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BlackButtonXL(
                  onClick: () async {
                    await const ChooseWalletScreenRoute().push<void>(context);
                  },
                  title: 'Choose a Wallet',
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildEmojiContainer({
    required String emojiAssetPath,
    required double padding,
    required double angle,
    double assetHeight = 44,
    double assetWidth = 44,
    Color? backgroundColor,
    Gradient? gradient,
    Color dashedBorderColor = Colors.grey,
    double dashedBorderWidth = 1,
  }) {
    assert(
      backgroundColor != null || gradient != null,
      'Either backgroundColor or gradient must be provided',
    );

    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        painter: DashedCirclePainter(
          color: dashedBorderColor,
          strokeWidth: dashedBorderWidth,
        ),
        child: Container(
          margin: const EdgeInsets.all(6),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: gradient == null ? backgroundColor : null,
            shape: BoxShape.circle,
            gradient: gradient,
          ),
          child: Image.asset(
            emojiAssetPath,
            width: assetWidth,
            height: assetHeight,
          ),
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  DashedCirclePainter({
    required this.color,
    this.strokeWidth = 2, // Adjust for better visibility
    this.dashLength = 8, // Adjust dash size
    this.gapLength = 4, // Adjust spacing
  });

  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
      );
    final PathMetrics pathMetrics = path.computeMetrics();

    for (final PathMetric metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final double nextSegment =
            (distance + dashLength).clamp(0, metric.length);
        canvas.drawPath(metric.extractPath(distance, nextSegment), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
