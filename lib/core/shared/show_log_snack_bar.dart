import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_styles.dart';


void showLogSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: FittedBox(
        child: Text(
          message,
          style: AppStyles.semiBold16.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      elevation: 5,
    ),
  );
}
