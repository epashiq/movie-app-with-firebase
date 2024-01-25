import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color textInverse;
  final Color textSubtle;
  final Color textSubtlest;
  final Color backgroundDanger;
  final Color appbarTxtClr;
  final Color blackClr;
  final Color whtClr;

  AppColorExtension({
    required this.primary,
    required this.secondary,
    required this.text,
    required this.textInverse,
    required this.textSubtle,
    required this.textSubtlest,
    required this.backgroundDanger,
    required this.appbarTxtClr,
    required this.blackClr,
    required this.whtClr
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
    Color? textInverse,
    Color? textSubtle,
    Color? textSubtlest,
    Color? backgroundDanger,
    Color? appbarTxtClr,
    Color? blackClr,
    Color? whtClr,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
      textInverse: textInverse ?? this.textInverse,
      textSubtle: textSubtle ?? this.textSubtle,
      textSubtlest: textSubtlest ?? this.textSubtlest,
      backgroundDanger: backgroundDanger ?? this.backgroundDanger,
      appbarTxtClr:appbarTxtClr?? this.appbarTxtClr,
      blackClr: blackClr?? this.blackClr,
      whtClr: whtClr?? this.whtClr,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }

    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      text: Color.lerp(text, other.text, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      textSubtlest: Color.lerp(textSubtlest, other.textSubtlest, t)!,
      backgroundDanger:
          Color.lerp(backgroundDanger, other.backgroundDanger, t)!,
          appbarTxtClr:Color.lerp(appbarTxtClr, other.appbarTxtClr, t)!,
          blackClr: Color.lerp(blackClr, other.blackClr, t)!,
          whtClr: Color.lerp(whtClr, other.whtClr, t)!
    );
  }
}