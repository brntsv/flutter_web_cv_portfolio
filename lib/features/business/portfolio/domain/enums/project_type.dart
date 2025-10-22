import 'package:flutter/material.dart';
import 'package:ui_kit/assets/assets.gen.dart';
import 'package:ui_kit/extensions/color_theme_extension.dart';

import '../../../../../l10n/generated/app_localizations.g.dart';
import '../constants/project_store_links.dart';
import '../entities/store_badge_entity.dart';
import 'store_type.dart';

/// {@template project_type.enum}
/// Тип приложения
/// {@endtemplate}
enum ProjectType {
  /// Мука и Порядок
  flourAndOrder,

  /// Realt One
  realtOne,

  /// Novex
  novex;

  /// Путь к иконке проекта
  String get iconPath => switch (this) {
        flourAndOrder => Assets.images.projectIcons.iconFlourOrder.keyName,
        realtOne => Assets.images.projectIcons.iconRealtOne.keyName,
        novex => Assets.images.projectIcons.iconNovex.keyName,
      };

  /// Название проекта
  String projectTitle(AppLocalizations l10n) => switch (this) {
        flourAndOrder => l10n.flourAndOrder,
        realtOne => l10n.realtOne,
        novex => l10n.novex,
      };

  /// Описание проекта
  String projectDescription(AppLocalizations l10n) => switch (this) {
        flourAndOrder => l10n.flourAndOrderDescription,
        realtOne => l10n.realtOneDescription,
        novex => l10n.novexDescription,
      };

  /// Цвета градиента (зависят от темы → нужен BuildContext)
  List<Color> gradientColors(ColorsExt color) => switch (this) {
        // flourAndOrder => [
        //     color.flourAndOrderBeige,
        //     color.flourAndOrderRed.withValues(alpha: .2),
        //   ],
        novex => [
            color.novexBlue.withValues(alpha: .6),
            color.novexBlue,
          ],
        _ => []
      };

  /// Обычный цвет фона, если градиент не используется/не задан
  Color backgroundColor(ColorsExt color) => switch (this) {
        flourAndOrder => color.flourAndOrderBeige,
        realtOne => color.spotifyGreen.withValues(alpha: .3),
        novex => color.novexBlue,
      };

  /// Получить бейджи магазинов
  List<StoreBadgeEntity> badges({bool isRu = true}) {
    final storeLinks = ProjectStoreLinks.byType(this);
    if (!storeLinks.hasAny) return [];

    final items = <StoreBadgeEntity>[];

    final appStoreLink = storeLinks.appStore;
    final googlePlayLink = storeLinks.googlePlay;
    final rustoreLink = storeLinks.rustore;
    final appGalleryLink = storeLinks.appGallery;

    if (appStoreLink != null) {
      items.add(
        StoreBadgeEntity(
          imageUrl: StoreType.appStore.badgeUrl(isRu: isRu),
          linkUrl: appStoreLink,
        ),
      );
    }
    if (googlePlayLink != null) {
      items.add(
        StoreBadgeEntity(
          imageUrl: StoreType.googlePlay.badgeUrl(
            isRu: isRu,
            hasAppStore: appStoreLink != null,
            hasRustore: rustoreLink != null,
            hasAppGallery: appGalleryLink != null,
          ),
          linkUrl: googlePlayLink,
        ),
      );
    }

    if (rustoreLink != null) {
      items.add(
        StoreBadgeEntity(
          imageUrl: StoreType.rustore.badgeUrl(isRu: isRu),
          linkUrl: rustoreLink,
        ),
      );
    }
    if (appGalleryLink != null) {
      items.add(
        StoreBadgeEntity(
          imageUrl: StoreType.appGallery.badgeUrl(isRu: isRu),
          linkUrl: appGalleryLink,
        ),
      );
    }

    return items;
  }
}
