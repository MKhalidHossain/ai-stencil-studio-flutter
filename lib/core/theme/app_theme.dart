import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(primary: AppColors.primary),

    textTheme: GoogleFonts.barlowTextTheme(
      ThemeData.light().textTheme,
    ).apply(bodyColor: AppColors.black, displayColor: AppColors.black),

    appBarTheme: AppBarThemeData(
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: AppColors.black,
      ),
    ),
  );
}
