import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Расширение для BuildContext
extension BuildContextExtension on BuildContext {
  /// Получить тему
  ThemeData get theme => Theme.of(this);

  /// Получить размер экрана
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Получить плотность пикселей
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Получить отступы
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// Получить отступы для view
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Проверка на планшет
  bool get isTablet => screenSize.width > 600;

  /// Проверка на фокус
  bool get onFocus => FocusScope.of(this).isFirstFocus;

  /// Проверка на платформу android
  bool get isAndroidPlatform => defaultTargetPlatform == TargetPlatform.android;

  /// Покинуть все маршруты до тех пор, пока не будет выполнен предикат
  void popUntil(
    bool Function(Route<dynamic>) predicate,
  ) =>
      router.popUntil(predicate);

  /// Убрать фокус
  void unfocus() => FocusScope.of(this).unfocus();

  /// Запросить фокус
  void requestFocus([FocusNode? node]) =>
      FocusScope.of(this).requestFocus(node);

  /// Перейти к следующему фокусу
  void nextFocus() => FocusScope.of(this).nextFocus();

  /// Перейти к следующему маршруту
  void pushNamedAndRemoveUntil(String path) =>
      Navigator.of(this).pushNamedAndRemoveUntil(path, (_) => false);

  /// Перейти к следующему маршруту
  void push(PageRouteInfo route) => router.push(route);

  /// Заменить маршрут
  void replace(PageRouteInfo route) => router.replace(route);

  /// Заменить все маршруты в стеке
  void replaceAll(List<PageRouteInfo> routes) => router.replaceAll(routes);

  /// Убрать из стека текущий маршрут и добавить новый
  void popAndPush(PageRouteInfo route) => router.popAndPush(route);

  /// Перейти назад
  void pop<T>([T? result]) => router.maybePop(result);

  /// Проверка на возможность перейти назад
  bool canPop() => router.canPop();

  /// Перейти на маршрут
  void navigate(PageRouteInfo route) => router.navigate(route);

  /// Получить ширину по проценту
  double widthByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);
    return (screenSize.width * percent) / 100;
  }

  /// Получить высоту по проценту
  double heightByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);
    return (screenSize.height * percent) / 100;
  }
}
