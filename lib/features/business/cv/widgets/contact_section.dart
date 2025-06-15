import 'package:flutter/material.dart';
import 'package:flutter_web/features/business/cv/widgets/animated_text.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:utilities/url_launcher/url_launcher.dart';

/// Секция "Контактная информация"
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
            children: [
              _ContactLinkRow(
                prefix: l10n.telegramPrefix,
                linkText: l10n.telegramName,
                url: l10n.telegramUrl,
              ),
              const SizedBox(height: BaseConst.base8),
              _ContactLinkRow(
                prefix: l10n.githubPrefix,
                linkText: l10n.githubName,
                url: l10n.githubUrl,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactLinkRow extends StatelessWidget {
  const _ContactLinkRow({
    required this.prefix,
    required this.linkText,
    required this.url,
  });
  final String prefix;
  final String linkText;
  final String url;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyles(context);
    final color = colors(context);

    return Row(
      children: [
        AnimatedText(
          text: prefix,
          style: textStyle.baseText,
          appearDuration: 6,
          appearClass: 2,
        ),
        GestureDetector(
          onTap: () => UrlLauncher.openUrl(url),
          child: AnimatedText(
            text: linkText,
            style: textStyle.baseText.copyWith(
              color: color.gray,
            ),
            appearDuration: 6,
            appearClass: 2,
          ),
        ),
      ],
    );
  }
}
