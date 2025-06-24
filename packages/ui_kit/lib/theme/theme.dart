import 'package:flutter/material.dart';
import '../assets/colors.gen.dart';
import '../assets/fonts.gen.dart';
import '../extensions/color_theme_extension.dart';
import '../extensions/text_style_theme_extension.dart';
import '../styles/text_styles.dart';

/// Получить цвета
ColorsExt colors(BuildContext context) =>
    Theme.of(context).extension<ColorsExt>()!;

/// Получить текстовые стили
TextStyleExt textStyles(BuildContext context) =>
    Theme.of(context).extension<TextStyleExt>()!;

/// Тема приложения
sealed class AppTheme {
  /// Светлая тема
  static final ThemeData lightTheme = _createTheme(
    brightness: Brightness.light,
    scaffoldBackgroundColor: UiKitColor.white,
    appBarColor: UiKitColor.white,
    textColor: UiKitColor.black,
  );

  /// Темная тема
  static final ThemeData darkTheme = _createTheme(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: UiKitColor.black,
    appBarColor: UiKitColor.black,
    textColor: UiKitColor.white,
  );

  static ThemeData _createTheme({
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    required Color appBarColor,
    required Color textColor,
  }) =>
      ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.sourceSansPro,
        colorSchemeSeed: brightness == Brightness.light
            ? UiKitColor.white
            : UiKitColor.black,
        brightness: brightness,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: _createAppBarTheme(appBarColor, textColor),
        checkboxTheme: _createCheckboxTheme(),
        textButtonTheme: _createTextButtonTheme(textColor),
        bottomSheetTheme: _createBottomSheetTheme(appBarColor),
        textSelectionTheme: _createTextSelectionTheme(),
        primaryTextTheme: TextTheme(titleMedium: UiKitTextStyles.h1),
        scrollbarTheme: _createScrollbarTheme(),
        outlinedButtonTheme: _createOutlinedButtonTheme(),
        splashColor: UiKitColor.transparent,
        highlightColor: UiKitColor.transparent,
        extensions: [
          _createUiKitColorsExt(),
          _createTextStyleExt(),
        ],
      );

  static AppBarTheme _createAppBarTheme(
    Color backgroundColor,
    Color textColor,
  ) =>
      AppBarTheme(
        color: backgroundColor,
        elevation: 0,
        surfaceTintColor: backgroundColor,
        centerTitle: true,
        titleTextStyle: UiKitTextStyles.baseText.copyWith(color: textColor),
      );

  static CheckboxThemeData _createCheckboxTheme() => const CheckboxThemeData(
        visualDensity: VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  static TextButtonThemeData _createTextButtonTheme(Color textColor) =>
      TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(textColor),
          textStyle: WidgetStatePropertyAll(UiKitTextStyles.baseText),
        ),
      );

  static BottomSheetThemeData _createBottomSheetTheme(Color backgroundColor) =>
      BottomSheetThemeData(
        backgroundColor: backgroundColor,
        modalBackgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
      );

  static TextSelectionThemeData _createTextSelectionTheme() =>
      const TextSelectionThemeData(
        cursorColor: UiKitColor.darkGray,
      );

  static ScrollbarThemeData _createScrollbarTheme() => ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(UiKitColor.gray),
        radius: const Radius.circular(8),
      );

  static OutlinedButtonThemeData _createOutlinedButtonTheme() =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(UiKitColor.skyGray),
        ),
      );

  static ColorsExt _createUiKitColorsExt() => const ColorsExt(
        white: UiKitColor.white,
        black: UiKitColor.black,
        transparent: UiKitColor.transparent,
        gray: UiKitColor.gray,
        skyGray: UiKitColor.skyGray,
        darkGray: UiKitColor.darkGray,
        lightGray: UiKitColor.lightGray,
        blue: UiKitColor.blue,
      );

  static TextStyleExt _createTextStyleExt() => TextStyleExt(
        h1: UiKitTextStyles.h1,
        h2: UiKitTextStyles.h2,
        h3: UiKitTextStyles.h3,
        h4: UiKitTextStyles.h4,
        h5: UiKitTextStyles.h5,
        h6: UiKitTextStyles.h6,
        inputHeadline: UiKitTextStyles.inputHeadline,
        inputPlaceholder: UiKitTextStyles.inputPlaceholder,
        inputTitle: UiKitTextStyles.inputTitle,
        baseText: UiKitTextStyles.baseText,
        smallText: UiKitTextStyles.smallText,
        baseTextBold: UiKitTextStyles.baseTextBold,
        caption: UiKitTextStyles.baseCaption,
        smallCaption: UiKitTextStyles.smallCaption,
        captionBold: UiKitTextStyles.captionBold,
        buttonTitle: UiKitTextStyles.buttonTitle,
      );
}
