import 'package:flutter/material.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';

import 'section_title.dart';

/// Секция "О себе"
class AboutMeSection extends StatelessWidget {
  /// {@macro about_me_section.class}
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base16,
      children: [
        SectionTitle(
          title: l10n.aboutMe,
        ),
        AnimatedText(
          text: l10n.aboutMeDesc,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
      ],
    );
  }
}
