import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';

import 'animated_word.dart';

/// {@template animated_text.class}
/// Анимированный текст
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

    return Text.rich(
      TextSpan(
        children: List.generate(words.length, (index) {
          final isLast = index == words.length - 1;
          return WidgetSpan(
            child: AnimatedWord(
              word: '${words[index]}${isLast ? '' : ' '}',
              style: style ?? textStyles(context).baseText,
              wordIndex: index,
              appearClass: appearClass,
              appearDuration: appearDuration,
            ),
          );
        }),
      ),
    );
  }
}
