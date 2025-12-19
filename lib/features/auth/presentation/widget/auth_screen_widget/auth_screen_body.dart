import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/shared/custom_main_button.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import 'package:taxi_app/core/utils/app_styles.dart';
import '../../../../../core/shared/custom_media_button.dart';
import '../../../../../core/shared/custom_scndry_button.dart';
import '../../cubit/auth-cubit/auth_cubit.dart';

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
          CustomMediaButton(
            buttonText: 'المتابعة باستخدام غوغل',
            buttonImage: Assets.imagesGoogleIcon,
            onPressed: () {
              context.read<AuthCubit>().signInWithGoogle();
            },
          ),

          const SizedBox(height: 16),
          const CustomMediaButton(
            buttonText: 'المتابعة باستخدام فيسبوك',
            buttonImage: Assets.imagesFacebookIcon,
          ),
          const SizedBox(height: 16),
          CustomMainButton(
            buttonText: 'تسجيل الدخول',
            onPressed: () {
              context.pushNamed(AppRouter.kLoginView);
            },
          ),

          const SizedBox(height: 16),
           CustomScndryButton(buttonText:  'إنشاء حساب',onPressed: () {
            context.pushNamed(AppRouter.kSignupView);
          },),
        ],
      ),
    );
  }
}
