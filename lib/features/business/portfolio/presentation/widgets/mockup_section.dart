import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';

import '../../domain/entities/project_entity.dart';
import 'iphone_mockup.dart';

/// {@template mockup_section}
/// Секция для отображения макета приложения.
/// Также может быть экраном при открытии на мобильном устройстве.
/// {@endtemplate}
class MockupSection extends StatelessWidget {
  /// {@macro mockup_section}
  const MockupSection({
    required this.project,
    this.borderRadius,
    super.key,
  });

  /// Данные проекта для отображения.
  final ProjectEntity project;

  /// Радиусы углов для контейнера.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    return Container(
      padding: context.screenSize.height > BaseConst.base700
          ? const EdgeInsets.all(BaseConst.base72)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: project.appType.backgroundColor(color),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: IphoneMockup(screenshots: project.screenshots),
      ),
    );
  }
}
