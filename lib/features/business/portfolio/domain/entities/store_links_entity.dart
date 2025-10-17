import 'package:equatable/equatable.dart';

/// {@template store_links_entity.class}
/// Ссылки на магазины
/// {@endtemplate}
final class StoreLinksEntity extends Equatable {
  /// {@macro store_links_entity.class}
  const StoreLinksEntity({
    this.appStore,
    this.googlePlay,
    this.rustore,
    this.appGallery,
  });

  /// Ссылка на App Store
  final String? appStore;

  /// Ссылка на Google Play
  final String? googlePlay;

  /// Ссылка на Rustore
  final String? rustore;

  /// Ссылка на App Gallery
  final String? appGallery;

  /// Есть ли хоть одна ссылка
  bool get hasAny =>
      appStore != null ||
      googlePlay != null ||
      rustore != null ||
      appGallery != null;

  @override
  List<Object?> get props => [
        appStore,
        googlePlay,
        rustore,
        appGallery,
      ];
}
