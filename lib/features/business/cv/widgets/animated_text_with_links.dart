import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/animated_text.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utilities/url_launcher/url_launcher.dart';

/// Анимация текста с ссылками
class AnimatedTextWithLinks extends StatelessWidget {
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
    final paragraphs = <List<Widget>>[];
    var currentLine = <Widget>[];

    final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
    final paragraphSplit = text.split('\n');

    // Для каждого абзаца создаем отдельную строку
    for (final paragraph in paragraphSplit) {
      var lastMatchEnd = 0;

      // Обработка ссылок в каждом абзаце
      for (final match in linkRegex.allMatches(paragraph)) {
        // Добавляем текст до ссылки
        if (match.start > lastMatchEnd) {
          final beforeLink = paragraph.substring(lastMatchEnd, match.start);
          if (beforeLink.isNotEmpty) {
            currentLine.add(
              AnimatedText(
                text: beforeLink,
                style: textStyle.baseText,
                appearDuration: appearDuration,
                appearClass: appearClass,
              ),
            );
          }
        }

        // Добавляем саму ссылку
        final linkText = match.group(1)!;
        final linkUrl = match.group(2)!;

        currentLine.add(
          GestureDetector(
            onTap: () => UrlLauncher.openUrl(linkUrl),
            child: AnimatedText(
              text: linkText,
              style: textStyle.baseText.copyWith(
                color: color.gray,
              ),
              appearDuration: appearDuration,
              appearClass: appearClass,
            ),
          ),
        );

        lastMatchEnd = match.end;
      }

      // Добавляем оставшийся текст после последней ссылки
      if (lastMatchEnd < paragraph.length) {
        final afterLinks = paragraph.substring(lastMatchEnd);
        if (afterLinks.isNotEmpty) {
          currentLine.add(
            AnimatedText(
              text: afterLinks,
              style: textStyle.baseText,
              appearDuration: appearDuration,
              appearClass: appearClass,
            ),
          );
        }
      }

      paragraphs.add(List<Widget>.from(currentLine));
      currentLine = [];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs
          .map((lineWidgets) => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: lineWidgets,
              ),)
          .toList(),
    );
  }
}
