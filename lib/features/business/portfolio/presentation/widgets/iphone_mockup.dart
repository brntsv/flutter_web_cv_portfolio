import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/indicators/base_smooth_page_indicator.dart';

/// {@template iphone_mockup}
/// Виджет, имитирующий макет iPhone с пролистываемым контентом.
/// {@endtemplate}
class IphoneMockup extends StatefulWidget {
  /// {@macro iphone_mockup}
  const IphoneMockup({
    required this.screenshots,
    super.key,
  });

  /// Список виджетов для отображения в качестве скриншотов.
  final List<Widget> screenshots;

  @override
  State<IphoneMockup> createState() => _IphoneMockupState();
}

class _IphoneMockupState extends State<IphoneMockup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);

    // Радиусы/рамки: экранный радиус = радиус корпуса − толщина рамки
    const frameRadius = BaseConst.base48;
    const borderWidth = BaseConst.base6;
    const screenRadius = frameRadius - borderWidth;

    final isSingleScreenshot = widget.screenshots.length <= 1;

    final swiper = ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Swiper(
        itemCount: widget.screenshots.length,
        loop: !isSingleScreenshot,
        autoplay: !isSingleScreenshot,
        autoplayDelay: 10000,
        itemBuilder: (context, index) => widget.screenshots[index],
        onIndexChanged: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );

    return Center(
      child: SizedBox.expand(
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: BaseConst.base16,
            children: [
              Container(
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
              if (widget.screenshots.length > 1) ...[
                BaseSmoothPageIndicator(
                  activeIndex: _currentIndex,
                  count: widget.screenshots.length,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
