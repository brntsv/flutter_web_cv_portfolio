import 'package:flutter/material.dart';
import 'package:flutter_web/features/app/app.dart';
import 'package:flutter_web/features/navigation/router.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// Точка входа в Application.
class AppFlow extends StatelessWidget {
  /// Точка входа в Application.
  const AppFlow({super.key});

  @override
  Widget build(BuildContext context) {
    // final initialThemeMode =
    //     getIt<IThemeModeRepository>().getThemeMode() ?? ThemeMode.light;
    return Nested(
      children: [
        // BlocProvider(
        //   create: (context) => getIt<ThemeBloc>(param1: initialThemeMode),
        // ),
        ChangeNotifierProvider<AppRouter>(create: (_) => AppRouter()),
      ],
      child: const App(),
    );
  }
}
