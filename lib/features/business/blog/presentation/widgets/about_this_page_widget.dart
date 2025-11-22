import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text_with_links.dart';

import '../../../../../l10n/localization_extension.dart';

/// {@template about_this_page_widget.class}
/// Виджет для отображения описания страницы
/// {@endtemplate}
class AboutThisPageWidget extends StatelessWidget {
  /// {@macro about_this_page_widget.class}
  const AboutThisPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base12,
      children: [
        AnimatedText(
          text: l10n.aboutThisPage,
          style: textStyle.h3,
          appearDuration: 6,
          appearClass: 3,
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
                text: l10n.blogFooterDesc,
                appearDuration: 1,
                appearClass: 2,
              ),
              AnimatedTextWithLinks(
                text: l10n.blogFooterDesc2,
                appearDuration: 6,
                appearClass: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
