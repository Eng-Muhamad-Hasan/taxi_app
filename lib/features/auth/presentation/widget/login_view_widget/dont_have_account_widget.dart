import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/core/utils/app_router.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushReplacementNamed(AppRouter.kSignupView);
        },
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'ليس لديك حساب ؟ ',
                style: AppStyles.regular12.copyWith(color: AppColors.textColor),
              ),
              TextSpan(
                text: 'انشئ حسابك الآن',
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
