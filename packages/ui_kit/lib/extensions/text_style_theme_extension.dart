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
    required this.h5,
    required this.h6,
    required this.inputHeadline,
    required this.inputPlaceholder,
    required this.inputTitle,
    required this.baseText,
    required this.smallText,
    required this.baseTextBold,
    required this.caption,
    required this.smallCaption,
    required this.captionBold,
    required this.buttonTitle,
  });

  /// Source Sans Pro, w600, 28, 1.14
  final TextStyle h1;

  /// Source Sans Pro, w600, 22, 1.18
  final TextStyle h2;

  /// Source Sans Pro, w600, 16, 1.13
  final TextStyle h3;

  /// Source Sans Pro, w400, 16, 1.13
  final TextStyle h4;

  /// Source Sans Pro, w400, 15, 1.2
  final TextStyle h5;

  /// Source Sans Pro, w400, 12, 1.0
  final TextStyle h6;

  /// Source Sans Pro, w400, 15, 1.33
  final TextStyle inputHeadline;

  /// Source Sans Pro, w400, 14, 1.29
  final TextStyle inputPlaceholder;

  /// Source Sans Pro, w400, 10, 1.2
  final TextStyle inputTitle;

  /// Source Sans Pro, w400, 15, 1.2
  final TextStyle baseText;

  /// Source Sans Pro, w400, 12, 1.17
  final TextStyle smallText;

  /// Source Sans Pro, w600, 14, 1.29
  final TextStyle baseTextBold;

  /// Source Sans Pro, w400, 12, 1.17
  final TextStyle caption;

  /// Source Sans Pro, w400, 10, 1.2
  final TextStyle smallCaption;

  /// Source Sans Pro, w600, 12, 1.17
  final TextStyle captionBold;

  /// Source Sans Pro, w400, 16, 1.25
  final TextStyle buttonTitle;

  @override
  ThemeExtension<TextStyleExt> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? h6,
    TextStyle? inputHeadline,
    TextStyle? inputPlaceholder,
    TextStyle? inputTitle,
    TextStyle? baseText,
    TextStyle? smallText,
    TextStyle? baseTextBold,
    TextStyle? caption,
    TextStyle? smallCaption,
    TextStyle? captionBold,
    TextStyle? buttonTitle,
  }) =>
      TextStyleExt(
        h1: h1 ?? this.h1,
        h2: h2 ?? this.h2,
        h3: h3 ?? this.h3,
        h4: h4 ?? this.h4,
        h5: h5 ?? this.h5,
        h6: h6 ?? this.h6,
        inputHeadline: inputHeadline ?? this.inputHeadline,
        inputPlaceholder: inputPlaceholder ?? this.inputPlaceholder,
        inputTitle: inputTitle ?? this.inputTitle,
        baseText: baseText ?? this.baseText,
        smallText: smallText ?? this.smallText,
        baseTextBold: baseTextBold ?? this.baseTextBold,
        caption: caption ?? this.caption,
        smallCaption: smallCaption ?? this.smallCaption,
        captionBold: captionBold ?? this.captionBold,
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
      h5: TextStyle.lerp(h5, other.h5, t)!,
      h6: TextStyle.lerp(h6, other.h6, t)!,
      inputHeadline: TextStyle.lerp(inputHeadline, other.inputHeadline, t)!,
      inputPlaceholder:
          TextStyle.lerp(inputPlaceholder, other.inputPlaceholder, t)!,
      inputTitle: TextStyle.lerp(inputTitle, other.inputTitle, t)!,
      baseText: TextStyle.lerp(baseText, other.baseText, t)!,
      smallText: TextStyle.lerp(smallText, other.smallText, t)!,
      baseTextBold: TextStyle.lerp(baseTextBold, other.baseTextBold, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      smallCaption: TextStyle.lerp(smallCaption, other.smallCaption, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      buttonTitle: TextStyle.lerp(buttonTitle, other.buttonTitle, t)!,
    );
  }
}
