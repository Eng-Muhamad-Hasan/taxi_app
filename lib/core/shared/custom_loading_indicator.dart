import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_app/core/utils/app_assets.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: RepaintBoundary(
              child: Lottie.asset(Assets.lottieMaterialWaveLoading),
            ),
          )
        : child;
  }
}
