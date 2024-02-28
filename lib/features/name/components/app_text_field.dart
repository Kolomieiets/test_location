import 'package:flutter/material.dart';
import 'package:test_location/resources/style/app_colors.dart';
import 'package:test_location/resources/style/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  const AppTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      keyboardAppearance: Brightness.dark,
      autofocus: true,
      cursorColor: AppColors.accent,
      controller: controller,
      style: AppTextStyles.textField,
      decoration: InputDecoration(
        filled: true,
        hintText: "Ваше імʼя",
        hintStyle: AppTextStyles.hint,
        fillColor: AppColors.textField,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.accent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
