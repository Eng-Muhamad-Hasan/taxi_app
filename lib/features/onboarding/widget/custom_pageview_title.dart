import 'package:flutter/material.dart';
import 'package:taxi_app/core/shared/custom_text_animation.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../model/page_item_model.dart';

class CustomPagetTitle extends StatelessWidget {
  const CustomPagetTitle({super.key, required this.pageItemModel});

  final PageItemModel pageItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomTextAnimation(
      textWidget: 
       ListTile(
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
