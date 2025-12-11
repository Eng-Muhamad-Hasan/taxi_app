import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required int currentPage})
    : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          curve: Curves.easeInOut,

          duration: const Duration(milliseconds: 500),
          height: 8,
          width: _currentPage == index ? 24 : 8,
          decoration: _currentPage == index
              ? ShapeDecoration(
                  color: AppColors.textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              : const ShapeDecoration(
                  color: AppColors.textScndry,
                  shape: OvalBorder(),
                ),
        ),
      ),
    );
  }
}
