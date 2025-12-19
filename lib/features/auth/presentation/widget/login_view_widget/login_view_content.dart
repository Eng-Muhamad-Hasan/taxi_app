import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/core/shared/custom_password_text_field.dart';
import 'package:taxi_app/core/shared/custom_scale_fade_animation.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/features/auth/presentation/cubit/login-cubit/login_cubit.dart';
import '../../../../../core/shared/custom_auth_text_field.dart';
import '../../../../../core/shared/custom_main_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'dont_have_account_widget.dart';

class LoginViewContent extends StatefulWidget {
  const LoginViewContent({super.key});

  @override
  State<LoginViewContent> createState() => _LoginViewContentState();
}

class _LoginViewContentState extends State<LoginViewContent> {
  late String email;
  late String password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
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
            CustomAuthTextField(
              prefixSvgIcon: Assets.imagesUser,
              hintText: "البريد الالكتروني",
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 36),
            CustomPasswordTextField(
              prefixSvgIcon: Assets.imagesPassword,
              hintText: "كلمة المرور",
              keyboardType: TextInputType.visiblePassword,
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              style: const ButtonStyle(
                alignment: AlignmentDirectional.centerStart,
              ),
              onPressed: () {},
              child: Text(
                'نسيت كلمة المرور ؟',
                style: AppStyles.bold12.copyWith(color: AppColors.textColor),
              ),
            ),
            const SizedBox(height: 14),
            CustomMainButton(
              buttonText: 'تسجيل الدخول',
              onPressed: () {
                loginWithValidation(context);
              },
            ),
            const SizedBox(height: 24),
            const DontHaveAccountWidget(),
          ],
        ),
      ),
    );
  }

  void loginWithValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<LoginCubit>().login(email: email, password: password);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
