import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/buttons/base_elevated_button.dart';
import 'package:ui_kit/widgets/base/images/base_icon.dart';
import 'package:ui_kit/widgets/base/images/base_image.dart';
import 'package:ui_kit/widgets/base/text/base_auto_shrink_text.dart';

import '../../../../../l10n/localization_extension.dart';
import '../../../../locale_mode/bloc/locale_bloc.dart';
import '../../../../navigation/router.dart';
import '../../domain/entities/project_entity.dart';
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
  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    final isRu = context.select<LocaleBloc, bool>((bloc) => bloc.state.isRu);
    final badges = project.appType.badges(isRu: isRu);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(BaseConst.base40),
          color: color.lightGray,
        ),
        constraints: BoxConstraints(
          minHeight: context.screenSize.height,
        ),
        padding: context.isMobile
            ? const EdgeInsets.all(BaseConst.base24)
            : const EdgeInsets.all(BaseConst.base60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: BaseConst.base10,
          children: [
            Row(
              spacing: BaseConst.base16,
              children: [
                BaseImage.asset(
                  assetPath: project.appType.iconPath,
                  borderRadius: BorderRadius.circular(BaseConst.base14),
                  size: Size.square(
                    context.isMobile ? BaseConst.base56 : BaseConst.base72,
                  ),
                ),
                Expanded(
                  child: BaseAutoShrinkText(
                    project.appType.projectTitle(l10n),
                    style: textStyle.h4,
                  ),
                ),
              ],
            ),
            Text(
              project.appType.projectDescription(l10n),
              style: textStyle.baseTextDesc,
            ),
            if (context.isMobile) ...[
              SizedBox(
                height: BaseConst.base44,
                child: BaseElevatedButton(
                  title: l10n.viewScreenshots,
                  backgroundColor: color.white,
                  textColor: color.darkGray,
                  borderRadius: BorderRadius.circular(BaseConst.base10),
                  iconWidgetRight: BaseIcon(
                    icon: Assets.images.iconLightning,
                    color: color.darkGray,
                    size: BaseConst.base20,
                  ),
                  onPressed: () => context.push(MockupRoute(project: project)),
                ),
              ),
            ],
            if (badges.isNotEmpty) ...[
              StoreBadgesWidget(badges: badges),
            ],
          ],
        ),
      ),
    );
  }
}
