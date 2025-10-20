/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon-left-arrow.svg
  String get iconLeftArrow =>
      'packages/ui_kit/assets/images/icon-left-arrow.svg';

  /// File path: assets/images/icon-lightning.svg
  String get iconLightning =>
      'packages/ui_kit/assets/images/icon-lightning.svg';

  /// Directory path: assets/images/project_icons
  $AssetsImagesProjectIconsGen get projectIcons =>
      const $AssetsImagesProjectIconsGen();

  /// Directory path: assets/images/store_badges
  $AssetsImagesStoreBadgesGen get storeBadges =>
      const $AssetsImagesStoreBadgesGen();

  /// List of all assets
  List<String> get values => [iconLeftArrow, iconLightning];
}

class $AssetsImagesProjectIconsGen {
  const $AssetsImagesProjectIconsGen();

  /// File path: assets/images/project_icons/icon-flour-order.png
  AssetGenImage get iconFlourOrder =>
      const AssetGenImage('assets/images/project_icons/icon-flour-order.png');

  /// File path: assets/images/project_icons/icon-novex.png
  AssetGenImage get iconNovex =>
      const AssetGenImage('assets/images/project_icons/icon-novex.png');

  /// File path: assets/images/project_icons/icon-realt-one.png
  AssetGenImage get iconRealtOne =>
      const AssetGenImage('assets/images/project_icons/icon-realt-one.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconFlourOrder, iconNovex, iconRealtOne];
}

class $AssetsImagesStoreBadgesGen {
  const $AssetsImagesStoreBadgesGen();

  /// File path: assets/images/store_badges/appgallery_en.svg
  String get appgalleryEn =>
      'packages/ui_kit/assets/images/store_badges/appgallery_en.svg';

  /// File path: assets/images/store_badges/appgallery_ru.svg
  String get appgalleryRu =>
      'packages/ui_kit/assets/images/store_badges/appgallery_ru.svg';

  /// File path: assets/images/store_badges/appstore_en.svg
  String get appstoreEn =>
      'packages/ui_kit/assets/images/store_badges/appstore_en.svg';

  /// File path: assets/images/store_badges/appstore_ru.svg
  String get appstoreRu =>
      'packages/ui_kit/assets/images/store_badges/appstore_ru.svg';

  /// File path: assets/images/store_badges/gplay_black_en.svg
  String get gplayBlackEn =>
      'packages/ui_kit/assets/images/store_badges/gplay_black_en.svg';

  /// File path: assets/images/store_badges/gplay_black_ru.svg
  String get gplayBlackRu =>
      'packages/ui_kit/assets/images/store_badges/gplay_black_ru.svg';

  /// File path: assets/images/store_badges/gplay_en.svg
  String get gplayEn =>
      'packages/ui_kit/assets/images/store_badges/gplay_en.svg';

  /// File path: assets/images/store_badges/gplay_ru.svg
  String get gplayRu =>
      'packages/ui_kit/assets/images/store_badges/gplay_ru.svg';

  /// File path: assets/images/store_badges/rustore_ru.svg
  String get rustoreRu =>
      'packages/ui_kit/assets/images/store_badges/rustore_ru.svg';

  /// List of all assets
  List<String> get values => [
        appgalleryEn,
        appgalleryRu,
        appstoreEn,
        appstoreRu,
        gplayBlackEn,
        gplayBlackRu,
        gplayEn,
        gplayRu,
        rustoreRu
      ];
}

class Assets {
  Assets._();

  static const String package = 'ui_kit';

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  static const String package = 'ui_kit';

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/ui_kit/$_assetName';
}
