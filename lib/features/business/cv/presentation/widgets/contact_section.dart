import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text_with_links.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedText(
                text: l10n.email,
                style: textStyle.baseText,
                appearDuration: 6,
                appearClass: 2,
              ),
              const SizedBox(height: BaseConst.base8),
              AnimatedText(
                text: l10n.phone,
                style: textStyle.baseText,
                appearDuration: 6,
                appearClass: 2,
              ),
              const SizedBox(height: BaseConst.base8),
              AnimatedText(
                text: l10n.location,
                style: textStyle.baseText,
                appearDuration: 6,
                appearClass: 2,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: BaseConst.base8,
            children: [
              AnimatedTextWithLinks(
                text: l10n.telegramUrl,
                appearDuration: 6,
                appearClass: 2,
              ),
              AnimatedTextWithLinks(
                text: l10n.githubUrl,
                appearDuration: 6,
                appearClass: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
