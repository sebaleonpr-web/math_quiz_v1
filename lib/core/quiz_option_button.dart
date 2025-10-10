// lib/components/quiz_option_button.dart
import 'package:flutter/material.dart';
import 'package:math_quiz_v1/core/colors.dart';
import 'package:math_quiz_v1/core/text_styles.dart';

class QuizOptionButton extends StatelessWidget {
  const QuizOptionButton({
    super.key,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : null,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: AppColors.primary,
        // ignore: deprecated_member_use
        disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_right_alt, size: 0, color: Colors.white),
          const SizedBox(width: 6),
          Text(label, style: TextStyles.button),
        ],
      ),
    );
  }
}
