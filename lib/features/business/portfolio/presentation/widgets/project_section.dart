import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';

import '../../domain/entities/project_entity.dart';
import '../mockup_page.dart';
import 'description_section.dart';

/// {@template project_section}
/// Секция (сливер) для одного проекта в портфолио.
/// {@endtemplate}
class ProjectSection extends StatelessWidget {
  /// {@macro project_section}
  const ProjectSection({
    required this.project,
    required this.index,
    super.key,
  });

  /// Данные проекта для отображения.
  final ProjectEntity project;

  /// Порядковый индекс секции в списке (для чередования колонок).
  final int index;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SizedBox(
          height: context.screenSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: BaseConst.base24,
              vertical: BaseConst.base24,
            ),
            child: Row(
              children: switch (context.isMobile) {
                true => <Widget>[DescriptionSection(project: project)],
                false => index.isEven
                    ? <Widget>[
                        DescriptionSection(project: project),
                        const SizedBox(width: BaseConst.base24),
                        Expanded(
                          child: MockupPage(
                            project: project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                      ]
                    : <Widget>[
                        Expanded(
                          child: MockupPage(
                            project: project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                        const SizedBox(width: BaseConst.base24),
                        DescriptionSection(project: project),
                      ],
              },
            ),
          ),
        ),
      );
}
