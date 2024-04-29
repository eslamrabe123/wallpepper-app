import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';

ThemeData themeDataLight = ThemeData.light().copyWith(
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
      TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
      ),
    )),
  ),
  textTheme: GoogleFonts.nunitoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(
        color: AppColorLight.textMainColor,
      ),
    ),
  ),
  scaffoldBackgroundColor: null,
);
