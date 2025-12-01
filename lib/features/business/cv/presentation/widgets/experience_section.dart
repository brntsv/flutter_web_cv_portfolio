import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_bullet_list_with_links.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_clickable_text.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_text.dart';

import '../../../../../l10n/localization_extension.dart';
import '../../../../navigation/router.dart';
import '../../../portfolio/domain/enums/project_type.dart';
import 'section_title.dart';

/// {@template experience_section.class}
/// Опыт работы
/// {@endtemplate}
class ExperienceSection extends StatelessWidget {
  /// {@macro experience_section.class}
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final items = <_ExperienceItemData>[
      // Muka
      _ExperienceItemData(
        period: l10n.flourAndOrderPeriod,
        position: l10n.flourAndOrderPosition,
        responsibilities: [
          l10n.flourAndOrderResponsibilityItem1,
          l10n.flourAndOrderResponsibilityItem2,
          l10n.flourAndOrderResponsibilityItem3,
          l10n.flourAndOrderResponsibilityItem4,
          l10n.flourAndOrderResponsibilityItem5,
        ],
        achievements: [
          l10n.flourAndOrderAchievementItem1,
          l10n.flourAndOrderAchievementItem2,
          l10n.flourAndOrderAchievementItem3,
          l10n.flourAndOrderAchievementItem4,
          l10n.flourAndOrderAchievementItem5,
        ],
        projectsTitle: l10n.app,
        projects: [
          _ExperienceProject(
            title: l10n.flourAndOrder,
            description: l10n.flourAndOrderDesc,
            onTap: () => context.push(
              PortfolioRoute(initialProject: ProjectType.flourAndOrder),
            ),
          ),
        ],
      ),

      // NaN Agency
      _ExperienceItemData(
        period: l10n.nanAgencyPeriod,
        position: l10n.nanAgencyPosition,
        responsibilities: [
          l10n.nanAgencyResponsibilityItem1,
          l10n.nanAgencyResponsibilityItem2,
          l10n.nanAgencyResponsibilityItem3,
          l10n.nanAgencyResponsibilityItem4,
          l10n.nanAgencyResponsibilityItem5,
        ],
        achievements: [
          l10n.nanAgencyAchievementItem1,
          l10n.nanAgencyAchievementItem2,
          l10n.nanAgencyAchievementItem3,
          l10n.nanAgencyAchievementItem4,
          l10n.nanAgencyAchievementItem5,
          l10n.nanAgencyAchievementItem6,
        ],
        projectsTitle: l10n.nanAgencyProjects,
        projects: [
          _ExperienceProject(
            title: l10n.realtOne,
            description: l10n.realtOneDesc,
            onTap: () => context.push(
              PortfolioRoute(initialProject: ProjectType.realtOne),
            ),
          ),
          _ExperienceProject(
            title: l10n.novex,
            description: l10n.novexDesc,
            onTap: () => context.push(
              PortfolioRoute(initialProject: ProjectType.novex),
            ),
          ),
        ],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base16,
      children: [
        SectionTitle(title: l10n.experience),
        ...items.map((e) => _ExperienceItem(data: e)),
      ],
    );
  }
}

class _ExperienceItemData {
  const _ExperienceItemData({
    required this.period,
    required this.position,
    required this.responsibilities,
    required this.achievements,
    required this.projectsTitle,
    required this.projects,
  });

  final String period;
  final String position;
  final List<String> responsibilities;
  final List<String> achievements;
  final String projectsTitle;
  final List<_ExperienceProject> projects;
}

class _ExperienceProject {
  const _ExperienceProject({
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String description;
  final VoidCallback onTap;
}

class _ExperienceItem extends StatelessWidget {
  const _ExperienceItem({required this.data});

  final _ExperienceItemData data;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Период работы
        Expanded(
          child: BaseAnimatedText(
            text: data.period,
            style: textStyle.baseText,
            appearDuration: 3,
            appearClass: 1,
          ),
        ),

        // Информация о работе
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: BaseConst.base8,
            children: [
              // Позиция
              BaseAnimatedText(
                text: data.position,
                style: textStyle.h3.copyWith(fontWeight: FontWeight.bold),
                appearDuration: 3,
                appearClass: 1,
              ),

              // Обязанности
              BaseAnimatedText(
                text: l10n.responsibilities,
                style: textStyle.baseText.copyWith(fontWeight: FontWeight.bold),
                appearDuration: 6,
                appearClass: 3,
              ),
              BaseAnimatedBulletListWithLinks(
                items: data.responsibilities,
                style: textStyle.baseText,
                appearDuration: 6,
                appearClass: 3,
              ),

              // Достижения
              BaseAnimatedText(
                text: l10n.achievements,
                style: textStyle.baseText.copyWith(fontWeight: FontWeight.bold),
                appearDuration: 6,
                appearClass: 3,
              ),
              BaseAnimatedBulletListWithLinks(
                items: data.achievements,
                style: textStyle.baseText,
                appearDuration: 8,
                appearClass: 4,
                bullet: '—',
              ),

              // Проекты (если есть)
              if (data.projects.isNotEmpty) ...[
                BaseAnimatedText(
                  text: data.projectsTitle,
                  style:
                      textStyle.baseText.copyWith(fontWeight: FontWeight.bold),
                  appearDuration: 6,
                  appearClass: 3,
                ),
                ...data.projects.map(
                  (p) => BaseAnimatedClickableText(
                    text: p.title,
                    description: p.description,
                    appearDuration: 8,
                    appearClass: 4,
                    onTap: p.onTap,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
