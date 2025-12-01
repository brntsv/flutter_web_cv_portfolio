import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';

import 'base_animated_word.dart';

/// {@template animated_clickable_text.class}
/// Анимированный кликабельный текст с коллбэком при нажатии
/// Используется для навигации в пределах приложения
/// {@endtemplate}
class BaseAnimatedClickableText extends StatelessWidget {
  /// {@macro animated_clickable_text.class}
  const BaseAnimatedClickableText({
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
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);
    final spans = <InlineSpan>[];

    final words = text.split(' ');
    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final isLastWord = i == words.length - 1;
      spans.add(
        WidgetSpan(
          child: BaseAnimatedWord(
            word: '$word${isLastWord && description.isEmpty ? '' : ' '}',
            style: textStyle.baseText.copyWith(
              color: onTap != null ? color.blue : color.black,
            ),
            wordIndex: i,
            appearClass: appearClass,
            appearDuration: appearDuration,
            onTap: onTap,
          ),
        ),
      );
    }

    if (description.isNotEmpty) {
      final descWords = description.split(' ');
      for (var i = 0; i < descWords.length; i++) {
        final word = descWords[i];
        final isLastWord = i == descWords.length - 1;
        spans.add(
          WidgetSpan(
            child: BaseAnimatedWord(
              word: '$word${isLastWord ? '' : ' '}',
              style: textStyle.baseText,
              wordIndex: words.length + i,
              appearClass: appearClass,
              appearDuration: appearDuration,
            ),
          ),
        );
      }
    }

    return Text.rich(TextSpan(children: spans));
  }
}
