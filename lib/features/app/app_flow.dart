import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../navigation/router.dart';
import 'app.dart';

/// {@template app_flow.class}
/// Точка входа в Application.
/// {@endtemplate}
final class AppFlow extends StatelessWidget {
  /// {@macro app_flow.class}
  const AppFlow({super.key});

  @override
  Widget build(BuildContext context) => Nested(
        children: [
          ChangeNotifierProvider<AppRouter>(create: (_) => AppRouter()),
        ],
        child: const App(),
      );
}
