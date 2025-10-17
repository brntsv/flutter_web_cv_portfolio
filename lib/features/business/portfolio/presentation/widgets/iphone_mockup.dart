import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/indicators/base_dot_swiper_pagination_builder.dart';

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
      builder: BaseDotSwiperPaginationBuilder(
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
                border:
                    Border.all(color: color.darkGray, width: BaseConst.base4),
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
