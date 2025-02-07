import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class CustomSwipeButton extends StatefulWidget {
  const CustomSwipeButton({required this.onSwipeCompleted, super.key});
  final VoidCallback onSwipeCompleted;

  @override
  CustomSwipeButtonState createState() => CustomSwipeButtonState();
}

class CustomSwipeButtonState extends State<CustomSwipeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _dragPercentage = 0;
  bool _swiped = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    setState(() {
      _dragPercentage =
          (details.localPosition.dx / constraints.maxWidth).clamp(0.0, 1.0);
      _animationController.value = _dragPercentage;
    });
  }

  void _onDragEnd(DragEndDetails details, BoxConstraints constraints) {
    if (_dragPercentage > 0.5) {
      const SpringDescription spring = SpringDescription(
        mass: 1,
        stiffness: 300,
        damping: 20,
      );
      final SpringSimulation simulation =
          SpringSimulation(spring, _dragPercentage, 1, 0);
      _animationController.animateWith(simulation);
      setState(() {
        _swiped = true;
      });
      widget.onSwipeCompleted();
    } else {
      _animationController.reverse();
      setState(() {
        _swiped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              GestureDetector(
            onHorizontalDragUpdate: (DragUpdateDetails details) =>
                _onDragUpdate(details, constraints),
            onHorizontalDragEnd: (DragEndDetails details) =>
                _onDragEnd(details, constraints),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) => Stack(
                children: <Widget>[
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color.lerp(
                          Colors.black, Colors.green, _animation.value),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withAlpha((0.2 * 255).toInt()),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _swiped ? 'Successful' : 'Send',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_animation.value * (constraints.maxWidth - 70))
                        .clamp(0.0, constraints.maxWidth - 70),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.lerp(
                              Colors.black, Colors.green, _animation.value)!,
                          width: 2,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withAlpha((0.2 * 255).toInt()),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        _swiped ? Icons.check : Icons.arrow_forward,
                        color: Color.lerp(
                            Colors.black, Colors.green, _animation.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
