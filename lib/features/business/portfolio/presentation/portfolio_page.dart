import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/buttons/base_icon_button.dart';

import '../../../locale_mode/widgets/language_switcher.dart';
import '../domain/entities/project_entity.dart';
import '../domain/enums/project_type.dart';
import 'widgets/project_section.dart';

/// {@template portfolio_page.class}
/// Страница портфолио
/// {@endtemplate}
@RoutePage()
final class PortfolioPage extends StatelessWidget {
  /// {@macro portfolio_page.class}
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = colors(context);

    // Моковые данные для проектов
    final projects = [
      ProjectEntity(
        appType: ProjectType.flourAndOrder,
        screenshots: [
          Container(color: Colors.red.shade200),
          Container(color: Colors.green.shade200),
          Container(color: Colors.orange.shade200),
        ],
      ),
      ProjectEntity(
        appType: ProjectType.realtOne,
        screenshots: [
          Container(color: Colors.blue.shade200),
          Container(color: Colors.yellow.shade200),
        ],
      ),
      ProjectEntity(
        appType: ProjectType.novex,
        screenshots: [
          Container(color: Colors.purple.shade200),
          Container(color: Colors.indigo.shade200),
          Container(color: Colors.lime.shade200),
          Container(color: Colors.pink.shade200),
        ],
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              ...projects.asMap().entries.map(
                    (entry) => ProjectSection(
                      project: entry.value,
                      index: entry.key,
                    ),
                  ),
            ],
          ),

          // Кнопка назад в левом верхнем углу (только на широких экранах)
          if (context.canPop() &&
              context.screenSize.width > BaseConst.base870) ...[
            Positioned(
              top: BaseConst.base40,
              left: BaseConst.base60,
              child: BaseIconButton(
                icon: Assets.images.iconLeftArrow,
                onPressed: context.safePop,
                iconColor: color.graphiteGray,
                size: BaseConst.base40,
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
