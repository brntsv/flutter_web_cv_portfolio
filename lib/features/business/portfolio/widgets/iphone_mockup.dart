import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';

/// {@template iphone_mockup}
/// Виджет, имитирующий макет iPhone с пролистываемым контентом.
/// {@endtemplate}
class IphoneMockup extends StatelessWidget {
  /// {@macro iphone_mockup}
  const IphoneMockup({
    required this.screenshots,
    super.key,
  });

  /// Список виджетов для отображения в качестве скриншотов.
  final List<Widget> screenshots;

  @override
  Widget build(BuildContext context) {
    // Размеры для макета телефона
    const phoneWidth = 280.0;
    const phoneHeight = 560.0;
    const screenBorder = 12.0;

    final color = colors(context);

    final isSingleScreenshot = screenshots.length <= 1;

    const pagination = SwiperPagination(
      builder: CustomDotSwiperPaginationBuilder(
        spaceBetween: BaseConst.base10,
      ),
    );

    final swiper = ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Swiper(
        itemCount: screenshots.length,
        loop: !isSingleScreenshot,
        autoplay: !isSingleScreenshot,
        autoplayDelay: 10000,
        itemBuilder: (context, index) => screenshots[index],
        pagination: isSingleScreenshot ? null : pagination,
      ),
    );

    return OverflowBox(
      minWidth: phoneWidth,
      maxWidth: phoneWidth,
      minHeight: phoneHeight,
      maxHeight: phoneHeight,
      child: SizedBox(
        width: phoneWidth,
        height: phoneHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Корпус телефона
            Container(
              width: phoneWidth,
              height: phoneHeight,
              decoration: BoxDecoration(
                color: color.black,
                borderRadius: BorderRadius.circular(BaseConst.base40),
                border: Border.all(color: color.darkGray, width: BaseConst.base4),
              ),
            ),
            // Экран
            Positioned.fill(
              top: screenBorder,
              bottom: screenBorder,
              left: screenBorder,
              right: screenBorder,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(BaseConst.base28),
                child: swiper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template custom_dot_swiper_pagination_builder.class}
/// Кастомный builder для пагинации Swiper в виде точек.
/// {@endtemplate}
class CustomDotSwiperPaginationBuilder extends SwiperPlugin {
  /// {@macro custom_dot_swiper_pagination_builder.class}
  const CustomDotSwiperPaginationBuilder({
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
    final activeColor = this.activeColor ?? color.darkGray.withValues(alpha: .8);
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
