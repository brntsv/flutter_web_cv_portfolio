import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;

import '../../../../../constants/base_constants.dart';
import '../../../../../theme/theme.dart';
import '../shimmers/base_shimmer.dart';

/// {@template base_image.class}
/// Базовый виджет изображения с поддержкой сети, ассетов и файлов.
/// Автоматически обрабатывает перезагрузку изображений после восстановления
/// приложения из фона.
/// {@endtemplate}
class BaseImage extends StatelessWidget {
  /// {@macro base_image.class}
  const BaseImage._(
    this._imageType, {
    this.imageProvider,
    super.key,
    this.size,
    this.borderRadius,
    this.isCircle = false,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.placeholder,
    this.compressionRatio,
    this.onLoaded,
    this.package,
    this.filterQuality = FilterQuality.low,
  });

  /// Сетевое изображение
  factory BaseImage.network({
    required String? url,
    Key? key,
    Size? size,
    BorderRadius? borderRadius,
    bool isCircle = false,
    double? compressionRatio,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    Widget? placeholder,
    VoidCallback? onLoaded,
  }) {
    if (url == null || url.isEmpty) {
      return BaseImage._(
        _ImageType.empty,
        key: key,
        size: size,
        borderRadius: borderRadius,
        isCircle: isCircle,
        placeholder: placeholder,
      );
    }

    final isSvg = path.extension(url).toLowerCase() == BaseConst.svgFormat;

    return BaseImage._(
      isSvg ? _ImageType.svg : _ImageType.network,
      key: key,
      imageProvider: url,
      size: size,
      borderRadius: borderRadius,
      isCircle: isCircle,
      fit: fit,
      alignment: alignment,
      placeholder: placeholder,
      compressionRatio: compressionRatio,
      onLoaded: onLoaded,
    );
  }

  /// Ассет изображение
  factory BaseImage.asset({
    required String assetPath,
    Key? key,
    Size? size,
    BorderRadius? borderRadius,
    bool isCircle = false,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    Widget? placeholder,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
  }) =>
      BaseImage._(
        _ImageType.asset,
        key: key,
        imageProvider: assetPath,
        size: size,
        borderRadius: borderRadius,
        isCircle: isCircle,
        fit: fit,
        alignment: alignment,
        placeholder: placeholder,
        package: package,
        filterQuality: filterQuality,
      );

  /// Провайдер изображения
  final Object? imageProvider;

  /// Тип изображения
  final _ImageType _imageType;

  /// Размер
  final Size? size;

  /// Радиус
  final BorderRadius? borderRadius;

  /// Круглый
  final bool isCircle;

  /// Фит
  final BoxFit fit;

  /// Выравнивание
  final Alignment alignment;

  /// Плейсхолдер
  final Widget? placeholder;

  /// Сжатие
  final double? compressionRatio;

  /// Коллбэк на загрузку
  final VoidCallback? onLoaded;

  /// Пакет
  final String? package;

  /// Качество
  final FilterQuality filterQuality;

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage();

    if (!isCircle && borderRadius == null) {
      return SizedBox(
        width: size?.width,
        height: size?.height,
        child: imageWidget,
      );
    }

    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      clipBehavior: Clip.antiAlias,
      child: imageWidget,
    );
  }

  Widget _buildImage() {
    final imageKey =
        '${imageProvider}_${_ImageLifecycleTracker.instance.resumeCounter}';

    switch (_imageType) {
      case _ImageType.empty:
        return _buildPlaceholder();

      case _ImageType.svg:
        return SvgPicture.network(
          key: ValueKey('svg_$imageKey'),
          imageProvider! as String,
          fit: fit,
          alignment: alignment,
          width: size?.width,
          height: size?.height,
        );

      case _ImageType.network:
        return ExtendedImage.network(
          key: ValueKey('network_$imageKey'),
          imageProvider! as String,
          fit: fit,
          alignment: alignment,
          width: size?.width,
          height: size?.height,
          cacheMaxAge: const Duration(days: 3),
          compressionRatio: compressionRatio,
          loadStateChanged: _handleLoadStateChanged,
        );

      case _ImageType.asset:
        return Image.asset(
          key: ValueKey('asset_$imageKey'),
          imageProvider! as String,
          fit: fit,
          alignment: alignment,
          width: size?.width,
          height: size?.height,
          package: package,
          filterQuality: filterQuality,
        );
    }
  }

  Widget _buildPlaceholder() => Center(
        child: placeholder ?? const SizedBox.shrink(),
      );

  Widget? _handleLoadStateChanged(ExtendedImageState state) =>
      switch (state.extendedImageLoadState) {
        LoadState.loading => _BaseImageLoadingWidget(
            size: size,
            borderRadius: borderRadius,
            isCircle: isCircle,
          ),
        LoadState.failed => _BaseImageErrorWidget(
            state: state,
            placeholder: placeholder,
          ),
        LoadState.completed => _BaseImageCompletedWidget(
            state: state,
            size: size,
            fit: fit,
            alignment: alignment,
            onLoaded: onLoaded,
          ),
      };
}

enum _ImageType { network, svg, asset, empty }

/// Глобальный трекер lifecycle. Управляется из `_BaseImageErrorWidgetState`.
class _ImageLifecycleTracker {
  _ImageLifecycleTracker._();
  static final _instance = _ImageLifecycleTracker._();
  static _ImageLifecycleTracker get instance => _instance;

  int _resumeCounter = 0;
  int get resumeCounter => _resumeCounter;

  void appResumed() {
    _resumeCounter++;
  }
}

/// Виджет состояния загрузки изображения
class _BaseImageLoadingWidget extends StatelessWidget {
  const _BaseImageLoadingWidget({
    this.size,
    this.borderRadius,
    this.isCircle = false,
  });

  final Size? size;
  final BorderRadius? borderRadius;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    return BaseShimmer(
      child: Container(
        width: size?.width,
        height: size?.height,
        decoration: BoxDecoration(
          color: color.lightGray,
          borderRadius: borderRadius,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }
}

/// Виджет состояния ошибки, который умеет сам себя перезагружать.
class _BaseImageErrorWidget extends StatefulWidget {
  const _BaseImageErrorWidget({required this.state, this.placeholder});

  final ExtendedImageState state;
  final Widget? placeholder;

  @override
  State<_BaseImageErrorWidget> createState() => _BaseImageErrorWidgetState();
}

class _BaseImageErrorWidgetState extends State<_BaseImageErrorWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Проверяем состояние сразу при создании виджета ошибки
    _checkAndReload();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _ImageLifecycleTracker.instance.appResumed();
      // Запускаем проверку и перезагрузку для видимых виджетов
      _checkAndReload();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _checkAndReload() {
    // Используем postFrameCallback, чтобы безопасно вызвать reLoadImage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.state.extendedImageLoadState == LoadState.failed) {
        widget.state.reLoadImage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    return Center(
      child: widget.placeholder ??
          GestureDetector(
            onTap: widget.state.reLoadImage,
            child: Icon(
              Icons.rotate_left_rounded,
              color: color.black,
              size: BaseConst.base42,
            ),
          ),
    );
  }
}

/// Виджет завершенного состояния изображения
class _BaseImageCompletedWidget extends StatelessWidget {
  const _BaseImageCompletedWidget({
    required this.state,
    this.size,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.onLoaded,
  });

  final ExtendedImageState state;
  final Size? size;
  final BoxFit fit;
  final Alignment alignment;
  final VoidCallback? onLoaded;

  @override
  Widget build(BuildContext context) {
    onLoaded?.call();

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: .3, end: 1),
      duration: BaseConst.duration200,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: ExtendedRawImage(
        image: state.extendedImageInfo?.image,
        width: size?.width,
        height: size?.height,
        fit: fit,
        alignment: alignment,
      ),
    );
  }
}
