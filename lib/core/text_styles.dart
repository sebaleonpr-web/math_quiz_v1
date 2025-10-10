// lib/core/text_styles.dart
import 'package:flutter/material.dart';
import 'package:math_quiz_v1/core/colors.dart';

class TextStyles {
  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bigOp = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
