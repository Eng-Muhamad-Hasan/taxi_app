import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

import '../../../../../core/shared/custom_auth_text_field.dart';
import '../../../../../core/shared/custom_main_button.dart';
import '../../../../../core/shared/custom_scale_fade_animation.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

class SignupViewContent extends StatelessWidget {
  const SignupViewContent({super.key});

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
        children: [
          const SizedBox(height: 10),
          CustomScaleFadeAnimation(
            child: SvgPicture.asset(Assets.imagesAuthScreenLogo2),
          ),
          const SizedBox(height: 5),

          Text(
            'Shaheen Taxi',
            style: AppStyles.bold28.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 5),
          const CustomAuthTextField(
            prefixSvgIcon: Assets.imagesUser,
            hintText: "الاسم الكامل",
            keyboardType: TextInputType.text,
          ),

          const SizedBox(height: 36),
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
            obscureText: true,
          ),

          const SizedBox(height: 14),
          CustomMainButton(buttonText: 'إنشاء حساب', onPressed: () {}),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () {
                context.pushReplacementNamed(AppRouter.kLoginView);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'لديك حساب ؟ ',
                      style: AppStyles.regular12.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                    TextSpan(
                      text: 'تسجيل الدخول ',
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
