import 'package:auto_route/auto_route.dart';
import 'package:flutter_web/features/navigation/export_pages.dart';

part 'router.gr.dart';

/// {@template app_router.class}
/// Роутер для навигации
/// {@endtemplate}
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BlogRoute.page, initial: true, path: '/'),
        AutoRoute(page: CvRoute.page, path: '/cv'),
        AutoRoute(page: PortfolioRoute.page, path: '/portfolio'),
      ];
}
