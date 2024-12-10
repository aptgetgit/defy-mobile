import 'package:flutter/material.dart';

class FadingText extends StatefulWidget {
  final String text;
  final Duration duration;

  const FadingText({super.key, required this.text, required this.duration});

  @override
  FadingTextState createState() => FadingTextState();
}

class FadingTextState extends State<FadingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final singleCharacterDuration =
        widget.duration.inMilliseconds / widget.text.length;

    _animations = List.generate(widget.text.length, (index) {
      final start =
          (singleCharacterDuration * index) / widget.duration.inMilliseconds;
      final end = (singleCharacterDuration * (index + 1)) /
          widget.duration.inMilliseconds;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeIn),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.text.characters.toList().asMap().entries.map((entry) {
        final index = entry.key;
        final char = entry.value;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _animations[index].value,
              child: Text(
                char,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}