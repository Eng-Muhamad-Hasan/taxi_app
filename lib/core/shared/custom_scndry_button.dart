import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomScndryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomScndryButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
        buttonText,
        style: AppStyles.bold16.copyWith(color: AppColors.textColor),
      ),
    );
  }
}
