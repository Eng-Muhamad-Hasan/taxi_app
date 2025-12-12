import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_ltr_animation.dart';

import '../../../../../core/shared/custom_gray_bubble.dart';

class SignupGrayBubbleWidget extends StatelessWidget {
  const SignupGrayBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * .5,
      right: -65,
      child: const CustomLtrAnimation(childWidget: CustomGrayBubble()),
    );
  }
}
