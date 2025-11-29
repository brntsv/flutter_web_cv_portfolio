import 'package:flutter/widgets.dart';

/// Миксин для экранов, у которых есть переключатель языка в
/// правом верхнем углу. Хранит флаг видимости и обновляет его с `setState`
/// только при реальном изменении.
mixin SwitcherVisibilityMixin<T extends StatefulWidget> on State<T> {
  /// Текущая видимость переключателя языка в правом верхнем углу.
  bool showSwitcher = true;

  /// Обновляет [showSwitcher] и вызывает `setState`,
  /// только если значение изменилось.
  void updateSwitcherVisibility(bool visible) {
    if (visible != showSwitcher) {
      setState(() => showSwitcher = visible);
    }
  }
}
