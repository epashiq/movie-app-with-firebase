import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/core/theme/color_palette.dart';
import 'package:movie_app_clean_architecture/core/theme/extension/color_extension.dart';
import 'package:movie_app_clean_architecture/core/theme/extension/space_extension.dart';
import 'package:movie_app_clean_architecture/core/theme/extension/typhography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
        primary: Colors.yellow,
        secondary: AppColorPalette.yellow100,
        text: AppColorPalette.grey900,
        textInverse: Colors.white,
        textSubtle: AppColorPalette.grey700,
        textSubtlest: AppColorPalette.grey500,
        backgroundDanger: Colors.blue,
        appbarTxtClr: Colors.white,
        blackClr: Colors.black,
        whtClr: Colors.white),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
