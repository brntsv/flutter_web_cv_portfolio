import 'package:flutter/material.dart';

/// Расширение для текстовых стилей
@immutable
class TextStyleExt extends ThemeExtension<TextStyleExt> {
  /// Расширение для текстовых стилей
  const TextStyleExt({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.baseTextDesc,
    required this.baseText,
    required this.baseTextBold,
    required this.buttonTitle,
  });

  /// Onder, w500, 18
  final TextStyle h1;

  /// Inter, w600, 22, 1.18
  final TextStyle h2;

  /// Inter, w600, 16, 1.13
  final TextStyle h3;

  /// Onder, w500, 18
  final TextStyle h4;

  /// Mabry Pro, w400, 20
  final TextStyle baseTextDesc;

  /// Inter, w400, 15, 1.2
  final TextStyle baseText;

  /// Inter, w600, 12, 1.17
  final TextStyle baseTextBold;

  /// Inter, w400, 16, 1.25
  final TextStyle buttonTitle;

  @override
  ThemeExtension<TextStyleExt> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? baseTextDesc,
    TextStyle? baseText,
    TextStyle? baseTextBold,
    TextStyle? buttonTitle,
  }) =>
      TextStyleExt(
        h1: h1 ?? this.h1,
        h2: h2 ?? this.h2,
        h3: h3 ?? this.h3,
        h4: h4 ?? this.h4,
        baseTextDesc: baseTextDesc ?? this.baseTextDesc,
        baseText: baseText ?? this.baseText,
        baseTextBold: baseTextBold ?? this.baseTextBold,
        buttonTitle: buttonTitle ?? this.buttonTitle,
      );

  @override
  ThemeExtension<TextStyleExt> lerp(
    covariant ThemeExtension<TextStyleExt>? other,
    double t,
  ) {
    if (other is! TextStyleExt) return this;
    return TextStyleExt(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      baseTextDesc: TextStyle.lerp(baseTextDesc, other.baseTextDesc, t)!,
      baseText: TextStyle.lerp(baseText, other.baseText, t)!,
      baseTextBold: TextStyle.lerp(baseTextBold, other.baseTextBold, t)!,
      buttonTitle: TextStyle.lerp(buttonTitle, other.buttonTitle, t)!,
    );
  }
}
