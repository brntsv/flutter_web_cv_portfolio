import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_text.dart';
import 'package:ui_kit/widgets/base/text/animated/base_animated_text_with_links.dart';

import '../../../../../l10n/localization_extension.dart';

/// {@template contact_section.class}
/// Контактная информация
/// {@endtemplate}
class ContactSection extends StatelessWidget {
  /// {@macro contact_section.class}
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            spacing: BaseConst.base8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseAnimatedText(
                text: l10n.email,
                style: textStyle.baseText,
                appearDuration: 3,
                appearClass: 1,
              ),
              BaseAnimatedText(
                text: l10n.phone,
                style: textStyle.baseText,
                appearDuration: 6,
                appearClass: 3,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            spacing: BaseConst.base8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseAnimatedTextWithLinks(
                text: l10n.telegramUrl,
                appearDuration: 6,
                appearClass: 3,
              ),
              BaseAnimatedTextWithLinks(
                text: l10n.githubUrl,
                appearDuration: 3,
                appearClass: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
