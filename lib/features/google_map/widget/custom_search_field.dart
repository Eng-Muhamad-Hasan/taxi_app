import 'package:flutter/material.dart';
import 'package:taxi_app/core/utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: buildFieldBorder(),
      ),
    );
  }

  UnderlineInputBorder buildFieldBorder() => UnderlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: .7, color: AppColors.primaryColor),
  );
}
