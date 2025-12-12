import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

class SignupViewHeader extends StatelessWidget {
  const SignupViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        color: AppColors.divColorScndry,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Text(
        'إنشاء حساب',
        textAlign: TextAlign.center,
        style: AppStyles.bold16.copyWith(color: AppColors.textColor),
      ),
    );
  }
}
