import 'package:flutter/material.dart';

class CustomLtrAnimation extends StatelessWidget {
  const CustomLtrAnimation({super.key, required this.childWidget});
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -400, end: 0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInToLinear,
      builder: (context, value, child) {
        final double translateX = value;
        return Transform.translate(offset: Offset(translateX, 0), child: child);
      },
      child: childWidget,
    );
  }
}
