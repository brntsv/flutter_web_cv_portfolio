import 'package:flutter/material.dart';

/// {@template base_auto_shrink_text.class}
/// Базовый виджет для автоматического уменьшения размера текста.
/// {@endtemplate}
class BaseAutoShrinkText extends StatelessWidget {
  /// {@macro base_auto_shrink_text.class}
  const BaseAutoShrinkText(
    this.text, {
    required this.style,
    this.maxLines = 2,
    this.minFontSize = 12,
    super.key,
  });

  /// Текст
  final String text;

  /// Стиль текста
  final TextStyle style;

  /// Максимальное количество строк
  final int maxLines;

  /// Минимальный размер шрифта
  final double minFontSize;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final baseSize = style.fontSize ?? 14;
          final scaler = MediaQuery.textScalerOf(context);
          final safeWidth =
              (constraints.maxWidth - 2).clamp(0.0, constraints.maxWidth);

          final minScale = (minFontSize / baseSize).clamp(0.5, 1.0);
          const step = 0.02; // шаг уменьшения

          bool fits(double scale) {
            final tp = TextPainter(
              text: TextSpan(
                text: text,
                style: style.copyWith(fontSize: baseSize * scale),
              ),
              textDirection: Directionality.of(context),
              maxLines: maxLines,
              textScaler: scaler,
              textWidthBasis: TextWidthBasis.longestLine,
            )..layout(maxWidth: safeWidth);
            final lines = tp.computeLineMetrics().length;
            return lines <= maxLines &&
                !tp.didExceedMaxLines &&
                tp.width <= safeWidth;
          }

          // Если помещается без уменьшения — рисуем как есть
          if (fits(1)) {
            return Text(
              text,
              style: style,
              maxLines: maxLines,
              softWrap: true,
              overflow: TextOverflow.visible,
              textWidthBasis: TextWidthBasis.longestLine,
            );
          }

          // Пошагово уменьшаем до первой подходящей величины
          var best = minScale;
          for (double s = 1; s >= minScale; s -= step) {
            if (fits(s)) {
              best = s;
              break;
            }
          }

          // Небольшой запас от границы
          final safeScale = (best * .98).clamp(minScale, 1.0);

          return Text(
            text,
            style: style.copyWith(fontSize: baseSize * safeScale),
            maxLines: maxLines,
            softWrap: true,
            overflow: TextOverflow.visible,
            textWidthBasis: TextWidthBasis.longestLine,
          );
        },
      );
}
