import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/section_title.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';

/// Секция "Навыки"
class SkillsSection extends StatelessWidget {
  /// {@macro skills_section.class}
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: l10n.skills,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base16),
        _SkillsWrap(skillsText: l10n.skillsList),
      ],
    );
  }
}

class _SkillsWrap extends StatelessWidget {
  const _SkillsWrap({required this.skillsText});

  /// Текст навыков
  final String skillsText;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final skills = skillsText.split(RegExp(r'\s{2,}'));

    return Wrap(
      spacing: BaseConst.base24,
      runSpacing: BaseConst.base8,
      children: skills
          .map(
            (skill) => AnimatedText(
              text: skill,
              style: textStyle.baseText,
              appearDuration: 6,
              appearClass: 3,
            ),
          )
          .toList(),
    );
  }
}
