import 'package:flutter/material.dart';

class CustomYellowBubble extends StatelessWidget {
  const CustomYellowBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const ShapeDecoration(
        color: Color(0xFFFFBB00),
        shape: CircleBorder(),
      ),
    );
  }
}
