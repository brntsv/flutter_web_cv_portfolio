import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';

/// Заголовок секции
class SectionTitle extends StatelessWidget {
  /// {@macro section_title.class}
  const SectionTitle({
    required this.title,
    this.appearClass = 2,
    super.key,
  });

  /// Текст
  final String title;

  /// Класс анимации
  final int appearClass;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base8,
      children: [
        AnimatedText(
          text: title,
          style: textStyle.h2,
          appearDuration: 6,
          appearClass: appearClass,
        ),
        Divider(
          height: BaseConst.base1,
          color: color.skyGray,
        ),
      ],
    );
  }
}
