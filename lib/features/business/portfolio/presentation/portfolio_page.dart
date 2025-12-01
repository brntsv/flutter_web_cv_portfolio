import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:native_web_scroll/native_web_scroll.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/buttons/base_icon_button.dart';

import '../../common/presentation/mixins/switcher_visibility_mixin.dart';
import '../../common/presentation/widgets/top_right_language_switcher.dart';
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
  late final List<ProjectType> _projects;

  // Ключи для сливеров-секций с проектами
  final Map<ProjectType, GlobalKey> _itemKeys = {};

  static const double _threshold = BaseConst.base64;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _projects = [
      ProjectType.flourAndOrder,
      ProjectType.realtOne,
      ProjectType.novex,
    ];

    // создаём ключи для всех проектов
    for (final p in _projects) {
      _itemKeys[p] = GlobalKey();
    }

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
    final i = _projects.indexWhere((e) => e == type);
    return i >= 0 ? i : null;
  }

  void _scrollToIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final project = _projects[index];
      final key = _itemKeys[project];
      final ctx = key?.currentContext;
      if (ctx == null) return;

      final renderObject = ctx.findRenderObject();
      if (renderObject is! RenderSliver) return;

      final viewport = RenderAbstractViewport.of(renderObject);

      // offset, при котором верх секции окажется у верхнего края вьюпорта
      final target = viewport.getOffsetToReveal(renderObject, 0).offset;

      _scrollController.jumpTo(target);
    });
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
            child: NativeScrollBuilder(
              controller: _scrollController,
              builder: (context, scrollController) => _PortfolioContent(
                controller: scrollController,
                threshold: _threshold,
                projects: _projects,
                onSwitcherVisibilityChanged: updateSwitcherVisibility,
                itemKeys: _itemKeys,
              ),
            ),
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
    required this.itemKeys,
  });

  final ScrollController controller;
  final double threshold;
  final List<ProjectType> projects;
  final ValueChanged<bool> onSwitcherVisibilityChanged;
  final Map<ProjectType, GlobalKey> itemKeys;

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
                    key: itemKeys[entry.value],
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
