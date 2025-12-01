import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';

import 'base_animation_timing_mixin.dart';

/// {@template animated_word.class}
/// Анимированное слово (опционально кликабельное)
/// {@endtemplate}
class BaseAnimatedWord extends StatelessWidget with BaseAnimationTimingMixin {
  /// {@macro animated_word.class}
  const BaseAnimatedWord({
    required this.word,
    required this.style,
    required this.wordIndex,
    required this.appearClass,
    required this.appearDuration,
    this.onTap,
    super.key,
  });

  /// Слово
  final String word;

  /// Стиль текста
  final TextStyle style;

  /// Индекс слова
  final int wordIndex;

  /// Класс анимации
  final int appearClass;

  /// Длительность анимации
  final double appearDuration;

  /// Обработчик клика
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final animationClass = getAnimationClass(wordIndex, appearClass);
    final animationParams = getAnimationParams(animationClass);
    final color = colors(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: (appearDuration * 1000).toInt()),
      curve: Interval(
        animationParams.startTime,
        animationParams.endTime,
        curve: Curves.easeOut,
      ),
      builder: (context, value, child) {
        final animatedStyle = style.copyWith(
          color: Color.lerp(
            color.white,
            style.color ?? color.black,
            value,
          ),
        );

        if (onTap != null) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text.rich(
              TextSpan(
                text: word,
                style: animatedStyle,
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ),
          );
        }

        return Text(word, style: animatedStyle);
      },
    );
  }
}
