import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushReplacementNamed(AppRouter.kLoginView);
        },
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'لديك حساب ؟ ',
                style: AppStyles.regular12.copyWith(color: AppColors.textColor),
              ),
              TextSpan(
                text: 'تسجيل الدخول ',
                style: AppStyles.bold12.copyWith(color: AppColors.textColor),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
