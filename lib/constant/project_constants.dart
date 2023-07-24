import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectConstants {
  static const MaterialColor primarySwatch = Colors.indigo;

  static const String appName = 'Grade Average';

  static TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: primarySwatch,
  );
  static TextStyle gradeCountBodyStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primarySwatch,
  );
  static TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: primarySwatch,
  );

  static final BorderRadius borderRadius = BorderRadius.circular(16);

  static const EdgeInsetsGeometry dropdownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsetsGeometry horizontalPaddingNormal = EdgeInsets.symmetric(horizontal: 8);
}
