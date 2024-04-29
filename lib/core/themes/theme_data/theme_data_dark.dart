import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors_dark.dart';

ThemeData themeDataDark = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(background: Colors.red),
  dialogTheme: const DialogTheme(backgroundColor: Colors.black),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
      TextStyle(
        color: AppColorDark.textInWightButton,
        fontFamily: 'Nunito',
      ),
    )),
  ),
  textTheme: GoogleFonts.nunitoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
      ),
    ),
  ),
  scaffoldBackgroundColor: null,
);
