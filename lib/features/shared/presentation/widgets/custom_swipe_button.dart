import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwipeButton extends StatefulWidget {
  const CustomSwipeButton({super.key, required this.onSwipeCompleted});
  final VoidCallback onSwipeCompleted;

  @override
  _CustomSwipeButtonState createState() => _CustomSwipeButtonState();
}

class _CustomSwipeButtonState extends State<CustomSwipeButton>
    with SingleTickerProviderStateMixin {
  double _dragPercentage = 0;
  bool _swiped = false;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => GestureDetector(
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _dragPercentage =
                    (details.localPosition.dx / constraints.maxWidth)
                        .clamp(0.0, 1.0);
              });
            },
            onHorizontalDragEnd: (DragEndDetails details) {
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
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: _swiped || _dragPercentage > 0.5
                        ? Colors.green
                        : Colors.black,
                    borderRadius: BorderRadius.circular(40.r),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.r,
                        offset: Offset(0, 5.h),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      _swiped ? 'Successful' : 'Send',
                      key: ValueKey(_swiped),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: (_dragPercentage * constraints.maxWidth).clamp(
                      0.0, constraints.maxWidth - 70.w,), // Clamp within bounds
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _swiped || _dragPercentage > 0.5
                            ? Colors.green
                            : Colors.black,
                        width: 2.w,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.r),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10.r,
                          offset: Offset(0, 5.h),
                        ),
                      ],
                    ),
                    child: Icon(
                      _swiped ? Icons.check : Icons.arrow_forward,
                      color: _swiped || _dragPercentage > 0.5
                          ? Colors.green
                          : Colors.black,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
}
