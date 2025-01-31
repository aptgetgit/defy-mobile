import 'package:flutter/material.dart';

class CustomSwipeButton extends StatefulWidget {
  final VoidCallback onSwipeCompleted;

  CustomSwipeButton({required this.onSwipeCompleted});

  @override
  _CustomSwipeButtonState createState() => _CustomSwipeButtonState();
}

class _CustomSwipeButtonState extends State<CustomSwipeButton>
    with SingleTickerProviderStateMixin {
  double _dragPercentage = 0.0;
  bool _swiped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _dragPercentage =
                    (details.localPosition.dx / constraints.maxWidth)
                        .clamp(0.0, 1.0);
              });
            },
            onHorizontalDragEnd: (details) {
              if (_dragPercentage > 0.5) {
                setState(() {
                  _swiped = true;
                  _dragPercentage = 1.0; // Fully swiped
                });
                widget.onSwipeCompleted(); // Trigger callback
              } else {
                setState(() {
                  _swiped = false;
                  _dragPercentage = 0.0; // Reset swipe
                });
              }
            },
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  height: 70,
                  decoration: BoxDecoration(
                    color: _swiped || _dragPercentage > 0.5
                        ? Colors.green
                        : Colors.black,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      _swiped ? 'Successful' : 'Send',
                      key: ValueKey(_swiped),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: (_dragPercentage * constraints.maxWidth).clamp(
                      0.0, constraints.maxWidth - 70), // Clamp within bounds
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _swiped || _dragPercentage > 0.5
                            ? Colors.green
                            : Colors.black,
                        width: 2,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      _swiped ? Icons.check : Icons.arrow_forward,
                      color: _swiped || _dragPercentage > 0.5
                          ? Colors.green
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
