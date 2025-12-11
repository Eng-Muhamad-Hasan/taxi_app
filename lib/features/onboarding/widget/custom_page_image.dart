import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/page_item_model.dart';

class CustomPageImage extends StatelessWidget {
  const CustomPageImage({
    super.key,
    required this.pageItemModel,
    required this.isMiddleItem,
  });

  final PageItemModel pageItemModel;
  final bool isMiddleItem;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInToLinear,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: SvgPicture.asset(
        pageItemModel.image,
        alignment: isMiddleItem ? Alignment.centerRight : Alignment.centerLeft,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
