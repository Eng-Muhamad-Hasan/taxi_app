import 'package:flutter/material.dart';

class CustomScaleFadeAnimation extends StatelessWidget {
  const CustomScaleFadeAnimation({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInToLinear,
      builder: (context, value, child) {
        final double translateY = (1 - value) * 25.0; // slide up
        final double scale = 0.95 + 0.05 * value; // slight scale
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: Transform.scale(scale: scale, child: child),
          ),
        );
      },
      child: child,
    );
  }
}
