import 'package:flutter/material.dart';
import '../../../constants/base_constants.dart';
import '../../../theme/theme.dart';
import '../images/base_icon.dart';

/// {@template base_elevated_button.class}
/// Базовая кнопка.
/// {@endtemplate}
class BaseElevatedButton extends StatelessWidget {
  /// {@macro base_elevated_button.class}
  const BaseElevatedButton({
    required this.title,
    required this.onPressed,
    super.key,
    this.child,
    this.textColor,
    this.backgroundColor,
    this.margin,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: BaseConst.base6,
      horizontal: BaseConst.base12,
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

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    final textStyle = textStyles(context);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: color.darkGray,
          
        ),
        borderRadius: borderRadius,
      ),
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
              style: textStyle.buttonTitlePortfolio.copyWith(
                color: textColor ?? color.white,
              ),
            ),
            if (iconWidgetRight != null) ...[iconWidgetRight!],
          ],
        ),
      ),
    );
  }
}
