// lib/screens/math_quiz_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_quiz_v1/core/colors.dart';
import 'package:math_quiz_v1/core/quiz_option_button.dart';
import 'package:math_quiz_v1/core/text_styles.dart';

class MathQuizScreen extends StatefulWidget {
  const MathQuizScreen({super.key});

  @override
  State<MathQuizScreen> createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  final _random = Random();
  late int num1, num2, _correcta;
  List<int> opciones = [];
  bool respondido = false;
  bool acierto = false;

  @override
  void initState() {
    super.initState();
    _nuevaPregunta();
  }

  void _nuevaPregunta() {
    num1 = _random.nextInt(10);
    num2 = _random.nextInt(10);
    _correcta = num1 + num2;

    final setOpc = <int>{_correcta};
    while (setOpc.length < 4) {
      setOpc.add(_random.nextInt(19)); // 0..18
    }
    opciones = setOpc.toList()..shuffle();
    respondido = false;
    acierto = false;
    setState(() {});
  }

  void _verificar(int op) {
    if (respondido) return;
    respondido = true;
    acierto = (op == _correcta);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppColors.appBar,
        foregroundColor: AppColors.white,
        title: const Text('Juego de Sumas', style: TextStyles.appBarTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  const Text('¿Cuánto es…?', style: TextStyles.heading),
                  const SizedBox(height: 6),
                  Text('$num1 + $num2', style: TextStyles.bigOp),
                  const SizedBox(height: 24),

                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: opciones.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 24,
                      childAspectRatio: 2.2,
                    ),
                    itemBuilder: (_, i) {
                      final value = opciones[i];
                      return QuizOptionButton(
                        label: value.toString(),
                        enabled: !respondido,
                        onTap: () => _verificar(value),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  if (respondido)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          acierto ? Icons.check_circle : Icons.cancel,
                          color: acierto ? AppColors.success : AppColors.error,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          acierto ? 'Correcto' : 'Incorrecto',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                acierto ? AppColors.success : AppColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 16),

                  if (respondido)
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _nuevaPregunta,
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Siguiente', style: TextStyles.button),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
