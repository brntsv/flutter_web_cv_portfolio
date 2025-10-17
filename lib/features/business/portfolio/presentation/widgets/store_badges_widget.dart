import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/widgets/base/images/base_icon.dart';
import 'package:utils/url_launcher/url_launcher.dart';

import '../../domain/entities/store_badge_entity.dart';

/// {@template store_badges_widget.class}
/// Виджет для отображения бейджей магазинов
/// {@endtemplate}
class StoreBadgesWidget extends StatelessWidget {
  /// {@macro store_badges_widget.class}
  const StoreBadgesWidget({required this.badges, super.key});

  /// Бейджи магазинов
  final List<StoreBadgeEntity> badges;

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: BaseConst.base10,
        runSpacing: BaseConst.base10,
        children: badges
            .map(
              (b) => InkWell(
                onTap: () => UrlLauncher.openUrl(b.linkUrl),
                child: BaseIcon(
                  icon: b.imageUrl,
                  height: BaseConst.base44,
                ),
              ),
            )
            .toList(),
      );
}
