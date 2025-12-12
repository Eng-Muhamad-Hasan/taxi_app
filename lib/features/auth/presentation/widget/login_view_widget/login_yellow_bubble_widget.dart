import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_ltr_animation.dart';
import 'package:taxi_app/core/shared/custom_yellow_bubble.dart';

class LoginYellowBubbleWidget extends StatelessWidget {
  const LoginYellowBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * .25,
      right: -200,
      child: const CustomLtrAnimation(childWidget: CustomYellowBubble()),
    );
  }
}
