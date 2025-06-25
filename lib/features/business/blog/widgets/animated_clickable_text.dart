import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';

/// Анимированный кликабельный текст
class AnimatedClickableText extends StatelessWidget {
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
            '$word${isLastWord ? "" : " "}',
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
    final animationClass = _getAnimationClass(wordIndex, appearClass);
    final animationParams = _getAnimationParams(animationClass);

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

  // Функция для получения класса анимации (1-20) для слова
  int _getAnimationClass(int wordIndex, int baseClassNum) {
    // Создаем хеш, который даст распределение слов между классами
    final hashValue = (wordIndex * 17 + baseClassNum * 13) % 20;
    return hashValue + 1; // от 1 до 20
  }

  // Аналог keyframes на filiph.net
  AnimationTiming _getAnimationParams(int animationClass) {
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
