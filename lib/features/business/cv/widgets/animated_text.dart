import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';

/// {@template animated_text.class}
/// Анимация текста
/// {@endtemplate}
class AnimatedText extends StatelessWidget {
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
        final animationClass = _getAnimationClass(index, appearClass);

        // Определяем параметры анимации для каждого класса
        final animationParams = _getAnimationParams(animationClass);

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

  // Функция для получения класса анимации (1-20) для слова
  int _getAnimationClass(int wordIndex, int baseClassNum) {
    // Создаем хеш, который даст распределение слов между классами
    // Используем только числовой параметр baseClassNum
    final hashValue = (wordIndex * 17 + baseClassNum * 13) % 20;
    return hashValue + 1; // от 1 до 20
  }

  // Аналог keyframes на filiph.net
  AnimationTiming _getAnimationParams(int animationClass) {
    // На filiph.net для каждого класса (appear1-appear20) определена своя задержка
    // Здесь мы воссоздаем эту логику

    // Интервал начала и конца анимации для каждого класса
    // Значения базируются на CSS keyframes с filiph.net
    switch (animationClass) {
      case 1:
        return AnimationTiming(0.03, 0.31);
      case 2:
        return AnimationTiming(0.04, 0.32);
      case 3:
        return AnimationTiming(0.05, 0.33);
      case 4:
        return AnimationTiming(0.06, 0.34);
      case 5:
        return AnimationTiming(0.07, 0.35);
      case 6:
        return AnimationTiming(0.08, 0.36);
      case 7:
        return AnimationTiming(0.09, 0.37);
      case 8:
        return AnimationTiming(0.10, 0.38);
      case 9:
        return AnimationTiming(0.11, 0.39);
      case 10:
        return AnimationTiming(0.12, 0.40);
      case 11:
        return AnimationTiming(0.13, 0.41);
      case 12:
        return AnimationTiming(0.14, 0.42);
      case 13:
        return AnimationTiming(0.15, 0.43);
      case 14:
        return AnimationTiming(0.16, 0.44);
      case 15:
        return AnimationTiming(0.17, 0.45);
      case 16:
        return AnimationTiming(0.18, 0.46);
      case 17:
        return AnimationTiming(0.19, 0.47);
      case 18:
        return AnimationTiming(0.20, 0.48);
      case 19:
        return AnimationTiming(0.21, 0.49);
      case 20:
        return AnimationTiming(0.22, 0.50);
      default:
        return AnimationTiming(0.10, 0.40);
    }
  }
}

/// Класс для хранения начального и конечного времени анимации
class AnimationTiming {
  /// {@macro animation_timing.class}
  AnimationTiming(this.startTime, this.endTime);

  /// Начальное время анимации
  final double startTime;

  /// Конечное время анимации
  final double endTime;
}
