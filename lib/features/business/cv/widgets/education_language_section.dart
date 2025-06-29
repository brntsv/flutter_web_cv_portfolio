import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/section_title.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';

/// Секция "Образование и языки"
class EducationLanguagesSection extends StatelessWidget {
  /// {@macro education_languages_section.class}
  const EducationLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) => const Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: BaseConst.base24,
    children: [
      Expanded(child: _EducationSection()),
      Expanded(child: _LanguagesSection()),
    ],
  );
}

class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: l10n.education,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base16),
        AnimatedText(
          text: l10n.educationInstitution,
          style: textStyle.baseText.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 6,
          appearClass: 3,
        ),
        AnimatedText(
          text: l10n.educationDegree,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base8),
        AnimatedText(
          text: l10n.educationYears,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 3,
        ),
      ],
    );
  }
}

class _LanguagesSection extends StatelessWidget {
  const _LanguagesSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: l10n.languages,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base16),
        AnimatedText(
          text: l10n.languageEnglish,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base8),
        AnimatedText(
          text: l10n.languageRussian,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 3,
        ),
      ],
    );
  }
}
