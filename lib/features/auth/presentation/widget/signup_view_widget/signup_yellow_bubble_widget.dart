import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_rtl_animation.dart';
import 'package:taxi_app/core/shared/custom_yellow_bubble.dart';

class SignupYellowBubbleWidget extends StatelessWidget {
  const SignupYellowBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * .25,
      left: -200,
      child: const CustomRtlAnimation(childWidget: CustomYellowBubble()),
    );
  }
}
