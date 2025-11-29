import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';

import '../../../../locale_mode/widgets/language_switcher.dart';

/// {@template top_right_language_switcher.class}
/// Виджет-обёртка, который размещает [LanguageSwitcher] в правом верхнем углу
/// экрана и управляет его видимостью.
/// {@endtemplate}
class TopRightLanguageSwitcher extends StatelessWidget {
  /// {@macro top_right_language_switcher.class}
  const TopRightLanguageSwitcher({
    required this.isVisible,
    super.key,
  });

  /// Показывать ли переключатель языка.
  ///
  /// - Если `true`, переключатель плавно проявляется и обрабатывает тапы.
  /// - Если `false`, переключатель полностью прозрачен и игнорирует события 
  /// ввода.
  final bool isVisible;

  @override
  Widget build(BuildContext context) => Positioned(
        top: BaseConst.base48,
        right: BaseConst.base48,
        child: AnimatedOpacity(
          duration: BaseConst.duration200,
          opacity: isVisible ? 1 : 0,
          child: IgnorePointer(
            ignoring: !isVisible,
            child: const LanguageSwitcher(),
          ),
        ),
      );
}
