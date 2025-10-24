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
        CustomRoute(
          page: BlogRoute.page,
          path: '/',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: CvRoute.page,
          path: '/cv',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: PortfolioRoute.page,
          path: '/portfolio',
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
