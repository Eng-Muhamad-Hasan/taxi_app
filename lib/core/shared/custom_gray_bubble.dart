import 'package:flutter/material.dart';

class CustomGrayBubble extends StatelessWidget {
  const CustomGrayBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.31,
      child: Container(
        width: 130,
        height: 130,
        decoration: const ShapeDecoration(
          color: Color(0xFFBABCC0),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
