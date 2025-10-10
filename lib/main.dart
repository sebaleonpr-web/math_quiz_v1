// lib/screens/main.dart
import 'package:flutter/material.dart';
import 'package:math_quiz_v1/screens/math_quiz_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MathQuizScreen(),
    );
  }
}
