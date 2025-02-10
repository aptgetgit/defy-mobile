import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomSlider extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final double? secondaryValue;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onSecondaryChanged;
  final int? divisions;
  final String? label;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double trackHeight;
  final double thumbSize;
  final bool isDual;
  final bool showLabel;
  final bool animateOnChange;
  final Duration animationDuration;
  final Curve animationCurve;

  const CustomSlider({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    this.secondaryValue,
    required this.onChanged,
    this.onSecondaryChanged,
    this.divisions,
    this.label,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.thumbColor = Colors.white,
    this.trackHeight = 4.0,
    this.thumbSize = 16.0,
    this.isDual = false,
    this.showLabel = true,
    this.animateOnChange = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late double _animatedValue;
  late double _animatedSecondaryValue;

  @override
  void initState() {
    super.initState();
    _animatedValue = widget.value;
    _animatedSecondaryValue = widget.secondaryValue ?? widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAnimatedValues() {
    setState(() {
      _animatedValue = widget.value;
      _animatedSecondaryValue = widget.secondaryValue ?? widget.value;
    });
    if (widget.animateOnChange) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void didUpdateWidget(CustomSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value ||
        oldWidget.secondaryValue != widget.secondaryValue) {
      _updateAnimatedValues();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double primaryPosition =
            (_animatedValue - widget.min) / (widget.max - widget.min);
        final double secondaryPosition =
            (_animatedSecondaryValue - widget.min) / (widget.max - widget.min);

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final double newValue =
                (details.localPosition.dx / box.size.width) *
                        (widget.max - widget.min) +
                    widget.min;
            final clampedValue = newValue.clamp(widget.min, widget.max);

            if (widget.isDual) {
              if ((newValue - widget.min).abs() <
                  (newValue - _animatedSecondaryValue).abs()) {
                widget.onChanged(clampedValue);
              } else {
                widget.onSecondaryChanged?.call(clampedValue);
              }
            } else {
              widget.onChanged(clampedValue);
            }
          },
          child: Container(
            height: math.max(widget.trackHeight, widget.thumbSize),
            width: double.infinity,
            child: CustomPaint(
              painter: _SliderPainter(
                primaryPosition: primaryPosition,
                secondaryPosition: secondaryPosition,
                isDual: widget.isDual,
                activeColor: widget.activeColor,
                inactiveColor: widget.inactiveColor,
                thumbColor: widget.thumbColor,
                trackHeight: widget.trackHeight,
                thumbSize: widget.thumbSize,
                showLabel: widget.showLabel,
                label: widget.label,
                value: _animatedValue,
                secondaryValue: _animatedSecondaryValue,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliderPainter extends CustomPainter {
  final double primaryPosition;
  final double secondaryPosition;
  final bool isDual;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double trackHeight;
  final double thumbSize;
  final bool showLabel;
  final String? label;
  final double value;
  final double secondaryValue;

  _SliderPainter({
    required this.primaryPosition,
    required this.secondaryPosition,
    required this.isDual,
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
    required this.trackHeight,
    required this.thumbSize,
    required this.showLabel,
    this.label,
    required this.value,
    required this.secondaryValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.fill;

    final Paint activeTrackPaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;

    final Paint thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final double trackLeft = 0;
    final double trackRight = size.width;
    final double trackTop = (size.height - trackHeight) / 2;

    // Draw inactive track
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(trackLeft, trackTop, trackRight - trackLeft, trackHeight),
        Radius.circular(trackHeight / 2),
      ),
      trackPaint,
    );

    // Draw active track
    if (isDual) {
      final double left = trackLeft +
          (trackRight - trackLeft) *
              math.min(primaryPosition, secondaryPosition);
      final double right = trackLeft +
          (trackRight - trackLeft) *
              math.max(primaryPosition, secondaryPosition);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(left, trackTop, right - left, trackHeight),
          Radius.circular(trackHeight / 2),
        ),
        activeTrackPaint,
      );
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(trackLeft, trackTop,
              (trackRight - trackLeft) * primaryPosition, trackHeight),
          Radius.circular(trackHeight / 2),
        ),
        activeTrackPaint,
      );
    }

    // Draw thumbs
    final double primaryThumbCenterX =
        trackLeft + (trackRight - trackLeft) * primaryPosition;
    final double thumbCenterY = size.height / 2;

    // Ensure the thumb doesn't go beyond the track's edges
    final double clampedPrimaryThumbCenterX =
        primaryThumbCenterX.clamp(thumbSize / 2, size.width - thumbSize / 2);
    canvas.drawCircle(Offset(clampedPrimaryThumbCenterX, thumbCenterY),
        thumbSize / 2, thumbPaint);

    if (isDual) {
      final double secondaryThumbCenterX =
          trackLeft + (trackRight - trackLeft) * secondaryPosition;
      final double clampedSecondaryThumbCenterX = secondaryThumbCenterX.clamp(
          thumbSize / 2, size.width - thumbSize / 2);
      canvas.drawCircle(Offset(clampedSecondaryThumbCenterX, thumbCenterY),
          thumbSize / 2, thumbPaint);
    }

    // Draw labels
    if (showLabel) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: label ?? value.toStringAsFixed(1),
          style: TextStyle(color: activeColor, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(clampedPrimaryThumbCenterX - textPainter.width / 2,
            thumbCenterY - thumbSize - textPainter.height),
      );

      if (isDual) {
        final secondaryTextPainter = TextPainter(
          text: TextSpan(
            text: secondaryValue.toStringAsFixed(1),
            style: TextStyle(color: activeColor, fontSize: 12),
          ),
          textDirection: TextDirection.ltr,
        );
        secondaryTextPainter.layout();
        final double clampedSecondaryThumbCenterX =
            (trackLeft + (trackRight - trackLeft) * secondaryPosition)
                .clamp(thumbSize / 2, size.width - thumbSize / 2);
        secondaryTextPainter.paint(
          canvas,
          Offset(clampedSecondaryThumbCenterX - secondaryTextPainter.width / 2,
              thumbCenterY - thumbSize - secondaryTextPainter.height),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double borderWidth;
  final double dotRadius;

  const CustomThumbShape({
    this.thumbRadius = 10.0,
    this.borderWidth = 2.0,
    this.dotRadius = 5.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint borderPaint = Paint()
      ..color = const Color(0xff2071EE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Paint innerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint dotPaint = Paint()
      ..color = const Color(0xff2071EE)
      ..style = PaintingStyle.fill;

    // Draw the blue border
    canvas.drawCircle(center, thumbRadius, borderPaint);

    // Draw the white inner circle
    canvas.drawCircle(center, thumbRadius - borderWidth / 2, innerCirclePaint);

    // Draw the blue dot
    canvas.drawCircle(center, dotRadius, dotPaint);
  }
}
