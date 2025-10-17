import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/gradients/base_sinusoidal_gradient_container.dart';

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
  const ProjectSection({required this.project, super.key});

  /// Данные проекта для отображения.
  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    final isRu = context.select<LocaleBloc, bool>((bloc) => bloc.state.isRu);
    final badges = project.appType.badges(isRu: isRu);

    final content = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BaseConst.base40,
            vertical: BaseConst.base110,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: BaseConst.base20,
                  children: [
                    Text(
                      project.appType.projectTitle(l10n),
                      style: textStyle.h1.copyWith(
                        color: project.appType.projectTextColor(color),
                      ),
                    ),
                    Text(
                      project.appType.projectDescription(l10n),
                      style: textStyle.h2.copyWith(
                        color: project.appType.projectTextColor(color),
                      ),
                    ),
                    if (badges.isNotEmpty) ...[
                      StoreBadgesWidget(badges: badges),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: BaseConst.base50),
              Expanded(
                flex: 2,
                child: Center(
                  child: IphoneMockup(screenshots: project.screenshots),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );

    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.screenSize.height,
        child: project.appType.useSinusoidalGradient &&
                project.appType.gradientColors(color).length >= 2
            ? BaseSinusoidalGradientContainer(
                startColor: project.appType.gradientColors(color).first,
                endColor: project.appType.gradientColors(color).last,
                child: content,
              )
            : content,
      ),
    );
  }
}
