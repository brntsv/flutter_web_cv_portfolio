import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/about_me_section.dart';
import 'package:flutter_web/features/business/cv/widgets/contact_section.dart';
import 'package:flutter_web/features/business/cv/widgets/experience_section.dart';
import 'package:flutter_web/features/business/cv/widgets/skills_section.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:flutter_web/l10n/widgets/language_switcher.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';

import 'widgets/animated_text.dart';
import 'widgets/education_language_section.dart';

/// Страница с резюме
@RoutePage()
class CvPage extends StatelessWidget {
  /// {@macro cv_page.class}
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    return Scaffold(
      backgroundColor: color.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: BaseConst.base130,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: BaseConst.base700,
                  ),
                  child: Column(
                    spacing: BaseConst.base32,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Имя
                      AnimatedText(
                        text: l10n.yourName,
                        style: textStyle.h1,
                        appearDuration: 6,
                        appearClass: 2,
                      ),

                      /// Контактная информация
                      const ContactSection(),

                      /// О себе
                      const AboutMeSection(),

                      /// Опыт работы
                      const ExperienceSection(),

                      /// Навыки
                      const SkillsSection(),

                      /// Образование и языки
                      const EducationLanguagesSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: BaseConst.base20,
            right: BaseConst.base20,
            child: LanguageSwitcher(),
          ),
        ],
      ),
    );
  }
}
