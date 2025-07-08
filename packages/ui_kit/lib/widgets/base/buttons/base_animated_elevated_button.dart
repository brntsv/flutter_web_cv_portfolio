import 'package:flutter/material.dart';
import '../../../constants/base_constants.dart';
import '../../../theme/theme.dart';
import '../animated_text/animation_timing_mixin.dart';
import '../base_icon.dart';

/// {@template animated_elevated_button.class}
/// Анимированная базовая кнопка.
/// {@endtemplate}
class AnimatedElevatedButton extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_elevated_button.class}
  const AnimatedElevatedButton({
    required this.title,
    required this.onPressed,
    required this.appearDuration,
    required this.appearClass,
    super.key,
    this.child,
    this.textColor,
    this.backgroundColor,
    this.margin,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: BaseConst.base24,
      horizontal: BaseConst.base24,
    ),
    this.iconWidgetLeft,
    this.iconWidgetRight,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(BaseConst.base18),
    ),
  });

  /// Заголовок
  final String title;

  /// Дочерний виджет
  final Widget? child;

  /// Callback при нажатии
  final VoidCallback? onPressed;

  /// Цвет текста
  final Color? textColor;

  /// Цвет фона
  final Color? backgroundColor;

  /// Отступы
  final EdgeInsets? margin;

  /// Отступы внутри
  final EdgeInsets contentPadding;

  /// Иконка слева
  final BaseIcon? iconWidgetLeft;

  /// Иконка справа
  final BaseIcon? iconWidgetRight;

  /// Радиус
  final BorderRadius borderRadius;

  /// Длительность анимации
  final double appearDuration;

  /// Класс анимации
  final int appearClass;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    final textStyle = textStyles(context);

    // Получаем параметры анимации
    final animationClass = getAnimationClass(0, appearClass);
    final animationParams = getAnimationParams(animationClass);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: (appearDuration * 1000).toInt()),
      curve: Interval(
        animationParams.startTime,
        animationParams.endTime,
        curve: Curves.easeOut,
      ),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Container(
          margin: margin,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? color.skyGray,
              disabledBackgroundColor: color.lightGray,
              overlayColor: color.lightGray,
              padding: contentPadding,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: BaseConst.base10,
              children: [
                if (iconWidgetLeft != null) ...[iconWidgetLeft!],
                Text(
                  title,
                  style: textStyle.buttonTitle.copyWith(
                    color: textColor ?? color.white,
                  ),
                ),
                if (iconWidgetRight != null) ...[iconWidgetRight!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
