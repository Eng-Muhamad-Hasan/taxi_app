import 'package:flutter/material.dart';

import 'custom_progress_indicator.dart';
import 'onboarding_progress_button.dart';

class OnboardingProgressWidget extends StatelessWidget {
  const OnboardingProgressWidget({
    super.key,
    required PageController pageController,
    required int currentPage,
  }) : _pageController = pageController,
       _currentPage = currentPage;

  final PageController _pageController;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProgressPulseButton(
            onTap: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutExpo,
              );
            },
            size: 58,
          ),
          const Spacer(),
          CustomProgressIndicator(currentPage: _currentPage),
        ],
      ),
    );
  }
}
