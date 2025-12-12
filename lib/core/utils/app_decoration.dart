import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';

abstract class AppDecoration {
  static final grayBoxDecoration = ShapeDecoration(
    color: const Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  static const whiteBoxDecoration = UnderlineInputBorder(
    borderSide: BorderSide(
      strokeAlign: BorderSide.strokeAlignOutside,
      color: AppColors.textColor,
      width: 3,
    ),
  );
}
