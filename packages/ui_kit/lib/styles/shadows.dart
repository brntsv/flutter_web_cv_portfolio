import 'package:flutter/material.dart';

import '../assets/colors.gen.dart';

/// Тень
sealed class UiKitShadows {
  /// Тень для карточки объекта
  static BoxShadow objectCardShadow(BuildContext context) => BoxShadow(
        offset: const Offset(0, 2),
        color: UiKitColor.gray.withValues(alpha: .16),
        blurRadius: 4,
      );

  /// Тень для кнопки внизу страницы
  static BoxShadow bottomPageButtonShadow(BuildContext context) => BoxShadow(
        color: UiKitColor.black.withValues(alpha: .08),
        blurRadius: 8.6,
        offset: const Offset(0, -2),
        spreadRadius: 1,
      );

  /// Тень для всех сторон
  static BoxShadow allSidesShadow(BuildContext context) => BoxShadow(
        color: UiKitColor.black.withValues(alpha: .12),
        blurRadius: 8,
        offset: const Offset(0, 4),
        spreadRadius: 2,
      );
}
