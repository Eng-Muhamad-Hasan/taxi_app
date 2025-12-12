import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_text_animation.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_styles.dart';
import 'signup_gray_bubble_widget.dart';
import 'signup_view_content.dart';
import 'signup_view_header.dart';
import 'signup_yellow_bubble_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 57),
          CustomTextAnimation(
            textWidget: Text(
              'مرحبًا بك معنا',
              textAlign: TextAlign.center,
              style: AppStyles.semiBold24.copyWith(color: AppColors.textColor),
            ),
          ),
          const SizedBox(height: 52),
          const Stack(
            clipBehavior: Clip.none,
            children: [
              SignupYellowBubbleWidget(),
              SignupGrayBubbleWidget(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [SignupViewHeader(), SignupViewContent()],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
