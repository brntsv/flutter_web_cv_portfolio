import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/base_constants.dart';
import '../../../theme/theme.dart';

/// {@template base_smooth_page_indicator}
/// Базовый индикатор страниц с "плавными" точками.
/// {@endtemplate}
class BaseSmoothPageIndicator extends StatelessWidget {
  /// {@macro base_smooth_page_indicator}
  const BaseSmoothPageIndicator({
    required this.count,
    required this.activeIndex,
    super.key,
  });

  /// Общее количество элементов.
  final int count;

  /// Текущий активный индекс.
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);

    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ScrollingDotsEffect(
        maxVisibleDots: 7,
        smallDotScale: 1,
        activeDotColor: color.darkGray.withValues(alpha: .8),
        dotColor: color.darkGray.withValues(alpha: .3),
        dotHeight: BaseConst.base8,
        dotWidth: BaseConst.base8,
        spacing: BaseConst.base4,
      ),
    );
  }
}
