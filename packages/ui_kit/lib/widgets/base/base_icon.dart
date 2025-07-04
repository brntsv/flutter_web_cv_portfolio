import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// {@template base_icon.class}
/// Базовый компонент для отображения иконки.
/// {@endtemplate}
class BaseIcon extends StatelessWidget {
  /// {@macro base_icon.class}
  const BaseIcon({
    required this.icon,
    super.key,
    this.color,
    this.size = 24,
    this.height,
    this.width,
  });

  /// Путь к иконке.
  final String icon;

  /// Цвет иконки.
  final Color? color;

  /// Высота иконки.
  final double? height;

  /// Ширина иконки.
  final double? width;

  /// Размер иконки.
  final double size;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        icon,
        width: width ?? size,
        height: height ?? size,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
}
