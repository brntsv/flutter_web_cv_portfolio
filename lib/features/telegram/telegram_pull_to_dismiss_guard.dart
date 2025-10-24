import 'package:flutter/widgets.dart';
import 'telegram_pd_bridge.dart';

/// {@template telegram_pull_to_dismiss_guard.class}
/// Mixin для защиты от pull-to-dismiss в Telegram.
/// {@endtemplate}
mixin TelegramPullToDismissGuard<T extends StatefulWidget> on State<T> {
  VoidCallback? _tpdListener;

  /// Инициализирует guard для защиты от pull-to-dismiss в Telegram.
  void attachPullToDismissGuard(ScrollController controller) {
    TelegramPDBridge.init();

    _tpdListener ??= () {
      final atTop = !controller.hasClients || controller.offset <= 0.5;
      TelegramPDBridge.setAtTop(atTop);
    };
    controller.addListener(_tpdListener!);

    // Первичная синхронизация
    final atTop = !controller.hasClients || controller.offset <= 0.5;
    TelegramPDBridge.setAtTop(atTop);
  }

  /// Отключает guard для защиты от pull-to-dismiss в Telegram.
  void detachPullToDismissGuard(ScrollController controller) {
    if (_tpdListener != null) {
      controller.removeListener(_tpdListener!);
      _tpdListener = null;
    }
    // Разрешаем жест при уходе со страницы
    TelegramPDBridge.setAtTop(true);
  }
}
