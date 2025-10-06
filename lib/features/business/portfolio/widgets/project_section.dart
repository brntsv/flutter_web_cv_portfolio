// import 'package:flutter/material.dart';
// import 'package:ui_kit/constants/base_constants.dart';
// import 'package:ui_kit/theme/theme.dart';

// import 'iphone_mockup.dart';

// /// Модель данных для одного проекта
// class ProjectData {
//   const ProjectData({
//     required this.title,
//     required this.description,
//     required this.gradientColors,
//     required this.screenshots,
//     this.gradientStops,
//     this.textColor,
//   });
//   final String title;
//   final String description;
//   final List<Color> gradientColors;
//   final List<double>? gradientStops;
//   final Color? textColor;

//   final List<Widget> screenshots;
// }

// /// {@template project_section}
// /// Секция (сливер) для одного проекта в портфолио.
// /// {@endtemplate}
// class ProjectSection extends StatelessWidget {
//   /// {@macro project_section}
//   const ProjectSection({required this.project, super.key});

//   /// Данные проекта для отображения.
//   final ProjectData project;

//   @override
//   Widget build(BuildContext context) {
//     final color = colors(context);
//     final textStyle = textStyles(context);
//     return SliverToBoxAdapter(
//       child: Container(
//         height: 800,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: project.gradientColors,
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: project.gradientStops,
//           ),
//         ),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             // Контент
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: BaseConst.base40,
//                 vertical: BaseConst.base110,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Spacer(),
//                   Expanded(
//                     flex: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       spacing: BaseConst.base20,
//                       children: [
//                         Text(
//                           project.title,
//                           style: textStyle.h1.copyWith(
//                             color: project.textColor ?? color.white,
//                           ),
//                         ),
//                         Text(
//                           project.description,
//                           style: textStyle.h2.copyWith(
//                             color: project.textColor ?? color.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Center(
//                       child: IphoneMockup(screenshots: project.screenshots),
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_kit/constants/base_constants.dart';
import 'package:ui_kit/extensions/build_context_extension.dart';
import 'package:ui_kit/theme/theme.dart';

import 'iphone_mockup.dart';

/// Модель данных для одного проекта
class ProjectData {
  const ProjectData({
    required this.title,
    required this.description,
    required this.gradientColors,
    required this.screenshots,
    this.gradientStops,
    this.textColor,
    this.useSinusoidalGradient = false,
  });
  final String title;
  final String description;
  final List<Color> gradientColors;
  final List<double>? gradientStops;
  final Color? textColor;
  final bool useSinusoidalGradient;

  final List<Widget> screenshots;
}

/// {@template project_section}
/// Секция (сливер) для одного проекта в портфолио.
/// {@endtemplate}
class ProjectSection extends StatelessWidget {
  /// {@macro project_section}
  const ProjectSection({required this.project, super.key});

  /// Данные проекта для отображения.
  final ProjectData project;

  @override
  Widget build(BuildContext context) {
    final color = colors(context);
    final textStyle = textStyles(context);

    final content = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Контент
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BaseConst.base40,
            vertical: BaseConst.base110,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: BaseConst.base20,
                  children: [
                    Text(
                      project.title,
                      style: textStyle.h1.copyWith(
                        color: project.textColor ?? color.white,
                      ),
                    ),
                    Text(
                      project.description,
                      style: textStyle.h2.copyWith(
                        color: project.textColor ?? color.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: BaseConst.base50,
              ), // Пространство между элементами
              Expanded(
                flex: 2,
                child: Center(
                  child: IphoneMockup(screenshots: project.screenshots),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );

    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.screenSize.height,
        child:
            project.useSinusoidalGradient && project.gradientColors.length >= 2
                ? SinusoidalGradientContainer(
                    startColor: project.gradientColors.first,
                    endColor: project.gradientColors.last,
                    child: content,
                  )
                : DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: project.gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: project.gradientStops,
                      ),
                    ),
                    child: content,
                  ),
      ),
    );
  }
}

/// {@template sinusoidal_gradient_container}
/// Контейнер, который применяет нелинейный (синусоидальный) градиент
/// от [startColor] до [endColor].
/// {@endtemplate}
class SinusoidalGradientContainer extends StatelessWidget {
  /// {@macro sinusoidal_gradient_container}
  const SinusoidalGradientContainer({
    required this.startColor,
    required this.endColor,
    this.child,
    this.curvePoints = 30, // Больше точек = более плавная кривая
    super.key,
  });

  /// Начальный цвет градиента.
  final Color startColor;

  /// Конечный цвет градиента.
  final Color endColor;

  /// Дочерний виджет.
  final Widget? child;

  /// Количество точек для аппроксимации кривой.
  final int curvePoints;

  /// Создает градиент, имитирующий синусоидальную кривую.
  Gradient _createSinusoidalGradient() {
    final colors = <Color>[];
    final stops = <double>[];

    for (var i = 0; i <= curvePoints; i++) {
      final t = i / curvePoints; // Линейное продвижение от 0.0 до 1.0
      stops.add(t);

      // Применяем функцию синусоидального смягчения
      // (sin((t * PI) - (PI / 2)) + 1) / 2 создает кривую ease-in-out
      final curvedT = (sin((t * pi) - (pi / 2)) + 1) / 2;

      // Интерполируем цвет на основе кривого продвижения
      final color = Color.lerp(startColor, endColor, curvedT);
      colors.add(color!);
    }

    return LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          gradient: _createSinusoidalGradient(),
        ),
        child: child,
      );
}
