import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../model/page_item_model.dart';

class CustomPagetTitle extends StatelessWidget {
  const CustomPagetTitle({super.key, required this.pageItemModel});

  final PageItemModel pageItemModel;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInToLinear,
      builder: (context, value, child) {
        final double translateY = (1 - value) * 25.0;
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: child,
          ),
        );
      },
      child: ListTile(
        title: FittedBox(
          child: Text(
            pageItemModel.title,
            style: AppStyles.bold28.copyWith(color: AppColors.textColor),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            pageItemModel.subTitle,
            style: AppStyles.medium20.copyWith(color: AppColors.textColor),
          ),
        ),
      ),
    );
  }
}
