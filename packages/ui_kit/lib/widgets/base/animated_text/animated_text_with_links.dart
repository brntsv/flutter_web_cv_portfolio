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
  Widget build(BuildContext context) => Text.rich(
        TextSpan(children: _buildAnimatedTextSpans(context)),
      );

  List<InlineSpan> _buildAnimatedTextSpans(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);
    final spans = <InlineSpan>[];

    final linkRegex = RegExp(r'\[(.*?)\]\((.*?)\)');
    var lastMatchEnd = 0;
    var wordIndex = 0;

    // Обработка ссылок
    for (final match in linkRegex.allMatches(text)) {
      // Добавляем текст до ссылки
      if (match.start > lastMatchEnd) {
        final beforeLink = text.substring(lastMatchEnd, match.start);
        if (beforeLink.isNotEmpty) {
          spans.addAll(
            _buildWordsSpans(
              beforeLink,
              textStyle.baseText,
              wordIndex,
              context,
            ),
          );
          wordIndex += beforeLink.split(' ').length;
        }
      }

      // Добавляем саму ссылку (как отдельное слово)
      final linkText = match.group(1)!;
      final linkUrl = match.group(2)!;

      spans.add(
        _buildAnimatedWordWidget(
          linkText,
          textStyle.baseText.copyWith(color: color.blue),
          wordIndex,
          linkUrl,
          context,
        ),
      );
      wordIndex++;

      lastMatchEnd = match.end;
    }

    // Добавляем оставшийся текст после последней ссылки
    if (lastMatchEnd < text.length) {
      final afterLinks = text.substring(lastMatchEnd);
      if (afterLinks.isNotEmpty) {
        spans.addAll(
          _buildWordsSpans(
            afterLinks,
            textStyle.baseText,
            wordIndex,
            context,
          ),
        );
      }
    }

    return spans;
  }

  List<InlineSpan> _buildWordsSpans(
    String text,
    TextStyle style,
    int startWordIndex,
    BuildContext context,
  ) {
    final words = text.split(' ');
    final spans = <InlineSpan>[];

    for (var i = 0; i < words.length; i++) {
      final word = words[i];
      final isLastWord = i == words.length - 1;

      spans.add(
        _buildAnimatedWordWidget(
          '$word${isLastWord ? "" : " "}',
          style,
          startWordIndex + i,
          null,
          context,
        ),
      );
    }

    return spans;
  }

  WidgetSpan _buildAnimatedWordWidget(
    String word,
    TextStyle style,
    int wordIndex,
    String? linkUrl,
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

          if (linkUrl != null) {
            return Text.rich(
              TextSpan(
                text: word,
                style: animatedStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UrlLauncher.openUrl(linkUrl),
              ),
            );
          }

          return Text(word, style: animatedStyle);
        },
      ),
    );
  }
}
