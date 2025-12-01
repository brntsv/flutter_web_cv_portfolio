import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utils/url_launcher/url_launcher.dart';

import 'base_animated_word.dart';

/// {@template animated_text_with_links.class}
/// Анимированный текст с Markdown ссылками
/// {@endtemplate}
class BaseAnimatedTextWithLinks extends StatelessWidget {
  /// {@macro animated_text_with_links.class}
  const BaseAnimatedTextWithLinks({
    required this.text,
    required this.appearDuration,
    required this.appearClass,
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
                child: BaseAnimatedWord(
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
          child: BaseAnimatedWord(
            word: linkText,
            style: textStyle.baseText.copyWith(color: color.blue),
            wordIndex: wordIndex,
            appearClass: appearClass,
            appearDuration: appearDuration,
            onTap: () => UrlLauncher.openUrl(linkUrl),
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
              child: BaseAnimatedWord(
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
              wordIndex: wordIndex + i,
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
