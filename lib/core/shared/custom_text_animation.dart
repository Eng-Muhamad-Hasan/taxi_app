import 'package:flutter/material.dart';

class CustomTextAnimation extends StatelessWidget {
  const CustomTextAnimation({super.key, required this.textWidget});
final Widget textWidget;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInToLinear,
      builder: (context, value, child) {
        final double translateY = (1 - value) * 25.0;
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: child,
          ),
        );
      },
      child: textWidget,
    );
  }
}