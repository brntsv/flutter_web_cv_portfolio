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
class PortfolioPage extends StatefulWidget {
  /// {@macro portfolio_page.class}
  const PortfolioPage({
    super.key,
    this.initialProject,
  });

  /// С какого типа проекта начать (будет преобразован в индекс)
  final ProjectType? initialProject;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late final ScrollController _scrollController;
  late final List<ProjectEntity> _projects;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _projects = [
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final idx = _resolveInitialIndex();
      if (idx != null && idx >= 0 && idx < _projects.length) {
        _scrollToIndex(idx);
      }
    });
  }

  int? _resolveInitialIndex() {
    final type = widget.initialProject;
    if (type == null) return null;
    final i = _projects.indexWhere((e) => e.appType == type);
    return i >= 0 ? i : null;
  }

  void _scrollToIndex(int index) {
    final itemHeight = _sectionHeight(context);
    _scrollController.jumpTo(index * itemHeight);
  }

  double _sectionHeight(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Десктоп/таблет: секция = 1 экран (как и было)
    if (!context.isMobile) return size.height;

    // Мобилка: экран + gap между блоками +
    // высота макета + верхний паддинг секции
    const topPadding = BaseConst.base24;
    const gap = BaseConst.base12;

    // Ширина макета = ширина экрана минус горизонтальные паддинги секции
    final availableWidth =
        (size.width - BaseConst.base24 * 2).clamp(0.0, double.infinity);

    // Высота макета по заданному аспекту (width/height)
    const aspect = BaseConst.iphoneMockupWidth / BaseConst.iphoneMockupHeight;
    final mockupHeight = availableWidth / aspect;

    return topPadding + size.height + gap + mockupHeight;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = colors(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              ..._projects.asMap().entries.map(
                    (entry) => ProjectSection(
                      project: entry.value,
                      index: entry.key,
                    ),
                  ),
            ],
          ),

          // Кнопка назад в левом верхнем углу (только на широких экранах)
          if (context.canPop() && !context.isMobile) ...[
            Positioned(
              top: BaseConst.base48,
              left: BaseConst.base48,
              child: BaseIconButton(
                icon: Assets.images.iconLeftArrow,
                onPressed: context.safePop,
                iconColor: color.graphiteGray,
                size: BaseConst.base40,
              ),
            ),
          ],

          const Positioned(
            top: BaseConst.base48,
            right: BaseConst.base48,
            child: LanguageSwitcher(),
          ),
        ],
      ),
    );
  }
}
