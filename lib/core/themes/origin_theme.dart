import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';

final ThemeData originTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  scaffoldBackgroundColor: AppColors.backgroundColor
);