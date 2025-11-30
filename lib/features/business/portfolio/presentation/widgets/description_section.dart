import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/images/base_image.dart';
import 'package:ui_kit/widgets/base/text/base_auto_shrink_text.dart';
import 'package:ui_kit/widgets/base/text/base_bullet_list_with_links.dart';
import 'package:ui_kit/widgets/base/text/base_text_wth_links.dart';

import '../../../../../l10n/localization_extension.dart';
import '../../../../locale_mode/bloc/locale_bloc.dart';
import '../../domain/enums/project_type.dart';
import 'store_badges_widget.dart';

/// {@template description_section}
/// Секция для отождения описания проекта.
/// {@endtemplate}
class DescriptionSection extends StatelessWidget {
  /// {@macro description_section}
  const DescriptionSection({
    required this.project,
    super.key,
  });

  /// Данные проекта для отображения.
  final ProjectType project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    final isRu = context.select<LocaleBloc, bool>((bloc) => bloc.state.isRu);
    final badges = project.badges(isRu: isRu);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BaseConst.base40),
        color: color.lightGray,
      ),
      padding: context.isMobile
          ? const EdgeInsets.only(
              left: BaseConst.base24,
              right: BaseConst.base24,
              top: BaseConst.base48,
              bottom: BaseConst.base32,
            )
          : const EdgeInsets.all(BaseConst.base60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: BaseConst.base32,
        children: [
          Row(
            spacing: BaseConst.base16,
            children: [
              /// Иконка проекта
              BaseImage.asset(
                assetPath: project.iconPath,
                borderRadius: BorderRadius.circular(BaseConst.base14),
                size: Size.square(
                  context.isMobile ? BaseConst.base56 : BaseConst.base72,
                ),
              ),

              /// Название проекта
              Expanded(
                child: BaseAutoShrinkText(
                  project.projectTitle(l10n),
                  style: textStyle.h4,
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: BaseConst.base16,
            children: [
              /// Заголовок/интро
              BaseTextWithLinks(
                text: project.projectDescription(l10n),
                style: textStyle.baseTextDesc,
              ),

              /// Буллет‑список
              BaseBulletListWithLinks(
                items: project.projectDescriptionItems(l10n),
                style: textStyle.baseTextDesc,
              ),
            ],
          ),

          /// Сторы проекта
          if (badges.isNotEmpty) ...[
            StoreBadgesWidget(badges: badges),
          ],
        ],
      ),
    );
  }
}
