import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_clickable_text.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';

import '../../../../l10n/localization_extension.dart';
import '../../../navigation/router.dart';

/// {@template projects_widget.class}
/// Виджет для отображения проектов
/// {@endtemplate}
class ProjectsWidget extends StatelessWidget {
  /// {@macro projects_widget.class}
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle = textStyles(context);
    return

        /// Проекты
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: BaseConst.base12,
      children: [
        AnimatedText(
          text: l10n.projects,
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
              AnimatedClickableText(
                text: l10n.flourAndOrder,
                description: l10n.flourAndOrderDesc,
                appearDuration: 6,
                appearClass: 2,
                onTap: () => context.push(
                  const CvRoute(),
                ),
              ),
              AnimatedClickableText(
                text: l10n.realtOne,
                description: l10n.realtOneDesc,
                appearDuration: 6,
                appearClass: 2,
                onTap: () => context.push(
                  const CvRoute(),
                ),
              ),
              AnimatedClickableText(
                text: l10n.novex,
                description: l10n.novexDesc,
                appearDuration: 6,
                appearClass: 2,
                onTap: () => context.push(
                  const CvRoute(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
