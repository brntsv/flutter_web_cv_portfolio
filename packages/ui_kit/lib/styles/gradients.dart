import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Образцы градиентов
sealed class UiKitGradients {
  /// Градиент для шиммера
  static LinearGradient shimmer(BuildContext context) => LinearGradient(
        colors: [
          colors(context).lightGray,
          colors(context).lightGray,
          colors(context).white,
          colors(context).lightGray,
          colors(context).lightGray,
        ],
        stops: const [0, .35, .5, .65, 1],
      );
}
