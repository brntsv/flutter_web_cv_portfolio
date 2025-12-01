import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utils/url_launcher/url_launcher.dart';

import '../../../../constants/base_constants.dart';
import '../../animated_text/animated_word.dart';

/// {@template base_animated_bullet_list_with_links.class}
/// Список пунктов с маркером и анимированным текстом (в т.ч. markdown‑ссылки).
/// Каждое слово рендерится через AnimatedWord.
/// {@endtemplate}
class BaseAnimatedBulletListWithLinks extends StatelessWidget {
  /// {@macro base_animated_bullet_list_with_links.class}
  const BaseAnimatedBulletListWithLinks({
    required this.items,
    required this.style,
    required this.appearDuration,
    required this.appearClass,
    this.linkStyle,
    this.bullet = '',
    this.itemSpacing = BaseConst.base8,
    this.textAlign,
    super.key,
  });

  /// Текст каждого пункта (с \n и markdown‑ссылками)
  final List<String> items;

  /// Базовый стиль текста
  final TextStyle style;

  /// Стиль ссылок (по умолчанию — style с синим цветом из темы)
  final TextStyle? linkStyle;

  /// Символ маркера
  final String bullet;

  /// Отступ *между* пунктами
  final double itemSpacing;

  /// Выравнивание текста в пунктах
  final TextAlign? textAlign;

  /// Длительность анимации (секунды)
  final double appearDuration;

  /// Класс анимации (анимационный «паттерн»)
  final int appearClass;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: BaseConst.base8,
              children: [
                AnimatedWord(
                  word: bullet,
                  wordIndex: i,
                  appearClass: appearClass,
                  appearDuration: appearDuration,
                  style: style,
                ),
                Expanded(
                  child: _AnimatedTextWithLinks(
                    text: items[i],
                    style: style,
                    linkStyle: linkStyle,
                    appearDuration: appearDuration,
                    appearClass: appearClass,
                    textAlign: textAlign,
                  ),
                ),
              ],
            ),
            if (i != items.length - 1) SizedBox(height: itemSpacing),
          ],
        ],
      );
}

/// Анимированный текст с поддержкой markdown‑ссылок вида [текст](https://...)
class _AnimatedTextWithLinks extends StatelessWidget {
  const _AnimatedTextWithLinks({
    required this.text,
    required this.style,
    required this.appearDuration,
    required this.appearClass,
    this.linkStyle,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final TextStyle? linkStyle;
  final double appearDuration;
  final int appearClass;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    final spans = <InlineSpan>[];
    final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
    var lastMatchEnd = 0;
    var wordIndex = 0;

    void addSegment(
      String segment,
      TextStyle segmentStyle, {
      VoidCallback? onTap,
    }) {
      // Простое разбиение на слова по пробелам
      final words = segment.split(' ');
      for (var i = 0; i < words.length; i++) {
        final word = words[i];
        if (word.isEmpty) continue;

        final isLast = i == words.length - 1;
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: AnimatedWord(
              word: '$word${isLast ? '' : ' '}',
              style: segmentStyle,
              wordIndex: wordIndex++,
              appearClass: appearClass,
              appearDuration: appearDuration,
              onTap: onTap,
            ),
          ),
        );
      }
    }

    for (final match in linkRegex.allMatches(text)) {
      // Текст до ссылки
      if (match.start > lastMatchEnd) {
        final beforeLink = text.substring(lastMatchEnd, match.start);
        if (beforeLink.isNotEmpty) {
          addSegment(beforeLink, style);
        }
      }

      // Сама ссылка
      final linkText = match.group(1)!;
      final linkUrl = match.group(2)!;
      final linkTextStyle = linkStyle ?? style.copyWith(color: color.blue);

      addSegment(
        linkText,
        linkTextStyle,
        onTap: () => UrlLauncher.openUrl(linkUrl),
      );

      lastMatchEnd = match.end;
    }

    // Хвост после последней ссылки
    if (lastMatchEnd < text.length) {
      final after = text.substring(lastMatchEnd);
      if (after.isNotEmpty) {
        addSegment(after, style);
      }
    }

    return Text.rich(
      TextSpan(children: spans),
      textAlign: textAlign ?? TextAlign.start,
      textWidthBasis: TextWidthBasis.longestLine,
    );
  }
}
