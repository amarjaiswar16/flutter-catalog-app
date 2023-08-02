import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      //buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
      highlightColor: darkBluishColor,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: darkBluishColor),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      //buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
      highlightColor: lightBluishColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
