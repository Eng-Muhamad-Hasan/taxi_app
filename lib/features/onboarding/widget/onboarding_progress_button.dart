import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/core/utils/app_assets.dart';
import 'package:taxi_app/core/utils/app_colors.dart';
import 'package:taxi_app/features/onboarding/widget/custom_progress_painter.dart';

class ProgressPulseButton extends StatefulWidget {
  final double size;
  final VoidCallback onTap;

  const ProgressPulseButton({super.key, this.size = 70, required this.onTap});

  @override
  State<ProgressPulseButton> createState() => _ProgressPulseButtonState();
}

class _ProgressPulseButtonState extends State<ProgressPulseButton>
    with TickerProviderStateMixin {
  late AnimationController pulseController;
  late Animation<double> pulseAnimation;

  double progress = 0.33; // 0 → empty, 0.33 → 1/3, 0.66 → 2/3, 1.0 → full

  @override
  void initState() {
    super.initState();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(parent: pulseController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    pulseController.dispose();
    super.dispose();
  }

  void handleTap() {
    setState(() {
      progress += 1 / 3; // ⬆ Increase progress by 33%

      if (progress > 1) {
        progress = 0; // reset if exceeded
      }
    });

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 🔥 Pulse background ring
          AnimatedBuilder(
            animation: pulseController,
            builder: (_, __) {
              return Transform.scale(
                scale: pulseAnimation.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withValues(
                      alpha: 0.25 * (1 - pulseController.value),
                    ),
                  ),
                ),
              );
            },
          ),

          // 🔥 PROGRESS BORDER
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 500),
            builder: (_, value, __) {
              return CustomPaint(
                painter: BorderProgressPainter(
                  progress: value,
                  color: AppColors.textColor,
                ),
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(Assets.imagesProgressArrow),
                  ),
                ),
              );
            },
          ),

          // 🔥 Main solid button
          // Container(
          //   width: widget.size * 0.75,
          //   height: widget.size * 0.75,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.white,
          //   ),
          //   child: Center(child: SvgPicture.asset(Assets.imagesProgressArrow)),
          // ),
        ],
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:taxi_app/core/utils/app_assets.dart';
// import 'package:taxi_app/core/utils/app_colors.dart';

// class PulseNextButton extends StatefulWidget {
//   final double size;
//   final VoidCallback onTap;

//   const PulseNextButton({super.key, this.size = 70, required this.onTap});

//   @override
//   State<PulseNextButton> createState() => _PulseNextButtonState();
// }

// class _PulseNextButtonState extends State<PulseNextButton>
//     with TickerProviderStateMixin {
//   late AnimationController _pulseController;
//   late Animation<double> _pulseAnimation;

//   double _scale = 1.0;

//   @override
//   void initState() {
//     super.initState();

//     // Pulse animation
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();

//     _pulseAnimation = Tween<double>(
//       begin: 1.0,
//       end: 1.4,
//     ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeOut));
//   }

//   @override
//   void dispose() {
//     _pulseController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) => setState(() => _scale = 0.90),
//       onTapUp: (_) {
//         setState(() => _scale = 1.0);
//         Future.delayed(const Duration(milliseconds: 120), widget.onTap);
//       },
//       onTapCancel: () => setState(() => _scale = 1.0),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // 🔥 PULSE RING
//           AnimatedBuilder(
//             animation: _pulseController,
//             builder: (_, child) {
//               return Transform.scale(
//                 scale: _pulseAnimation.value,
//                 child: Container(
//                   width: widget.size,
//                   height: widget.size,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.primaryColor.withValues(
//                       alpha: 0.25 * (1 - _pulseController.value),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),

//           // 🔥 MAIN BUTTON (with press scale animation)
//           AnimatedScale(
//             scale: _scale,
//             duration: const Duration(milliseconds: 150),
//             curve: Curves.easeOut,
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               width: widget.size,
//               height: widget.size,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.backgroundColor,
//                 border: Border.all(color: AppColors.textColor, width: 3),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primaryColor.withValues(alpha: 0.3),
//                     blurRadius: 15,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Container(
              
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: AppColors.textColor,
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(Assets.imagesProgressArrow),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
