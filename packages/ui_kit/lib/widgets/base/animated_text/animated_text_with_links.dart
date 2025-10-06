import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utils/url_launcher/url_launcher.dart';

import 'animation_timing_mixin.dart';

/// {@template animated_text_with_links.class}
/// Анимированный текст с Markdown ссылками
/// {@endtemplate}
class AnimatedTextWithLinks extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_text_with_links.class}
  const AnimatedTextWithLinks({
    required this.text,
    required this.appearDuration,
    required this.appearClass,
    super.key,
  });

  /// Текст
  final String text;

  /// Длительность анимации
  final double appearDuration;

  /// Класс анимации
  final int appearClass;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);

    final spans = <InlineSpan>[];
    final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
    var lastMatchEnd = 0;
    var wordIndex = 0;

    for (final match in linkRegex.allMatches(text)) {
      if (match.start > lastMatchEnd) {
        final beforeLink = text.substring(lastMatchEnd, match.start);
        if (beforeLink.isNotEmpty) {
          final words = beforeLink.split(' ');
          for (var i = 0; i < words.length; i++) {
            final word = words[i];
            final isLastWord = i == words.length - 1;
            spans.add(
              WidgetSpan(
                child: AnimatedWord(
                  word: '$word${isLastWord ? '' : ' '}',
                  style: textStyle.baseText,
                  wordIndex: wordIndex + i,
                  appearClass: appearClass,
                  appearDuration: appearDuration,
                ),
              ),
            );
          }
          wordIndex += words.length;
        }
      }

      final linkText = match.group(1)!;
      final linkUrl = match.group(2)!;
      spans.add(
        WidgetSpan(
          child: AnimatedWord(
            word: linkText,
            style: textStyle.baseText.copyWith(color: color.blue),
            wordIndex: wordIndex,
            appearClass: appearClass,
            appearDuration: appearDuration,
            linkUrl: linkUrl,
          ),
        ),
      );
      wordIndex++;
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      final afterLinks = text.substring(lastMatchEnd);
      if (afterLinks.isNotEmpty) {
        final words = afterLinks.split(' ');
        for (var i = 0; i < words.length; i++) {
          final word = words[i];
          final isLastWord = i == words.length - 1;
          spans.add(
            WidgetSpan(
              child: AnimatedWord(
                word: '$word${isLastWord ? '' : ' '}',
                style: textStyle.baseText,
                wordIndex: wordIndex + i,
                appearClass: appearClass,
                appearDuration: appearDuration,
              ),
            ),
          );
        }
        // wordIndex increment is not necessary beyond final rendering
      }
    }

    return Text.rich(TextSpan(children: spans));
  }
}

/// {@template animated_word.class}
/// Анимированное слово
/// {@endtemplate}
class AnimatedWord extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_word.class}
  const AnimatedWord({
    required this.word,
    required this.style,
    required this.wordIndex,
    required this.appearClass,
    required this.appearDuration,
    this.linkUrl,
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

  /// URL ссылки
  final String? linkUrl;

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

        if (linkUrl != null) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text.rich(
              TextSpan(
                text: word,
                style: animatedStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UrlLauncher.openUrl(linkUrl!),
              ),
            ),
          );
        }

        return Text(word, style: animatedStyle);
      },
    );
  }
}
