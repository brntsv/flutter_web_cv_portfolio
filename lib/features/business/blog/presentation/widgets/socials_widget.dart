import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text_with_links.dart';

import '../../../../../l10n/localization_extension.dart';

/// {@template socials_widget.class}
/// Виджет для отображения социальных сетей
/// {@endtemplate}
class SocialsWidget extends StatelessWidget {
  /// {@macro socials_widget.class}
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base12,
      children: [
        AnimatedText(
          text: l10n.socials,
          style: textStyle.h3,
          appearDuration: 6,
          appearClass: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: BaseConst.base16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: BaseConst.base4,
            children: [
              AnimatedTextWithLinks(
                text: l10n.telegram,
                appearDuration: 1,
                appearClass: 2,
              ),
              AnimatedTextWithLinks(
                text: l10n.linkedin,
                appearDuration: 6,
                appearClass: 3,
              ),
              AnimatedTextWithLinks(
                text: l10n.github,
                appearDuration: 1,
                appearClass: 2,
              ),
              // AnimatedTextWithLinks(
              //   text: l10n.twitter,
              //   appearDuration: 6,
              //   appearClass: 2,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
