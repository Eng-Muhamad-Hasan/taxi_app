import 'package:flutter/material.dart';
import 'package:taxi_app/features/onboarding/model/page_item_model.dart';
import 'custom_page_image.dart';
import 'custom_pageview_title.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.pageItemModel,
    required this.isMiddleItem,
  });
  final PageItemModel pageItemModel;
  final bool isMiddleItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomPagetTitle(pageItemModel: pageItemModel),
        const SizedBox(height: 48),
        CustomPageImage(
          pageItemModel: pageItemModel,
          isMiddleItem: isMiddleItem,
        ),
      ],
    );
  }
}
