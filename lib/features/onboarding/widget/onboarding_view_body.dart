import 'package:flutter/material.dart';

import 'onboarding_progress_widget.dart';
import 'onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        AspectRatio(
          aspectRatio: 393 / 571,
          child: OnboardingPageView(pageController: _pageController),
        ),
        const SizedBox(height: 45),
        OnboardingProgressWidget(
          pageController: _pageController,
          currentPage: _currentPage,
        ),
      ],
    );
  }
}
