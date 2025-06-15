import 'package:auto_route/auto_route.dart';
import 'package:flutter_web/features/navigation/export_pages.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CvRoute.page, initial: true, path: '/'),
    AutoRoute(page: PortfolioRoute.page, path: '/portfolio'),
  ];
}
