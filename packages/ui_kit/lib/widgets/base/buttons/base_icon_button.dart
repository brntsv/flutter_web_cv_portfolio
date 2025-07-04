import 'package:flutter/material.dart';
import '../../../constants/base_constants.dart';
import '../../../theme/theme.dart';
import '../base_icon.dart';

/// Базовая кнопка - иконка
class BaseIconButton extends StatelessWidget {
  /// Базовая кнопка - иконка
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
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

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          IconButton(
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
        ],
      );
}
