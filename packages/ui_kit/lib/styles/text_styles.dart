import 'package:flutter/material.dart';

import '../assets/colors.gen.dart';
import '../assets/fonts.gen.dart';

/// Typography styles for the app (Title 1, Title 2, Title 3 / Semibold, etc.)
/// used from the design layout of the UI kit.
sealed class UiKitTextStyles {
  ///* Headline

  /// Typography: H1
  static TextStyle get h1 => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w900,
        fontSize: 34,
        height: 1.14,
        color: UiKitColor.darkGray,
      );

  /// Typography: H2
  static TextStyle get h2 => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 1.18,
        color: UiKitColor.darkGray,
      );

  /// Typography: H3
  static TextStyle get h3 => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.13,
        color: UiKitColor.darkGray,
      );

  /// Typography: H4
  static TextStyle get h4 => const TextStyle(
        fontFamily: FontFamily.onder,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: UiKitColor.darkGray,
      );

  ///* Text

  /// Typography: Base text desc (portfolio)
  static TextStyle get baseTextDesc => const TextStyle(
        fontFamily: FontFamily.mabryPro,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: UiKitColor.darkGray,
      );

  /// Typography: Base text
  static TextStyle get baseText => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.2,
        color: UiKitColor.darkGray,
      );

  /// Typography: Base text bold
  static TextStyle get baseTextBold => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.17,
        color: UiKitColor.darkGray,
      );

  ///* Button

  /// Typography: Title
  static TextStyle get buttonTitle => const TextStyle(
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.25,
        letterSpacing: 0.1,
        color: UiKitColor.darkGray,
      );
}
