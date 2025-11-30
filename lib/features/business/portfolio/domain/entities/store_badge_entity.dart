import 'package:equatable/equatable.dart';

/// {@template store_badge_entity.class}
/// Ссылка на стор с данными для бейджа
/// {@endtemplate}
final class StoreBadgeEntity extends Equatable {
  /// {@macro store_badge_entity.class}
  const StoreBadgeEntity({
    required this.imageUrl,
    required this.linkUrl,
  });

  /// Путь к изображению бейджа
  final String imageUrl;

  /// Путь к ссылке на магазин
  final String linkUrl;

  @override
  List<Object?> get props => [
        imageUrl,
        linkUrl,
      ];
}
