import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/core/utils/app_decoration.dart';
import 'package:taxi_app/core/utils/app_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hintText, prefixSvgIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    required this.prefixSvgIcon,
    required this.keyboardType,
    this.onSaved,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      style: AppStyles.regular16.copyWith(color: AppColors.textColor),
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'هذا الحقل مطلوب';
        }

        return null;
      },
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          widget.prefixSvgIcon,
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: SvgPicture.asset(
            Assets.imagesObsecureEye,
            fit: BoxFit.scaleDown,
          ),
        ),
        hint: Text(
          widget.hintText,
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
