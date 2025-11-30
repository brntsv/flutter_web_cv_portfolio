import 'package:ui_kit/assets/assets.gen.dart';

/// {@template store_type.enum}
/// Тип стора
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

  /// Получить ссылку на бейдж
  String badgeUrl({required bool isRu}) => switch (this) {
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
