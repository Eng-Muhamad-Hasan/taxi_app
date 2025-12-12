import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/shared/custom_main_button.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 60),
          Center(child: SvgPicture.asset(Assets.imagesAuthScreenLogo)),
          const SizedBox(height: 42),
          Text(
            'مرحباً بك في شاهين تاكسي',
            style: AppStyles.semiBold24.copyWith(color: AppColors.textColor),
          ),
          const SizedBox(height: 5),
          Text(
            textAlign: TextAlign.center,
            'نحن هنا لجعل تنقلاتك أسهل وأسرع.\n اختر الطريقة التي تفضلها للمتابعة',
            style: AppStyles.regular16.copyWith(color: AppColors.textScndry),
          ),
          const SizedBox(height: 38),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.divColor,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 14,
              children: [
                SvgPicture.asset(Assets.imagesGoogleIcon),
                Text(
                  'المتابعة باستخدام غوغل',
                  style: AppStyles.regular16.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.divColor,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 14,
              children: [
                SvgPicture.asset(Assets.imagesFacebookIcon),
                Text(
                  'المتابعة باستخدام فيسبوك',
                  style: AppStyles.regular16.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          CustomMainButton(
            buttonText: 'تسجيل الدخول',
            onPressed: () {
              context.pushNamed(AppRouter.kLoginView);
            },
          ),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundColor,
              minimumSize: const Size(double.infinity, 54),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            child: Text(
              'إنشاء حساب',
              style: AppStyles.bold16.copyWith(color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
