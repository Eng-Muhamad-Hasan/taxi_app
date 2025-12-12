import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_gray_bubble.dart';
import 'package:taxi_app/core/shared/custom_rtl_animation.dart';

class LoginGrayBubbleWidget extends StatelessWidget {
  const LoginGrayBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * .5,
      left: -65,
      child: const CustomRtlAnimation(childWidget: CustomGrayBubble()),
    );
  }
}
