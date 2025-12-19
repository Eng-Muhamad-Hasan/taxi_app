import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomMediaButton extends StatelessWidget {
  final String buttonText;
  final String buttonImage;
  final VoidCallback? onPressed;

  const CustomMediaButton({
    super.key,
    required this.buttonText,
    required this.buttonImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.divColor,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 14,
        children: [
          SvgPicture.asset(buttonImage),
          Text(
            buttonText,
            style: AppStyles.regular16.copyWith(color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}
