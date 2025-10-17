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
        // App Store — обычный выбор по локали
        appStore => isRu
            ? Assets.images.storeBadges.appstoreRu
            : Assets.images.storeBadges.appstoreEn,

        // Google Play — правило выбора чёрного/белого бейджа по контексту
        googlePlay when hasAppStore && !hasRustore && !hasAppGallery => isRu
            ? Assets.images.storeBadges.gplayBlackRu
            : Assets.images.storeBadges.gplayBlackEn,
        googlePlay => isRu
            ? Assets.images.storeBadges.gplayRu
            : Assets.images.storeBadges.gplayEn,

        // RuStore — один вариант
        rustore => Assets.images.storeBadges.rustoreRu,

        // AppGallery — выбор по локали
        appGallery => isRu
            ? Assets.images.storeBadges.appgalleryRu
            : Assets.images.storeBadges.appgalleryEn,
      };
}
