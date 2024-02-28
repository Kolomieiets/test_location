import 'package:flutter/material.dart';
import 'package:test_location/resources/style/app_colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
      color: AppColors.white,
      fontFamily: 'RFDewi',
      fontSize: 19,
      fontWeight: FontWeight.w700);

  static const TextStyle subtitle = TextStyle(
    color: AppColors.white,
    fontFamily: 'RFDewi',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle hint = TextStyle(
    fontFamily: 'RFDewi',
    fontSize: 11,
    color: AppColors.white.withOpacity(0.6),
  );

  static const TextStyle textField = TextStyle(
    fontFamily: 'RFDewi',
    fontSize: 11,
    color: AppColors.white,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.white,
    fontSize: 13,
    fontFamily: 'SF',
  );

  static const TextStyle bottomBarLabelInactive = TextStyle(
      color: AppColors.grayText,
      fontSize: 9,
      fontFamily: 'SF',
      fontWeight: FontWeight.w500);

  static const TextStyle bottomBarLabelActive = TextStyle(
      color: AppColors.white,
      fontSize: 9,
      fontFamily: 'SF',
      fontWeight: FontWeight.w500);

  static const TextStyle textButton = TextStyle(
      color: AppColors.accent,
      fontFamily: 'SF',
      fontSize: 10,
      fontWeight: FontWeight.w500);
}
