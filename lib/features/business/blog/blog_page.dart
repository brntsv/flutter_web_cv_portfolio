import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/l10n/localization_extension.dart';
import 'package:flutter_web/features/locale_mode/widgets/language_switcher.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';

import '../../navigation/router.dart';
import '../cv/widgets/animated_text.dart';
import '../cv/widgets/animated_text_with_links.dart';
import 'widgets/animated_clickable_text.dart';

/// {@template blog_page.class}
/// Страница с блогом, главная страница
/// {@endtemplate}
@RoutePage()
final class BlogPage extends StatelessWidget {
  /// {@macro blog_page.class}
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = colors(context);
    final textStyle = textStyles(context);

    return Scaffold(
      backgroundColor: color.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: BaseConst.base130,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: BaseConst.base700,
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
                                    const PortfolioRoute(),
                                  ),
                                ),
                                AnimatedClickableText(
                                  text: l10n.realtOne,
                                  description: l10n.realtOneDesc,
                                  appearDuration: 6,
                                  appearClass: 2,
                                  onTap: () => context.push(
                                    const PortfolioRoute(),
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
                      ),

                      /// Об этой странице
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: BaseConst.base12,
                        children: [
                          AnimatedText(
                            text: l10n.aboutThisPage,
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
                                AnimatedTextWithLinks(
                                  text: l10n.blogFooterDesc,
                                  appearDuration: 6,
                                  appearClass: 2,
                                ),
                                AnimatedTextWithLinks(
                                  text: l10n.blogFooterDesc2,
                                  appearDuration: 6,
                                  appearClass: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
