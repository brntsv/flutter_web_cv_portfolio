import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/buttons/base_icon_button.dart';

import '../../../l10n/localization_extension.dart';
import '../../locale_mode/widgets/language_switcher.dart';
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
    final l10n = context.l10n;
    final color = colors(context);

    // Моковые данные для проектов
    final projects = [
      ProjectData(
        title: 'Мука и Порядок',
        description: 'CRM для кондитеров и пекарей',
        gradientColors: [
          color.flourAndOrderBeige,
          color.flourAndOrderRed.withValues(alpha: .2),
        ],

        screenshots: [
          Container(color: Colors.red.shade200),
          Container(color: Colors.green.shade200),
          Container(color: Colors.orange.shade200),
        ],
        textColor: color.graphiteGray,
        useSinusoidalGradient: true,
      ),
      ProjectData(
        title: 'Realt.One',
        description: 'Приложение для риэлторов',
        gradientColors: [
          color.white,
          color.white,
        ],
        screenshots: [
          Container(color: Colors.blue.shade200),
          Container(color: Colors.yellow.shade200),
        ],
        textColor: color.graphiteGray,
      ),
      ProjectData(
        title: 'Novex',
        description: 'E-comm приложение для сети хозяйственных магазинов',
        gradientColors: [
          color.novexBlue.withValues(alpha: .6),
          color.novexBlue,
        ],
        useSinusoidalGradient: true,
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
              ...projects.map((project) => ProjectSection(project: project)),
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
