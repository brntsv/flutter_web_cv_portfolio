import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/features/locale_mode/widgets/language_switcher.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:native_scroll/native_scroll.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';
import 'package:ui_kit/widgets/base/animated_text/animated_text.dart';
import 'package:ui_kit/widgets/base/buttons/base_animated_elevated_button.dart';
import 'package:ui_kit/widgets/base/images/base_icon.dart';

import '../../../navigation/router.dart';
import 'widgets/about_this_page_widget.dart';
import 'widgets/projects_widget.dart';
import 'widgets/socials_widget.dart';

/// {@template blog_page.class}
/// Страница с блогом, главная страница
/// {@endtemplate}
@RoutePage()
final class BlogPage extends StatefulWidget {
  /// {@macro blog_page.class}
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late final ScrollController _scrollController;
  bool _showSwitcher = true;

  static const double _threshold = BaseConst.base24;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        final visible = !_scrollController.hasClients ||
            _scrollController.offset <= _threshold;
        if (visible != _showSwitcher) {
          setState(() => _showSwitcher = visible);
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    return Scaffold(
      backgroundColor: color.white,
      body: Stack(
        children: [
          SelectionArea(
            child: NativeScrollBuilder(
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: BaseConst.base110,
                      horizontal: context.isMobile ? BaseConst.base28 : 0,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: context.isMobile
                            ? context.screenSize.width
                            : BaseConst.base700,
                      ),
                      child: Column(
                        spacing: BaseConst.base32,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Имя
                          AnimatedText(
                            text: l10n.yourName,
                            style: textStyle.h1,
                            appearDuration: 6,
                            appearClass: 2,
                          ),

                          /// О себе
                          AnimatedText(
                            text: l10n.aboutMeBlog,
                            style: textStyle.baseText,
                            appearDuration: 6,
                            appearClass: 2,
                          ),

                          Row(
                            spacing: BaseConst.base16,
                            children: [
                              /// Кнопка CV
                              BaseAnimatedElevatedButton(
                                title: l10n.cv,
                                backgroundColor: color.graphiteGray,
                                textColor: color.white,
                                appearDuration: 6,
                                appearClass: 3,
                                iconWidgetRight: BaseIcon(
                                  icon: Assets.images.iconLightning,
                                  color: color.spotifyGreen,
                                  size: BaseConst.base20,
                                ),
                                onPressed: () => context.push(const CvRoute()),
                              ),

                              /// Кнопка Портфолио
                              BaseAnimatedElevatedButton(
                                title: l10n.portfolio,
                                backgroundColor: color.graphiteGray,
                                textColor: color.white,
                                appearDuration: 6,
                                appearClass: 2,
                                iconWidgetRight: BaseIcon(
                                  icon: Assets.images.iconLightning,
                                  color: color.twitchPurpleLight,
                                  size: BaseConst.base20,
                                ),
                                onPressed: () => context.push(PortfolioRoute()),
                              ),
                            ],
                          ),

                          /// Проекты
                          const ProjectsWidget(),

                          /// Соцсети
                          const SocialsWidget(),

                          /// Об этой странице
                          const AboutThisPageWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: BaseConst.base48,
            right: BaseConst.base48,
            child: AnimatedOpacity(
              duration: BaseConst.duration200,
              opacity: _showSwitcher ? 1 : 0,
              child: IgnorePointer(
                ignoring: !_showSwitcher,
                child: const LanguageSwitcher(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
