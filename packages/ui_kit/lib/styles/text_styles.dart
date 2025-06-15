import 'package:flutter/material.dart';

import '../assets/colors.gen.dart';
import '../assets/fonts.gen.dart';

/// Typography styles for the app (Title 1, Title 2, Title 3 / Semibold, etc.)
/// used from the design layout of the UI kit.
sealed class UiKitTextStyles {
  ///* Headline

  /// Typography: H1
  static TextStyle get h1 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w900,
        fontSize: 34,
        height: 1.14,
        color: UiKitColor.darkGray,
      );

  /// Typography: H2
  static TextStyle get h2 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 1.18,
        color: UiKitColor.darkGray,
      );

  /// Typography: H3
  static TextStyle get h3 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.13,
        color: UiKitColor.darkGray,
      );

  /// Typography: H4
  static TextStyle get h4 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.13,
        color: UiKitColor.darkGray,
      );

  /// Typography: H5
  static TextStyle get h5 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.2,
        color: UiKitColor.darkGray,
      );

  /// Typography: H6
  static TextStyle get h6 => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: UiKitColor.darkGray,
      );

  ///* Input

  /// Typography: Headline
  static TextStyle get inputHeadline => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.33,
        color: UiKitColor.gray,
      );

  /// Typography: Body
  static TextStyle get inputPlaceholder => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.29,
      );

  /// Typography: Title
  static TextStyle get inputTitle => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.2,
      );

  ///* Text

  /// Typography: Base text
  static TextStyle get baseText => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.2,
      );

  /// Typography: Small text
  static TextStyle get smallText => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.17,
        color: UiKitColor.gray,
      );

  /// Typography: Base text bold
  static TextStyle get baseTextBold => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.29,
        color: UiKitColor.darkGray,
      );

  ///* Caption

  /// Typography: Base caption
  static TextStyle get baseCaption => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.17,
      );

  /// Typography: Small caption
  static TextStyle get smallCaption => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.2,
        color: UiKitColor.darkGray,
      );

  /// Typography: Сaption bold
  static TextStyle get captionBold => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.17,
      );

  ///* Button

  /// Typography: Title
  static TextStyle get buttonTitle => const TextStyle(
        fontFamily: FontFamily.sourceSansPro,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.25,
        letterSpacing: 0.1,
      );
}
