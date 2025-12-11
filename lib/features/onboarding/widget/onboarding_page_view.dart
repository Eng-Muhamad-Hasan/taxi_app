import 'package:flutter/material.dart';
import 'package:taxi_app/features/onboarding/widget/onboarding_page_view_item.dart';

import '../model/page_item_model.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: pageItems.length,
      itemBuilder: (context, index) => OnboardingPageViewItem(
        pageItemModel: pageItems[index],
        isMiddleItem: index == 1,
      ),
    );
  }
}
