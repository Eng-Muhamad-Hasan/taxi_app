import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/shared/custom_scale_fade_animation.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/core/utils/app_router.dart';

import '../../../../../core/shared/custom_auth_text_field.dart';
import '../../../../../core/shared/custom_main_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class LoginViewContent extends StatelessWidget {
  const LoginViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
      decoration: const ShapeDecoration(
        color: AppColors.divColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          CustomScaleFadeAnimation(
            child: SvgPicture.asset(Assets.imagesAuthScreenLogo2),
          ),
          const SizedBox(height: 5),

          Text(
            'Shaheen Taxi',
            textAlign: TextAlign.center,
            style: AppStyles.bold28.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 52),
          const CustomAuthTextField(
            prefixSvgIcon: Assets.imagesUser,
            hintText: "البريد الالكتروني",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 36),
          const CustomAuthTextField(
            prefixSvgIcon: Assets.imagesPassword,
            suffixIcon: Assets.imagesObsecureEye,
            hintText: "كلمة المرور",
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 12),
          Text(
            'نسيت كلمة المرور ؟',
            textAlign: TextAlign.start,
            style: AppStyles.bold12.copyWith(color: AppColors.textColor),
          ),
          const SizedBox(height: 14),
          CustomMainButton(buttonText: 'تسجيل الدخول', onPressed: () {}),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () {
                context.pushReplacementNamed(AppRouter.kSignupView);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'ليس لديك حساب ؟ ',
                      style: AppStyles.regular12.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                    TextSpan(
                      text: 'انشئ حسابك الآن',
                      style: AppStyles.bold12.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
