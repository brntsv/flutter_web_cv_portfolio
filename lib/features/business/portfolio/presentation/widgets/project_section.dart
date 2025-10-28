import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';

import '../../domain/entities/project_entity.dart';
import 'description_section.dart';
import 'iphone_mockup.dart';
import 'mockup_section.dart';

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
        child: switch (context.isMobile) {
          true => Padding(
              padding: const EdgeInsets.only(
                left: BaseConst.base24,
                right: BaseConst.base24,
                top: BaseConst.base24,
              ),
              child: Column(
                spacing: BaseConst.base12,
                children: [
                  SizedBox(
                    height: context.screenSize.height,
                    child: DescriptionSection(project: project),
                  ),
                  AspectRatio(
                    aspectRatio: BaseConst.iphoneMockupWidth /
                        BaseConst.iphoneMockupHeight,
                    child: IphoneMockup(screenshots: project.screenshots),
                  ),
                ],
              ),
            ),
          false => SizedBox(
              height: context.screenSize.height,
              child: Padding(
                padding: const EdgeInsets.all(BaseConst.base24),
                child: Row(
                  spacing: BaseConst.base24,
                  children: switch (index.isEven) {
                    true => [
                        Expanded(
                          child: DescriptionSection(
                            project: project,
                          ),
                        ),
                        Expanded(
                          child: MockupSection(
                            project: project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                      ],
                    false => [
                        Expanded(
                          child: MockupSection(
                            project: project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                        Expanded(
                          child: DescriptionSection(
                            project: project,
                          ),
                        ),
                      ],
                  },
                ),
              ),
            ),
        },
      );
}
