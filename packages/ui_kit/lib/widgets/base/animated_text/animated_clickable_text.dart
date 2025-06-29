import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';

import 'animation_timing_mixin.dart';

/// {@template animated_clickable_text.class}
/// Анимированный кликабельный текст (Гиперссылки)
/// {@endtemplate}
class AnimatedClickableText extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_clickable_text.class}
  const AnimatedClickableText({
    required this.text,
    required this.appearDuration,
    required this.appearClass,
    this.onTap,
    this.description = '',
    super.key,
  });

  /// Текст
  final String text;

  /// Описание
  final String description;

  /// Длительность анимации
  final double appearDuration;

  /// Класс анимации
  final int appearClass;

  /// Коллбэк для нажатия
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(children: _buildAnimatedTextSpans(context)),
      );

  List<InlineSpan> _buildAnimatedTextSpans(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);
    final spans = <InlineSpan>[];

    // Разбиваем основной текст на слова
    final words = text.split(' ');
    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final isLastWord = i == words.length - 1;

      spans.add(
        _buildAnimatedWordWidget(
          '$word${isLastWord && description.isEmpty ? "" : " "}',
          textStyle.baseText.copyWith(
            color: onTap != null ? color.blue : color.black,
          ),
          i,
          true, // это кликабельная часть
          context,
        ),
      );
    }

    // Добавляем описание, если есть
    if (description.isNotEmpty) {
      final descWords = description.split(' ');
      for (var i = 0; i < descWords.length; i++) {
        final word = descWords[i];
        final isLastWord = i == descWords.length - 1;

        spans.add(
          _buildAnimatedWordWidget(
            '$word${isLastWord ? '' : ' '}',
            textStyle.baseText,
            words.length + i, // продолжаем индексацию
            false, // описание не кликабельное
            context,
          ),
        );
      }
    }

    return spans;
  }

  WidgetSpan _buildAnimatedWordWidget(
    String word,
    TextStyle style,
    int wordIndex,
    bool isClickable,
    BuildContext context,
  ) {
    // Вычисляем "класс" анимации (1-20) аналогично оригинальному AnimatedText
    final animationClass = getAnimationClass(wordIndex, appearClass);
    final animationParams = getAnimationParams(animationClass);

    final color = colors(context);

    return WidgetSpan(
      child: TweenAnimationBuilder<double>(
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

          return Text.rich(
            TextSpan(
              text: word,
              style: animatedStyle,
              recognizer: isClickable && onTap != null
                  ? (TapGestureRecognizer()..onTap = onTap)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
