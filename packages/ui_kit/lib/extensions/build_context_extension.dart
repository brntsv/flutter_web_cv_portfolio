import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Расширение для [BuildContext]
extension BuildContextExtension on BuildContext {
  /// Получает тему приложения
  ThemeData get theme => Theme.of(this);

  /// Получает размер экрана
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Получает плотность пикселей устройства
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Получает отступы экрана
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Получает отступы вида
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Проверяет, является ли устройство мобильным
  bool get isMobile => screenSize.width < screenSize.height;

  /// Проверяет, является ли устройство первым фокусом
  bool get onFocus => FocusScope.of(this).isFirstFocus;

  /// Проверяет, является ли платформа Android
  bool get isAndroidPlatform => defaultTargetPlatform == TargetPlatform.android;

  /// Удаляет все маршруты, пока не будет достигнут предикат
  void popUntil(
    bool Function(Route<dynamic>) predicate,
  ) =>
      router.popUntil(predicate);

  /// Удаляет фокус
  void unfocus() => FocusScope.of(this).unfocus();

  /// Запрашивает фокус
  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);

  /// Переходит к следующему фокусу
  void nextFocus() => FocusScope.of(this).nextFocus();

  /// Переходит к следующему маршруту
  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(path, (_) => false);

  /// Переходит к следующему маршруту
  void push(PageRouteInfo route) => router.push(route);

  /// Заменяет маршрут
  void replace(PageRouteInfo route) => router.replace(route);

  /// Заменяет все маршруты
  void replaceAll(List<PageRouteInfo> routes) => router.replaceAll(routes);

  /// Удаляет последний маршрут и переходит к новому
  void popAndPush(PageRouteInfo route) => router.popAndPush(route);

  /// Удаляет последний маршрут
  void safePop<T>([T? result]) => router.maybePop(result);

  /// Проверяет, может ли быть удален маршрут
  bool canPop() => router.canPop();

  /// Навигация по маршруту
  void navigate(PageRouteInfo route) => router.navigate(route);

  /// Ширина по процентам
  double widthByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);
    return (screenSize.width * percent) / 100;
  }

  /// Высота по процентам
  double heightByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);
    return (screenSize.height * percent) / 100;
  }
}
