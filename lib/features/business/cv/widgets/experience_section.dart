import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/section_title.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text_with_links.dart';

/// Секция "Опыт работы"
class ExperienceSection extends StatelessWidget {
  /// {@macro experience_section.class}
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base16,
      children: [
        SectionTitle(title: l10n.experience),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Период работы
            Expanded(
              child: _ExperienceDate(
                date: l10n.nanAgencyPeriod,
              ),
            ),

            // Информация о работе
            const Expanded(
              flex: 3,
              child: _ExperienceDetails(),
            ),
          ],
        ),
      ],
    );
  }
}

class _ExperienceDate extends StatelessWidget {
  const _ExperienceDate({required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);

    return AnimatedText(
      text: date,
      style: textStyle.baseText,
      appearDuration: 6,
      appearClass: 2,
    );
  }
}

class _ExperienceDetails extends StatelessWidget {
  const _ExperienceDetails();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base8,
      children: [
        // Позиция
        AnimatedText(
          text: l10n.nanAgencyPosition,
          style: textStyle.h3.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 6,
          appearClass: 2,
        ),

        // Обязанности
        const _ResponsibilitiesSection(),

        // Достижения
        const _AchievementsSection(),

        // Проекты
        const _ProjectsSection(),
      ],
    );
  }
}

class _ResponsibilitiesSection extends StatelessWidget {
  const _ResponsibilitiesSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: l10n.nanAgencyResponsibilities,
          style: textStyle.baseText.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem1,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem2,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem3,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem4,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem5,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyResponsibilityItem6,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
      ],
    );
  }
}

class _AchievementsSection extends StatelessWidget {
  const _AchievementsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: l10n.nanAgencyAchievements,
          style: textStyle.baseText.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 6,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem1,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem2,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem3,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem4,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem5,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem6,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem7,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem8,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedText(
          text: l10n.nanAgencyAchievementItem9,
          style: textStyle.baseText,
          appearDuration: 8,
          appearClass: 2,
        ),
      ],
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: l10n.nanAgencyProjects,
          style: textStyle.baseText.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedTextWithLinks(
          text: l10n.nanAgencyProjectsRealtOne,
          appearDuration: 8,
          appearClass: 2,
        ),
        AnimatedTextWithLinks(
          text: l10n.nanAgencyProjectsNovex,
          appearDuration: 8,
          appearClass: 2,
        ),
      ],
    );
  }
}
