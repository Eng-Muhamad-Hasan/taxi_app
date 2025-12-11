import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import 'dots_indicator.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, required int currentPage})
    : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        DotsIndicator(currentPage: _currentPage),
        Visibility(
          visible: _currentPage != 2,
          maintainAnimation: true,

          maintainSize: true,
          maintainState: true,

          child: TextButton(
            onPressed: () {},
            child: Text(
              'تخطي',
              style: AppStyles.regular18.copyWith(color: AppColors.textScndry),
            ),
          ),
        ),
      ],
    );
  }
}
