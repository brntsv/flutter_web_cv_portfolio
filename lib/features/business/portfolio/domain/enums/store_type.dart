import 'package:ui_kit/assets/assets.gen.dart';

/// {@template store_type.enum}
/// Тип магазина
/// {@endtemplate}
enum StoreType {
  /// App Store
  appStore,

  /// Google Play
  googlePlay,

  /// Rustore
  rustore,

  /// App Gallery
  appGallery;

  /// Получить ссылку на бейдж с учётом контекста проекта
  /// - Для Google Play: если есть только App Store + Google Play → чёрный бейдж
  ///   иначе (если есть другие сторы) → белый бейдж
  String badgeUrl({
    required bool isRu,
    bool hasAppStore = false,
    bool hasRustore = false,
    bool hasAppGallery = false,
  }) =>
      switch (this) {
        // App Store
        appStore => isRu
            ? Assets.images.storeBadges.appstoreRu
            : Assets.images.storeBadges.appstoreEn,

        // Google Play
        googlePlay => isRu
            ? Assets.images.storeBadges.gplayRu
            : Assets.images.storeBadges.gplayEn,

        // RuStore
        rustore => isRu
            ? Assets.images.storeBadges.rustoreRu
            : Assets.images.storeBadges.rustoreEn,

        // AppGallery
        appGallery => isRu
            ? Assets.images.storeBadges.appgalleryRu
            : Assets.images.storeBadges.appgalleryEn,
      };
}
