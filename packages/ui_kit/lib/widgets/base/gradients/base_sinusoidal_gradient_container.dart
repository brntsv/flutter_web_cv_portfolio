import 'dart:math' show pi, sin;

import 'package:flutter/material.dart';

import '../../../constants/base_constants.dart';
import '../../../extensions/build_context_extension.dart';

/// {@template sinusoidal_gradient_container}
/// Контейнер, который применяет нелинейный (синусоидальный) градиент
/// от [startColor] до [endColor].
/// {@endtemplate}
class BaseSinusoidalGradientContainer extends StatelessWidget {
  /// {@macro sinusoidal_gradient_container}
  const BaseSinusoidalGradientContainer({
    required this.startColor,
    required this.endColor,
    this.child,
    this.curvePoints = 30, // Больше точек = более плавная кривая
    this.borderRadius,
    super.key,
  });

  /// Начальный цвет градиента.
  final Color startColor;

  /// Конечный цвет градиента.
  final Color endColor;

  /// Дочерний виджет.
  final Widget? child;

  /// Количество точек для аппроксимации кривой.
  final int curvePoints;

  /// Радиусы углов для контейнера.
  final BorderRadius? borderRadius;

  /// Создает градиент, имитирующий синусоидальную кривую.
  Gradient _createSinusoidalGradient() {
    final colors = <Color>[];
    final stops = <double>[];

    for (var i = 0; i <= curvePoints; i++) {
      final t = i / curvePoints; // Линейное продвижение от 0.0 до 1.0
      stops.add(t);

      // Применяем функцию синусоидального смягчения
      // (sin((t * PI) - (PI / 2)) + 1) / 2 создает кривую ease-in-out
      final curvedT = (sin((t * pi) - (pi / 2)) + 1) / 2;

      // Интерполируем цвет на основе кривого продвижения
      final color = Color.lerp(startColor, endColor, curvedT);
      colors.add(color!);
    }

    return LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: _createSinusoidalGradient(),
          borderRadius: borderRadius,
        ),
        padding: context.screenSize.height > BaseConst.base700
            ? const EdgeInsets.all(BaseConst.base72)
            : EdgeInsets.zero,
        child: child,
      );
}
