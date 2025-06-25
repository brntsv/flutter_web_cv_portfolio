import 'package:flutter/material.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utils/url_launcher/url_launcher.dart';

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

          if (linkUrl != null) {
            return GestureDetector(
              onTap: () => UrlLauncher.openUrl(linkUrl),
              child: Text(word, style: animatedStyle),
            );
          }

          return Text(word, style: animatedStyle);
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
