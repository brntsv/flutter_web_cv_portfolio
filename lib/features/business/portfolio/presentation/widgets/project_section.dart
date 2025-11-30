import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:utils/size/measure_size.dart';

import '../../domain/enums/project_type.dart';
import 'description_section.dart';
import 'iphone_mockup.dart';
import 'mockup_section.dart';

/// {@template project_section}
/// Секция (сливер) для одного проекта в портфолио.
/// {@endtemplate}
class ProjectSection extends StatefulWidget {
  /// {@macro project_section}
  const ProjectSection({
    required this.project,
    required this.index,
    super.key,
  });

  /// Данные проекта для отображения.
  final ProjectType project;

  /// Порядковый индекс секции в списке (для чередования колонок).
  final int index;

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  /// Измеренная высота секции описания (с учётом minHeight)
  double? _descriptionHeight;

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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: _minDescriptionHeight,
                    ),
                    child: DescriptionSection(project: widget.project),
                  ),
                  AspectRatio(
                    aspectRatio: BaseConst.iphoneMockupWidth /
                        BaseConst.iphoneMockupHeight,
                    child: IphoneMockup(
                      screenshots: widget.project.screenshots,
                    ),
                  ),
                ],
              ),
            ),
          false => Padding(
              padding: const EdgeInsets.all(BaseConst.base24),
              child: Row(
                spacing: BaseConst.base24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: switch (widget.index.isEven) {
                  true => [
                      /// Левая колонка — описание
                      Expanded(
                        child: MeasureSize(
                          onChange: _onDescriptionSizeChanged,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: _minDescriptionHeight,
                            ),
                            child: DescriptionSection(project: widget.project),
                          ),
                        ),
                      ),

                      /// Правая колонка — мокап
                      Expanded(
                        child: SizedBox(
                          height: _mockupHeight(),
                          child: MockupSection(
                            project: widget.project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  false => [
                      /// Левая колонка — мокап
                      Expanded(
                        child: SizedBox(
                          height: _mockupHeight(),
                          child: MockupSection(
                            project: widget.project,
                            borderRadius: BorderRadius.circular(
                              BaseConst.base40,
                            ),
                          ),
                        ),
                      ),

                      /// Правая колонка — описание
                      Expanded(
                        child: MeasureSize(
                          onChange: _onDescriptionSizeChanged,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: _minDescriptionHeight,
                            ),
                            child: DescriptionSection(project: widget.project),
                          ),
                        ),
                      ),
                    ],
                },
              ),
            ),
        },
      );

  void _onDescriptionSizeChanged(Size size) {
    final screenH = context.screenSize.height;
    final target = size.height < screenH ? screenH : size.height;
    if (_descriptionHeight != target) {
      setState(() => _descriptionHeight = target);
    }
  }

  double _mockupHeight() {
    final screenH = context.screenSize.height;
    final h = _descriptionHeight ?? screenH;
    return h <= screenH ? screenH - BaseConst.base48 : h;
  }

  double get _minDescriptionHeight =>
      context.screenSize.height - BaseConst.base48;
}
