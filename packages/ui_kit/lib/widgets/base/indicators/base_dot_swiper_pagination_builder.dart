import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

/// {@template base_dot_swiper_pagination_builder.class}
/// Базовый builder для пагинации Swiper в виде точек.
/// {@endtemplate}
class BaseDotSwiperPaginationBuilder extends SwiperPlugin {
  /// {@macro base_dot_swiper_pagination_builder.class}
  const BaseDotSwiperPaginationBuilder({
    this.activeColor,
    this.color,
    this.activeSize = 10.0,
    this.size = 8.0,
    this.spaceBetween = 4.0,
    this.key,
  });

  /// Цвет активной точки.
  final Color? activeColor;

  /// Цвет неактивной точки.
  final Color? color;

  /// Размер активной точки (диаметр).
  final double activeSize;

  /// Размер неактивной точки (диаметр).
  final double size;

  /// Расстояние между точками.
  final double spaceBetween;

  /// Ключ
  final Key? key;

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    final color = colors(context);
    // Используем цвета из builder'а или дефолтные.
    // Белый цвет будет хорошо смотреться на градиентных фонах.
    final activeColor =
        this.activeColor ?? color.darkGray.withValues(alpha: .8);
    final dotColor = this.color ?? color.darkGray.withValues(alpha: .3);

    final list = <Widget>[];

    final itemCount = config.itemCount;
    final activeIndex = config.activeIndex;

    for (var i = 0; i < itemCount; ++i) {
      final active = i == activeIndex;
      final dotSize = active ? activeSize : size;

      list.add(
        Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spaceBetween / 2),
          decoration: BoxDecoration(
            color: active ? activeColor : dotColor,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    if (config.scrollDirection == Axis.vertical) {
      return Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}
