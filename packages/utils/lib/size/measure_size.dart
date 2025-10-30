import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// {@template measure_size.class}
/// Хелпер для измерения реального размера ребёнка без IntrinsicHeight
/// {@endtemplate}
class MeasureSize extends SingleChildRenderObjectWidget {
  /// {@macro measure_size.class}
  const MeasureSize({
    required this.onChange,
    required Widget child,
    super.key,
  }) : super(child: child);

  /// Callback для получения размера
  final ValueChanged<Size> onChange;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderMeasureSize(onChange);
}

class _RenderMeasureSize extends RenderProxyBox {
  _RenderMeasureSize(this.onChange);

  final ValueChanged<Size> onChange;
  Size? _oldSize;

  @override
  void performLayout() {
    super.performLayout();
    final newSize = size;
    if (_oldSize == newSize) return;
    _oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}
