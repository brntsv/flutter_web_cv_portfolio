import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/features/navigation/router.dart';
import 'package:flutter_web/l10n/bloc/locale_bloc.dart';
import 'package:ui_kit/theme/theme.dart';

import '../../l10n/generated/app_localizations.g.dart';

/// {@template app.class}
/// Главный виджет приложения
/// {@endtemplate}
final class App extends StatefulWidget {
  /// {@macro app.class}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = context.read<AppRouter>();
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LocaleBloc(),
        child: BlocSelector<LocaleBloc, LocaleState, Locale>(
          selector: (state) => state.locale,
          builder: (context, locale) => MaterialApp.router(
            title: 'Никита Баранцев',
            debugShowCheckedModeBanner: false,
            locale: locale,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (builderContext, widget) => MediaQuery(
              data: MediaQuery.of(builderContext)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: widget ?? const SizedBox.shrink(),
            ),
          ),
        ),
      );
}
