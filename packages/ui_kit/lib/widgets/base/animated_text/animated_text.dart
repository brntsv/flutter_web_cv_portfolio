import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';

import 'animation_timing_mixin.dart';

/// {@template animated_text.class}
/// Анимированный текст
/// {@endtemplate}
class AnimatedText extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_text.class}
  const AnimatedText({
    required this.text,
    required this.appearDuration,
    required this.appearClass,
    this.style,
    super.key,
  });

  /// Текст
  final String text;

  /// Стиль текста
  final TextStyle? style;

  /// Длительность анимации
  final double appearDuration;

  /// Класс анимации
  final int appearClass;

  @override
  Widget build(BuildContext context) {
    // Разбиваем текст на слова
    final words = text.split(' ');

    // Общая продолжительность анимации
    final totalDuration = appearDuration;

    final color = colors(context);

    return Wrap(
      spacing: BaseConst.base4,
      runSpacing: BaseConst.base4,
      children: List.generate(words.length, (index) {
        // Вычисляем "класс" анимации (1-20) аналогично filiph.net
        final animationClass = getAnimationClass(index, appearClass);

        // Определяем параметры анимации для каждого класса
        final animationParams = getAnimationParams(animationClass);

        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: (totalDuration * 1000).toInt()),
          curve: Interval(
            animationParams.startTime,
            animationParams.endTime,
            curve: Curves.easeOut,
          ),
          builder: (context, value, child) => Text(
            '${words[index]}${index == words.length - 1 ? "" : " "}',
            style: style?.copyWith(
              color: Color.lerp(
                color.white,
                style?.color ?? color.black,
                value,
              ),
            ),
          ),
        );
      }),
    );
  }
}
