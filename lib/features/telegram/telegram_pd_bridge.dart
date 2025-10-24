// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:web/web.dart' as web;

/// {@template telegram_pd_bridge.class}
/// Класс для взаимодействия с Telegram Pull To Dismiss.
/// {@endtemplate}
final class TelegramPDBridge {
  static bool _initialized = false;

  /// Инициализирует флаг верхнего края.
  static void init() {
    if (_initialized) return;
    _initialized = true;
    // инициализируем атрибут (флаг верхнего края)
    web.document.documentElement?.setAttribute('data-tpd-at-top', '1');
  }

  /// Обновляет флаг: на верху ли контент (решает, блокировать ли dismiss).
  static void setAtTop(bool v) {
    web.document.documentElement
        ?.setAttribute('data-tpd-at-top', v ? '1' : '0');
  }
}
