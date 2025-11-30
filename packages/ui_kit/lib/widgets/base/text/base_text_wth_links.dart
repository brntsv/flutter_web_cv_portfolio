import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utils/url_launcher/url_launcher.dart';

/// {@template base_text_with_links.class}
/// Базовый виджет для отображения текста с Markdown‑ссылками вида [текст](https://...)
/// {@endtemplate}
class BaseTextWithLinks extends StatelessWidget {
  /// {@macro base_text_with_links.class}
  const BaseTextWithLinks({
    required this.text,
    required this.style,
    this.linkStyle,
    this.maxLines,
    this.textAlign,
    super.key,
  });

  /// Исходный текст, в том числе с \n и markdown‑ссылками
  final String text;

  /// Базовый стиль текста
  final TextStyle style;

  /// Стиль ссылок (по умолчанию — baseText с синим цветом из темы)
  final TextStyle? linkStyle;

  /// Максимальное количество строк
  final int? maxLines;

  /// Выравнивание текста
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);

    final spans = <InlineSpan>[];
    final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
    var lastMatchEnd = 0;

    for (final match in linkRegex.allMatches(text)) {
      // Текст до ссылки
      if (match.start > lastMatchEnd) {
        final beforeLink = text.substring(lastMatchEnd, match.start);
        if (beforeLink.isNotEmpty) {
          spans.add(
            TextSpan(
              text: beforeLink,
              style: style,
            ),
          );
        }
      }

      // Сама ссылка
      final linkText = match.group(1)!;
      final linkUrl = match.group(2)!;

      spans.add(
        TextSpan(
          text: linkText,
          style: linkStyle ?? style.copyWith(color: color.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () => UrlLauncher.openUrl(linkUrl),
        ),
      );

      lastMatchEnd = match.end;
    }

    // Хвост после последней ссылки
    if (lastMatchEnd < text.length) {
      final after = text.substring(lastMatchEnd);
      if (after.isNotEmpty) {
        spans.add(
          TextSpan(
            text: after,
            style: style,
          ),
        );
      }
    }

    return Text.rich(
      TextSpan(
        style: style,
        children: spans,
      ),
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
      textAlign: textAlign ?? TextAlign.start,
      textWidthBasis: TextWidthBasis.longestLine,
    );
  }
}
