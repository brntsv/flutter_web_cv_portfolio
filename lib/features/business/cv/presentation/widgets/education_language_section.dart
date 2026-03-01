import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_text.dart';

import '../../../../../l10n/localization_extension.dart';
import 'section_title.dart';

/// {@template education_languages_section.class}
/// Секция "Образование и языки"
/// {@endtemplate}
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
          appearClass: 1,
        ),
        const SizedBox(height: BaseConst.base16),
        BaseAnimatedText(
          text: l10n.educationInstitution,
          style: textStyle.baseText.copyWith(
            fontWeight: FontWeight.bold,
          ),
          appearDuration: 6,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base8),
        BaseAnimatedText(
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
          appearClass: 1,
        ),
        const SizedBox(height: BaseConst.base16),
        BaseAnimatedText(
          text: l10n.languageEnglish,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 3,
        ),
        const SizedBox(height: BaseConst.base8),
        BaseAnimatedText(
          text: l10n.languageRussian,
          style: textStyle.baseText,
          appearDuration: 3,
          appearClass: 1,
        ),
      ],
    );
  }
}
