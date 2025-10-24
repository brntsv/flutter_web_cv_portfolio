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
    final color = colors(context);

    // Радиусы/рамки: экранный радиус = радиус корпуса − толщина рамки
    const frameRadius = BaseConst.base60;
    const borderWidth = BaseConst.base6;
    const screenInset = borderWidth;
    const screenRadius = frameRadius - screenInset;

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

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BaseConst.base16),
        child: SizedBox.expand(
          child: FittedBox(
            child: Container(
              width: BaseConst.iphoneMockupWidth,
              height: BaseConst.iphoneMockupHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(frameRadius),
                border: Border.all(
                  color: color.gray,
                  width: borderWidth,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenRadius),
                child: swiper,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
