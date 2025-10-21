import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/gradients/base_sinusoidal_gradient_container.dart';
import 'package:ui_kit/widgets/base/images/base_image.dart';

import '../../../../../l10n/localization_extension.dart';
import '../../../../locale_mode/bloc/locale_bloc.dart';
import '../../domain/entities/project_entity.dart';
import 'iphone_mockup.dart';
import 'store_badges_widget.dart';

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
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    final isRu = context.select<LocaleBloc, bool>((bloc) => bloc.state.isRu);
    final badges = project.appType.badges(isRu: isRu);

    // Левый/правый контейнеры (будут чередоваться по индексу)
    final textContainer = Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BaseConst.base40),
          color: color.lightGray,
        ),
        padding: const EdgeInsets.all(BaseConst.base60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: BaseConst.base20,
          children: [
            Row(
              spacing: BaseConst.base16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(BaseConst.base14),
                  child: SizedBox.square(
                    dimension: BaseConst.base72,
                    child: BaseImage.asset(
                      assetPath: project.appType.iconPath,
                    ),
                  ),
                ),
                Text(
                  project.appType.projectTitle(l10n),
                  style: textStyle.h4,
                ),
              ],
            ),
            Text(
              project.appType.projectDescription(l10n),
              style: textStyle.baseTextDesc,
            ),
            if (badges.isNotEmpty) ...[
              StoreBadgesWidget(badges: badges),
            ],
          ],
        ),
      ),
    );

    final mockupContainer = Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BaseConst.base40),
        child: SizedBox.expand(
          child: switch (project.appType.gradientColors(color).length >= 2) {
            true => BaseSinusoidalGradientContainer(
                startColor: project.appType.gradientColors(color).first,
                endColor: project.appType.gradientColors(color).last,
                child: Center(
                  child: IphoneMockup(screenshots: project.screenshots),
                ),
              ),
            false => DecoratedBox(
                decoration: BoxDecoration(
                  color: project.appType.backgroundColor(color),
                ),
                child: Center(
                  child: IphoneMockup(screenshots: project.screenshots),
                ),
              ),
          },
        ),
      ),
    );

    final children = index.isEven
        ? <Widget>[
            textContainer,
            const SizedBox(width: BaseConst.base24),
            mockupContainer,
          ]
        : <Widget>[
            mockupContainer,
            const SizedBox(width: BaseConst.base24),
            textContainer,
          ];

    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.screenSize.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BaseConst.base24,
            vertical: BaseConst.base24,
          ),
          child: Row(children: children),
        ),
      ),
    );
  }
}
