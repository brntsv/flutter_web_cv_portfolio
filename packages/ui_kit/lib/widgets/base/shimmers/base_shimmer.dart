// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../../styles/gradients.dart';

// /// {@template base_shimmer.class}÷
// /// Базовый шиммер
// /// {@endtemplate}
// class BaseShimmer extends StatelessWidget {
//   /// {@macro base_shimmer.class}
//   const BaseShimmer({
//     required this.child,
//     this.enabled = true,
//     super.key,
//   });

//   /// Дочерний виджет
//   final Widget child;

//   /// Флаг, определяющий, должен ли шиммер быть включен
//   final bool enabled;

//   @override
//   Widget build(BuildContext context) {
//     if (!enabled) return child;

//     return Shimmer(
//       gradient: UiKitGradients.shimmer(context),
//       child: child,
//     );
//   }
// }
