import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/presentation/widgets/about_me_section.dart';
import 'package:flutter_web/features/business/cv/presentation/widgets/contact_section.dart';
import 'package:flutter_web/features/business/cv/presentation/widgets/experience_section.dart';
import 'package:flutter_web/features/business/cv/presentation/widgets/skills_section.dart';
import 'package:flutter_web/features/locale_mode/widgets/language_switcher.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/buttons/base_animated_icon_button.dart';

import 'widgets/education_language_section.dart';

/// {@template cv_page.class}
/// Страница с резюме
/// {@endtemplate}
@RoutePage()
final class CvPage extends StatelessWidget {
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
          SelectionArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: BaseConst.base110,
                    horizontal: context.screenSize.width < BaseConst.base700
                        ? BaseConst.base28
                        : 0,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: context.screenSize.width < BaseConst.base700
                          ? context.screenSize.width
                          : BaseConst.base700,
                    ),
                    child: Column(
                      spacing: BaseConst.base32,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Имя
                        AnimatedText(
                          text: '${l10n.yourName}, ${l10n.yourJob}',
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
          ),

          // Кнопка назад в левом верхнем углу (только на широких экранах)
          if (context.canPop() &&
              context.screenSize.width > BaseConst.base870) ...[
            Positioned(
              top: BaseConst.base40,
              left: BaseConst.base60,
              child: BaseAnimatedIconButton(
                icon: Assets.images.iconLeftArrow,
                onPressed: context.safePop,
                iconColor: color.graphiteGray,
                size: BaseConst.base40,
                appearDuration: 6,
                appearClass: 2,
              ),
            ),
          ],

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
