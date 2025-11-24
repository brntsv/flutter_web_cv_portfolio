import '../entities/store_links_entity.dart';
import '../enums/project_type.dart';

/// {@template project_store_links.class}
/// Ссылки на магазины проектов
/// {@endtemplate}
final class ProjectStoreLinks {
  const ProjectStoreLinks._();

  /// Ссылки на проект Мука и Порядок
  static const StoreLinksEntity flourAndOrder = StoreLinksEntity(
    rustore: 'https://www.rustore.ru/catalog/app/com.flour.order',
  );

  /// Ссылки на проект Realt One
  static const StoreLinksEntity realtOne = StoreLinksEntity(
    appStore: 'https://apps.apple.com/us/app/realt-one/id6742776096',
    googlePlay:
        'https://play.google.com/store/apps/details?id=com.realtone.realt_one',
  );

  /// Ссылки на проект Novex
  static const StoreLinksEntity novex = StoreLinksEntity(
    appStore:
        'https://apps.apple.com/ru/app/%D0%BDovex-%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0-%D0%B8-%D0%B0%D0%BA%D1%86%D0%B8%D0%B8/id1608874837',
    googlePlay:
        'https://play.google.com/store/apps/details?id=com.creonit.novex',
    rustore: 'https://www.rustore.ru/catalog/app/com.creonit.novex',
    appGallery: 'https://appgallery.huawei.com/app/C107281171',
  );

  /// Получить ссылки на проект по типу
  static StoreLinksEntity byType(ProjectType type) => switch (type) {
        ProjectType.flourAndOrder => flourAndOrder,
        ProjectType.realtOne => realtOne,
        ProjectType.novex => novex,
      };
}
