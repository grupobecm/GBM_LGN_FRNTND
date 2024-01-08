import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: TextTheme(
    labelMedium: GoogleFonts.montserratAlternates(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.montserratAlternates(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
    titleMedium: GoogleFonts.montserratAlternates(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: GoogleFonts.montserratAlternates(color: const Color(0xFF6750A4), fontSize: 14, fontWeight: FontWeight.bold),
  ),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6750A4),
  onSecondary: Color(0xFFFFFFFF),
  tertiary: Color.fromARGB(255, 64, 27, 167),
  onTertiary: Color(0xFFFFFFFF),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  outline: Color(0xFF6750A4),
  background: Color(0xfff9f9f9),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  inverseSurface: Color(0xFF969ba1),
  onInverseSurface: Color(0xFFF4EFF4),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xff1f8af9),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD0BCFF),
  onPrimary: Color(0xFF381E72),
  secondary: Color(0xFFCCC2DC),
  onSecondary: Color(0xFF332D41),
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Color(0xFF492532),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  outline: Color(0xFF938F99),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  inverseSurface: Color(0xFFE6E1E5),
  onInverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
);
