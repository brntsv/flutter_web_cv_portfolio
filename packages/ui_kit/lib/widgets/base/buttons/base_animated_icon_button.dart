import 'package:flutter/material.dart';
import '../../../constants/base_constants.dart';
import '../../../theme/theme.dart';
import '../animated_text/animation_timing_mixin.dart';
import '../base_icon.dart';

/// {@template animated_icon_button.class}
/// Анимированная кнопка-иконка с фейд эффектом
/// {@endtemplate}
class BaseAnimatedIconButton extends StatelessWidget with AnimationTimingMixin {
  /// {@macro animated_icon_button.class}
  const BaseAnimatedIconButton({
    required this.icon,
    required this.onPressed,
    required this.appearDuration,
    required this.appearClass,
    super.key,
    this.iconColor,
    this.backgroundColor,
    this.size,
  });

  /// Иконка
  final String icon;

  /// Callback при нажатии
  final VoidCallback? onPressed;

  /// Цвет иконки
  final Color? iconColor;

  /// Цвет фона
  final Color? backgroundColor;

  /// Размер
  final double? size;

  /// Длительность анимации
  final double appearDuration;

  /// Класс анимации
  final int appearClass;

  @override
  Widget build(BuildContext context) {
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
        child: IconButton(
          icon: BaseIcon(
            icon: icon,
            color: iconColor ?? colors(context).darkGray,
            size: size ?? BaseConst.base24,
          ),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor ?? colors(context).transparent,
            overlayColor: colors(context).transparent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
          ),
          constraints: BoxConstraints(
            minWidth: size ?? 0,
            minHeight: size ?? 0,
          ),
        ),
      ),
    );
  }
} 