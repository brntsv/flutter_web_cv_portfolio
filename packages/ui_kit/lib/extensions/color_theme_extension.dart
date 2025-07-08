// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Расширение для цветов
@immutable
class ColorsExt extends ThemeExtension<ColorsExt> {
  /// Расширение для цветов
  const ColorsExt({
    required this.white,
    required this.black,
    required this.transparent,
    required this.gray,
    required this.skyGray,
    required this.darkGray,
    required this.lightGray,
    required this.blue,
    required this.lightBlue,
    required this.graphiteGray,
    required this.spotifyGreen,
    required this.twitchPurpleLight,
  });

  final Color white;
  final Color black;
  final Color transparent;
  final Color gray;
  final Color skyGray;
  final Color darkGray;
  final Color lightGray;
  final Color blue;
  final Color lightBlue;
  final Color graphiteGray;
  final Color spotifyGreen;
  final Color twitchPurpleLight;
  @override
  ThemeExtension<ColorsExt> copyWith({
    Color? white,
    Color? black,
    Color? transparent,
    Color? gray,
    Color? skyGray,
    Color? darkGray,
    Color? lightGray,
    Color? blue,
    Color? lightBlue,
    Color? graphiteGray,
    Color? spotifyGreen,
    Color? twitchPurpleLight,
  }) =>
      ColorsExt(
        white: white ?? this.white,
        black: black ?? this.black,
        transparent: transparent ?? this.transparent,
        gray: gray ?? this.gray,
        skyGray: skyGray ?? this.skyGray,
        darkGray: darkGray ?? this.darkGray,
        lightGray: lightGray ?? this.lightGray,
        blue: blue ?? this.blue,
        lightBlue: lightBlue ?? this.lightBlue,
        graphiteGray: graphiteGray ?? this.graphiteGray,
        spotifyGreen: spotifyGreen ?? this.spotifyGreen,
        twitchPurpleLight: twitchPurpleLight ?? this.twitchPurpleLight,
      );

  @override
  ThemeExtension<ColorsExt> lerp(
    covariant ThemeExtension<ColorsExt>? other,
    double t,
  ) {
    if (other is! ColorsExt) return this;
    return ColorsExt(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      skyGray: Color.lerp(skyGray, other.skyGray, t)!,
      darkGray: Color.lerp(darkGray, other.darkGray, t)!,
      lightGray: Color.lerp(lightGray, other.lightGray, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      graphiteGray: Color.lerp(graphiteGray, other.graphiteGray, t)!,
      spotifyGreen: Color.lerp(spotifyGreen, other.spotifyGreen, t)!,
      twitchPurpleLight: Color.lerp(twitchPurpleLight, other.twitchPurpleLight, t)!,
    );
  }
}
