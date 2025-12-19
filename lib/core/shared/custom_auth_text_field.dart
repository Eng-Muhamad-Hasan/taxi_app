import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_decoration.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

class CustomAuthTextField extends StatelessWidget {
  final String hintText, prefixSvgIcon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String?)? onSaved;
  const CustomAuthTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    required this.prefixSvgIcon,
    required this.keyboardType,
    this.suffixIcon,
    this.onSaved,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onSaved: onSaved,
      keyboardType: keyboardType,
      style: AppStyles.regular16.copyWith(color: AppColors.textColor),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'هذا الحقل مطلوب';
        }

        return null;
      },
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(prefixSvgIcon, fit: BoxFit.scaleDown),
        suffixIcon: suffixIcon != null
            ? SvgPicture.asset(suffixIcon!, fit: BoxFit.scaleDown)
            : null,
        hint: Text(
          hintText,
          style: AppStyles.regular16.copyWith(color: AppColors.textColor),
        ),

        visualDensity: VisualDensity.compact,
        disabledBorder: AppDecoration.whiteBoxDecoration,
        enabledBorder: AppDecoration.whiteBoxDecoration,
        focusedBorder: AppDecoration.whiteBoxDecoration,
        border: AppDecoration.whiteBoxDecoration,

        errorStyle: AppStyles.bold10.copyWith(color: AppColors.red),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
      ),
    );
  }
}
