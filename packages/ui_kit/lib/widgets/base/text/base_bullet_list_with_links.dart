import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/base/text/base_text_wth_links.dart';

import '../../../constants/base_constants.dart';

/// {@template base_bullet_list_with_links.class}
/// Список пунктов с маркером (по умолчанию — "—") и поддержкой Markdown‑ссылок.
/// Каждый пункт рендерится через Text.rich внутри BaseTextWithLinks.
/// {@endtemplate}
class BaseBulletListWithLinks extends StatelessWidget {
  /// {@macro base_bullet_list_with_links.class}
  const BaseBulletListWithLinks({
    required this.items,
    required this.style,
    this.linkStyle,
    this.bullet = '—',
    this.itemSpacing = BaseConst.base8,
    this.textAlign,
    super.key,
  });

  /// Текст каждого пункта (без "—")
  final List<String> items;

  /// Базовый стиль текста
  final TextStyle style;

  /// Стиль ссылок (по умолчанию — style с синим цветом из темы, см. BaseTextWithLinks)
  final TextStyle? linkStyle;

  /// Символ маркера
  final String bullet;

  /// Отступ *между* пунктами
  final double itemSpacing;

  /// Выравнивание текста в пунктах
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: BaseConst.base8,
              children: [
                Text(
                  bullet,
                  style: style,
                ),
                Expanded(
                  child: BaseTextWithLinks(
                    text: items[i],
                    style: style,
                    linkStyle: linkStyle,
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
