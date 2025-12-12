import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_text_animation.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_styles.dart';
import 'login_gray_bubble_widget.dart';
import 'login_view_content.dart';
import 'login_view_header.dart';
import 'login_yellow_bubble_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
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
              'سعيدون برؤيتك مجددًا',
              textAlign: TextAlign.center,
              style: AppStyles.semiBold24.copyWith(color: AppColors.textColor),
            ),
          ),
          const SizedBox(height: 52),
          const Stack(
            clipBehavior: Clip.none,
            children: [
              LoginYellowBubbleWidget(),
              LoginGrayBubbleWidget(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [LoginViewHeader(), LoginViewContent()],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
