import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:native_web_scroll/native_web_scroll.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/buttons/base_icon_button.dart';
import 'package:ui_kit/widgets/base/images/base_image.dart';

import '../../common/presentation/mixins/switcher_visibility_mixin.dart';
import '../../common/presentation/widgets/top_right_language_switcher.dart';
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

class _PortfolioPageState extends State<PortfolioPage>
    with SwitcherVisibilityMixin<PortfolioPage> {
  late final ScrollController _scrollController;
  late final List<ProjectEntity> _projects;

  static const double _threshold = BaseConst.base64;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _projects = [
      ProjectEntity(
        appType: ProjectType.flourAndOrder,
        screenshots: Assets.images.screenshots.flourAndOrder.values
            .map((asset) => BaseImage.asset(assetPath: asset.keyName))
            .toList(),
      ),
      ProjectEntity(
        appType: ProjectType.realtOne,
        screenshots: Assets.images.screenshots.realtOne.values
            .map((asset) => BaseImage.asset(assetPath: asset.keyName))
            .toList(),
      ),
      ProjectEntity(
        appType: ProjectType.novex,
        screenshots: Assets.images.screenshots.novex.values
            .map((asset) => BaseImage.asset(assetPath: asset.keyName))
            .toList(),
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

    // Десктоп/таблет: секция = 1 экран
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
          SelectionArea(
            child: switch (context.isMobile) {
              true => _PortfolioContent(
                  controller: _scrollController,
                  threshold: _threshold,
                  projects: _projects,
                  onSwitcherVisibilityChanged: updateSwitcherVisibility,
                ),
              false => NativeScrollBuilder(
                  controller: _scrollController,
                  builder: (context, scrollController) => _PortfolioContent(
                    controller: scrollController,
                    threshold: _threshold,
                    projects: _projects,
                    onSwitcherVisibilityChanged: updateSwitcherVisibility,
                  ),
                ),
            },
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

          TopRightLanguageSwitcher(isVisible: showSwitcher),
        ],
      ),
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  const _PortfolioContent({
    required this.controller,
    required this.threshold,
    required this.projects,
    required this.onSwitcherVisibilityChanged,
  });

  final ScrollController controller;
  final double threshold;
  final List<ProjectEntity> projects;
  final ValueChanged<bool> onSwitcherVisibilityChanged;

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
        onNotification: (n) {
          if (!context.isMobile) return true;
          final visible = n.metrics.pixels <= threshold;
          onSwitcherVisibilityChanged(visible);
          return false;
        },
        child: CustomScrollView(
          controller: controller,
          slivers: [
            ...projects.asMap().entries.map(
                  (entry) => ProjectSection(
                    project: entry.value,
                    index: entry.key,
                  ),
                ),
            if (context.isMobile) ...[
              const SliverToBoxAdapter(
                child: SizedBox(height: BaseConst.base24),
              ),
            ],
          ],
        ),
      );
}
